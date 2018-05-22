package routers

import (
	ctl "canako/controllers"

	"github.com/astaxie/beego"
)

func init() {
	beego.Router("/", &ctl.UsersController{}, "get:Index")
	beego.Router("/dashboard", &ctl.DashboardController{}, "get:Index")
	beego.Router("/login", &ctl.LoginController{}, "get,post:Login")
	beego.Router("/logout", &ctl.LoginController{}, "get:Logout")
	beego.Router("/signup", &ctl.LoginController{}, "get,post:Signup")
	beego.Router("/users", &ctl.UsersController{}, "get:All")
	beego.Router("/info", &ctl.InfoController{}, "get:All")
	beego.Router("/info/detail", &ctl.InfoController{}, "get:Index")
	beego.Router("/info/create", &ctl.InfoController{}, "get,post:CreateForm")
	beego.Router("/report", &ctl.ReportController{}, "get:Index")
	beego.Router("/report/create", &ctl.ReportController{}, "get,post:CreateForm")
}
