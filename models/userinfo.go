package models

import (
	"time"

	"github.com/astaxie/beego/orm"
)

type (
	UserInfo struct {
		Id      int64
		Info    string
		User    *User     `orm:"null;default(null);rel(fk)"`
		Date    time.Time `orm:"type(datetime);null" form:"-"`
		End     time.Time `orm:"type(datetime);null" form:"-"`
		Image   string
		Created time.Time `orm:"auto_now_add;type(datetime)"`
		Updated time.Time `orm:"auto_now;type(datetime)"`
	}
)

func (m *UserInfo) Insert() error {
	if _, err := orm.NewOrm().Insert(m); err != nil {
		return err
	}
	return nil
}

func (m *UserInfo) Read(fields ...string) error {
	if err := orm.NewOrm().Read(m, fields...); err != nil {
		return err
	}
	return nil
}

func (m *UserInfo) ReadOrCreate(field string, fields ...string) (bool, int64, error) {
	return orm.NewOrm().ReadOrCreate(m, field, fields...)
}

func (m *UserInfo) Update(fields ...string) error {
	if _, err := orm.NewOrm().Update(m, fields...); err != nil {
		return err
	}
	return nil
}

func (m *UserInfo) Delete() error {
	if _, err := orm.NewOrm().Delete(m); err != nil {
		return err
	}
	return nil
}

func UserInfos() orm.QuerySeter {
	var table UserInfo
	return orm.NewOrm().QueryTable(table).OrderBy("-Id")
}

func UserInfosByUser(userid int64) orm.QuerySeter {
	var table UserInfo
	return orm.NewOrm().QueryTable(table).Filter("user_id", userid).OrderBy("-Id")
}

func init() {
	orm.RegisterModel(new(UserInfo))
}
