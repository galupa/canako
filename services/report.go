package services

import (
	"canako/models"
	"errors"
)

func CreateReport(u *models.Report) (int64, error) {
	var (
		err error
		msg string
	)
	if !models.Users().Filter("email", u.User).Exist() {
		msg = "Invalid User."
		return 0, errors.New(msg)
	}
	err = u.Insert()
	if err != nil {
		return 0, err
	}

	return u.Id, err
}

func GetReport(user string, idx int64) (models.Report, error) {
	var (
		err    error
		msg    string
		report models.Report
	)
	if !models.Users().Filter("email", user).Exist() {
		msg = "Invalid User."
		return report, errors.New(msg)
	}
	_, err = models.Reports().Filter("user", user).Offset(idx).Limit(1).All(&report)

	return report, err
}
