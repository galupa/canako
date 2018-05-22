package controllers

type DashboardController struct {
	BaseController
}

func (c *DashboardController) NestPrepare() {
	if !c.IsLogin {
		c.Ctx.Redirect(302, c.LoginPath())
		return
	}
}

// func (c *UsersController) NestFinish() {}
// @router /:key [get]
func (c *DashboardController) Index() {

	c.Controller.TplName = "dashboard.tpl"
}
