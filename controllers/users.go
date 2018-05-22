package controllers

import (
	"canako/services"

	"github.com/astaxie/beego"
)

type UsersController struct {
	BaseController
}

func (c *UsersController) NestPrepare() {
	if !c.IsLogin {
		c.Ctx.Redirect(302, c.LoginPath())
		return
	}
}

// func (c *UsersController) NestFinish() {}

func (c *UsersController) Index() {
	beego.ReadFromRequest(&c.Controller)

	c.Controller.TplName = "users/index.tpl"
}

func (c *UsersController) All() {
	beego.ReadFromRequest(&c.Controller)

	c.Controller.TplName = "users/all.tpl"
	users := services.GetAllUser()
	c.Data["users"] = users
}
