package com.chinaMath.hibernate.beans;

public abstract class AbstractHonour {
	
	protected Integer honourID;	
	protected Integer userID;	
	protected Integer honourType;
	
	/** default constructor 
*/
	public AbstractHonour() {
		
	}
	
	public AbstractHonour(Integer honourID, Integer userID, Integer honourType) {
		this.honourID = honourID;
		this.userID = userID;
		this.honourType = honourType;
	}
	
	public Integer getHonourID() {
		return honourID;
	}

	public void setHonourID(Integer honourID) {
		this.honourID = honourID;
	}
	
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
