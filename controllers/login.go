package controllers

import (
	"html/template"

	"github.com/astaxie/beego"

	"canako/models"
	"canako/services"
)

type LoginController struct {
	BaseController
}

func (c *LoginController) Login() {

	if c.IsLogin {
		c.Controller.Ctx.Redirect(302, c.Controller.URLFor("DashboardController.Index"))
		return
	}

	c.Controller.TplName = "login/login.tpl"
	c.Data["xsrfdata"] = template.HTML(c.Controller.XSRFFormHTML())

	if !c.Controller.Ctx.Input.IsPost() {
		return
	}

	flash := beego.NewFlash()
	email := c.GetString("Email")
	password := c.GetString("Password")

	user, err := services.Authenticate(email, password)
	if err != nil || user.Id < 1 {
		flash.Warning(err.Error())
		flash.Store(&c.Controller)
		return
	}

	flash.Success("Success logged in")
	flash.Store(&c.Controller)

	c.SetLogin(user)

	c.Redirect(c.Controller.URLFor("DashboardController.Index"), 303)
}

func (c *LoginController) Logout() {
	c.DelLogin()
	flash := beego.NewFlash()
	flash.Success("Success logged out")
	flash.Store(&c.Controller)

	c.Controller.Ctx.Redirect(302, c.Controller.URLFor("LoginController.Login"))
}

func (c *LoginController) Signup() {
	c.Controller.TplName = "login/signup.tpl"
	c.Data["xsrfdata"] = template.HTML(c.Controller.XSRFFormHTML())

	if !c.Controller.Ctx.Input.IsPost() {
		return
	}

	var err error
	flash := beego.NewFlash()

	u := &models.User{}
	if err = c.ParseForm(u); err != nil {
		flash.Error("Signup invalid!")
		flash.Store(&c.Controller)
		return
	}
	if err = models.IsValid(u); err != nil {
		flash.Error(err.Error())
		flash.Store(&c.Controller)
		return
	}

	id, err := services.SignupUser(u)
	if err != nil || id < 1 {
		flash.Warning(err.Error())
		flash.Store(&c.Controller)
		return
	}

	flash.Success("Register user")
	flash.Store(&c.Controller)

	c.SetLogin(u)

	c.Redirect(c.Controller.URLFor("DashboardController.All"), 303)
}
