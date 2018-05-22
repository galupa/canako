package controllers

import (
	"canako/models"
	"canako/services"
	"fmt"
	"html/template"
	"strconv"
	"time"

	"path/filepath"

	"github.com/astaxie/beego"
)

type InfoController struct {
	BaseController
}

func (c *InfoController) NestPrepare() {
	if !c.IsLogin {
		c.Ctx.Redirect(302, c.LoginPath())
		return
	}
}

// @router /:key [get]
func (c *InfoController) Index() {
	var idx int64
	beego.ReadFromRequest(&c.Controller)
	idx, _ = c.GetInt64("idx")
	_, err := c.GetInt("userinfo")

	if err != nil {
		info, err := services.GetInfo(idx)
		if err == nil {
			c.Data["info"] = info
		}
	} else {
		info, err := services.GetUserInfo(idx)
		if err == nil {
			c.Data["info"] = info
		}
	}

	c.Controller.TplName = "info/view.tpl"
}

// @router info/all [get]
func (c *InfoController) All() {
	c.Controller.TplName = "info/all.tpl"
	c.Data["infos"] = services.GetAllInfo()
	c.Data["userinfos"] = services.GetAllUserInfoByUser(c.GetSession("userinfo").(int64))
}

// @router /create [get]
func (c *InfoController) CreateForm() {
	c.Controller.TplName = "info/create.tpl"
	c.Data["xsrfdata"] = template.HTML(c.Controller.XSRFFormHTML())
	users := services.GetAllUser()
	c.Data["users"] = users
	if !c.Controller.Ctx.Input.IsPost() {
		return
	}

	var err error
	flash := beego.NewFlash()

	u := &models.Info{}
	if err = c.ParseForm(u); err != nil {
		flash.Error("Info invalid!")
		flash.Store(&c.Controller)
		return
	}
	u.Date, err = time.Parse("02/01/2006 03:04PM", c.GetString("Date"))
	fmt.Println(err)
	u.End, err = time.Parse("02/01/2006 03:04PM", c.GetString("End"))

	fmt.Println(u)
	fmt.Println(c.GetString("End"))
	fmt.Println(c.GetString("Date"))
	if err = models.IsValid(u); err != nil {
		flash.Error(err.Error())
		flash.Store(&c.Controller)
		return
	}
	target := c.GetStrings("target")
	file, header, er := c.GetFile("file")
	fmt.Println(header)
	fmt.Println(er)
	if er == nil {
		u.Image = filepath.Ext(header.Filename)
	}

	if len(target) == 0 {
		flash.Error("Please select target!")
		flash.Store(&c.Controller)
		return
	} else if len(target) == 1 && target[0] == "all" {
		id, err := services.CreateInfo(u)
		if err != nil || id < 1 {
			flash.Warning(err.Error())
			flash.Store(&c.Controller)
			return
		}
		if file != nil && er == nil {
			// save to server
			e := c.SaveToFile("file", "static/info/"+strconv.FormatInt(id, 10)+
				u.Image)
			beego.Trace(e)
		}
	} else {
		for _, element := range target {
			id, _ := strconv.ParseInt(element, 10, 64)
			userinfo := models.UserInfo{
				Info:  u.Info,
				User:  &models.User{Id: id},
				Date:  u.Date,
				End:   u.End,
				Image: "userinfo" + u.Image,
			}
			id, _ = services.CreateUserInfo(&userinfo)
			if file != nil && er == nil {
				// save to server
				e := c.SaveToFile("file", "static/info/"+strconv.FormatInt(id, 10)+
					userinfo.Image)
				beego.Trace(e)
			}
		}

	}

	flash.Success("New Info Created")
	flash.Store(&c.Controller)
}
