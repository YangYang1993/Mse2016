package com.chinaMath.hibernate.beans;

import java.util.HashSet;
import java.util.Set;

public abstract class AbstractFault {

	private Integer faultID;
	private Integer userID;
	private String fileAddr;
	// Constructors

	/** default constructor */
	public AbstractFault() {
	}

	/** constructor */
	public AbstractFault(Integer faultID, Integer userID, String fileAddr) {
		this.faultID = faultID;
		this.userID = userID;
		this.fileAddr = fileAddr;
	}

	// Property accessors

	public Integer getFaultID() {
		return this.faultID;
	}
	
	public void setFaultID(Integer faultID) {
		this.faultID = faultID;
	}
	public Integer getUserID() {
		return this.userID;
	}

	public void setUserID(Integer userID) {
		this.userID = userID;
	}

	public String getFileAddr() {
		return this.fileAddr;
	}

	public void setFileAddr(String fileAddr) {
		this.fileAddr = fileAddr;
	}

}
