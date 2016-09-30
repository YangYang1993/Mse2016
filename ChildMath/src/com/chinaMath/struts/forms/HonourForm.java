package com.chinaMath.struts.forms;

import org.apache.struts.action.ActionForm;

public class HonourForm extends ActionForm{
	Integer userID;
	Integer honourType;
	
	public Integer getUserID() {
		return userID;
	}
	
	public void setUserID(Integer userID) {
		this.userID = userID;
	}
	
	public Integer getHonourType() {
		return honourType;
	}
	
	public void setHonourType(Integer honourType) {
		this.honourType = honourType;
	}
}
