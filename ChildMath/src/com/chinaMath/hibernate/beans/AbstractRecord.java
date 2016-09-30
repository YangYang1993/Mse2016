package com.chinaMath.hibernate.beans;

import java.util.Date;

public abstract class AbstractRecord {
	
	private Integer recordID;
	private Integer type;
	private Date datetime;
	private Integer minutes;
	private Integer errorNum;
	private Integer userID;
	public AbstractRecord(){
		
	}
	public AbstractRecord(Integer recordID,Integer type,Date datetime,Integer minutes, Integer errorNum,Integer userID) {
		this.recordID = recordID;
		this.type = type;
		this.datetime = datetime;
		this.minutes = minutes;
		this.errorNum = errorNum;
		this.userID = userID;
	}

	
	
	public void setRecordID(Integer recordID) {
		this.recordID = recordID;
	}
	public Integer getRecordID() {
		return recordID;
	}
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
