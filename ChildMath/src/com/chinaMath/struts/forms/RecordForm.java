package com.chinaMath.struts.forms;

import java.util.Date;

import org.apache.struts.action.ActionForm;

public class RecordForm extends ActionForm{
	
	Integer type;
	Date datetime;
	Integer minutes;
	Integer errorNum;
	Integer userID;
	
	public void setType(Integer type) {
		this.type = type;
	}
	public Integer getType() {
		return type;
	}
	public void setDatetime(Date datetime) {
		this.datetime = datetime;
	}
	public Date getDatetime() {
		return datetime;
	}
	public void setMinutes(Integer minutes) {
		this.minutes = minutes;
	}
	public Integer getMinutes() {
		return minutes;
	}
	public void setErrorNum(Integer errorNum) {
		this.errorNum = errorNum;
	}
	public Integer getErrorNum() {
		return errorNum;
	}
	public void setUserID(Integer userID) {
		this.userID = userID;
	}
	public Integer getUserID() {
		return userID;
	}
}
