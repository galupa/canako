package services

import (
	"canako/models"
)

func CreateUserInfo(u *models.UserInfo) (int64, error) {
	var (
		err error
	)

	err = u.Insert()
	if err != nil {
		return 0, err
	}

	return u.Id, err
}

func GetAllUserInfo() *[]models.UserInfo {
	infos := new([]models.UserInfo)
	models.UserInfos().All(infos)
	return infos
}

func GetAllUserInfoByUser(user int64) *[]models.UserInfo {
	infos := new([]models.UserInfo)
	models.UserInfosByUser(user).All(infos)
	return infos
}

func GetUserInfo(idx int64) (models.UserInfo, error) {
	var (
		err  error
		info models.UserInfo
	)
	err = models.UserInfos().Filter("id", idx).One(&info)

	return info, err
}
