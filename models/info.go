package models

import (
	"time"

	"github.com/astaxie/beego/orm"
)

type (
	Info struct {
		Id      int64
		Info    string
		Date    time.Time `orm:"type(datetime);null" form:"-"`
		End     time.Time `orm:"type(datetime);null" form:"-"`
		Image   string
		Created time.Time `orm:"auto_now_add;type(datetime)"`
		Updated time.Time `orm:"auto_now;type(datetime)"`
	}
)

func (m *Info) Insert() error {
	if _, err := orm.NewOrm().Insert(m); err != nil {
		return err
	}
	return nil
}

func (m *Info) Read(fields ...string) error {
	if err := orm.NewOrm().Read(m, fields...); err != nil {
		return err
	}
	return nil
}

func (m *Info) ReadOrCreate(field string, fields ...string) (bool, int64, error) {
	return orm.NewOrm().ReadOrCreate(m, field, fields...)
}

func (m *Info) Update(fields ...string) error {
	if _, err := orm.NewOrm().Update(m, fields...); err != nil {
		return err
	}
	return nil
}

func (m *Info) Delete() error {
	if _, err := orm.NewOrm().Delete(m); err != nil {
		return err
	}
	return nil
}

func Infos() orm.QuerySeter {
	var table Info
	return orm.NewOrm().QueryTable(table).OrderBy("-Id")
}

func init() {
	orm.RegisterModel(new(Info))
}
