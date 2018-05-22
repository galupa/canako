package controllers

import (
	"canako/models"
	"canako/services"
	"time"

	"github.com/astaxie/beego"
)

type ReportController struct {
	BaseController
}

func (c *ReportController) NestPrepare() {
	if !c.IsLogin {
		c.Ctx.Redirect(302, c.LoginPath())
		return
	}
}

// func (c *UsersController) NestFinish() {}
// @router /:key [get]
func (c *ReportController) Index() {
	var idx int64
	beego.ReadFromRequest(&c.Controller)
	idx, _ = c.GetInt64("idx", 0)
	if idx != 0 {
		c.Data["previous"] = idx - 1
		c.Data["next"] = idx + 1
	} else {
		c.Data["previous"] = 0
		c.Data["next"] = 1
	}
	email := c.GetString("email")
	if email != "" {
		report, err := services.GetReport(email, idx)
		if err == nil {
			c.Data["report"] = report
			c.Data["email"] = email
		}
	} else {
		report, err := services.GetReport(c.Data["Userinfo"].(*models.User).Email, idx)
		if err == nil {
			c.Data["report"] = report
		}
	}
	c.Controller.TplName = "report/view.tpl"
}

// @router /create [get]
func (c *ReportController) CreateForm() {
	var err error
	flash := beego.NewFlash()
	beego.ReadFromRequest(&c.Controller)

	c.Controller.TplName = "report/create.tpl"
	if temp := c.GetString("email"); temp == "" && c.Controller.Ctx.Input.IsGet() {
		flash.Error("No user data!")
		flash.Store(&c.Controller)
		return
	}

	c.Data["email"] = c.GetString("email")
	current_time := time.Now().Local()
	c.Data["now"] = current_time.Format("2006-01-02")

	if !c.Controller.Ctx.Input.IsPost() {
		return
	}

	u := &models.Report{}
	if err = c.ParseForm(u); err != nil {
		flash.Error("Report data invalid!")
		flash.Store(&c.Controller)
		return
	}
	if err = models.IsValid(u); err != nil {
		flash.Error(err.Error())
		flash.Store(&c.Controller)
		return
	}

	file, header, er := c.GetFile("file") // where <<this>> is the controller and <<file>> the id of your form field
	if file != nil && er == nil {
		// get the filename
		u.Image = header.Filename
		// save to server
		e := c.SaveToFile("file", "static/"+u.Image)
		beego.Trace(e)
	}

	id, err := services.CreateReport(u)
	if err != nil || id < 1 {
		flash.Warning(err.Error())
		flash.Store(&c.Controller)
		return
	}

	flash.Success("New Report Created")
	flash.Store(&c.Controller)
}
