package com.chinaMath.struts.forms;

import org.apache.struts.action.ActionForm;

public class FaultForm extends ActionForm{
	Integer userID;
	String fileAddr ;
	
	public Integer getUserID() {
		return userID;
	}
	
	public void setUserID(Integer userID) {
		this.userID = userID;
	}
	
	public String getFaultType() {
		return fileAddr;
	}
	
	public void setFileAddr(String fileAddr) {
		this.fileAddr = fileAddr;
	}

}
