package main

import (
	_ "canako/routers"

	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
	_ "github.com/go-sql-driver/mysql"
)

/*
set GOARCH=amd64
set GOOS=linux
go build -o canako
*/

func init() {
	orm.RegisterDriver("mysql", orm.DRMySQL)

	orm.RegisterDataBase("default", "mysql", "root@/canako?charset=utf8")
	// Drop table and re-create.
	force := false

	// Print log.
	verbose := true
	orm.RunSyncdb("default", force, verbose)
}

func main() {
	o := orm.NewOrm()
	o.Using("default")
	beego.Run()
}
