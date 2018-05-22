package services

import (
	"canako/models"
)

func CreateInfo(u *models.Info) (int64, error) {
	var (
		err error
	)

	err = u.Insert()
	if err != nil {
		return 0, err
	}

	return u.Id, err
}

func GetAllInfo() *[]models.Info {
	infos := new([]models.Info)
	models.Infos().All(infos)
	return infos
}

func GetInfo(idx int64) (models.Info, error) {
	var (
		err  error
		info models.Info
	)
	err = models.Infos().Filter("id", idx).One(&info)

	return info, err
}
