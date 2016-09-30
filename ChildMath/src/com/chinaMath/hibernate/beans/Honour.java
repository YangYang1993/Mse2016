package com.chinaMath.hibernate.beans;

public class Honour extends AbstractHonour{
	public Honour() {
		
	}
	
	public Honour(Integer honourID, Integer userID, Integer honourType) {
		super(honourID, userID, honourType);
	}
	
}
