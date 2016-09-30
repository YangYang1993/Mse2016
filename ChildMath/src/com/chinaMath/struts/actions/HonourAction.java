package com.chinaMath.struts.actions;

import org.apache.struts.actions.DispatchAction;

import com.chinaMath.hibernate.dao.HonourDAO;

public class HonourAction extends DispatchAction{
	HonourDAO honourDAO;
	public HonourDAO getHonourDAO() {
		return honourDAO;
	}
	
	public void setHonourDAO (HonourDAO honourDAO) {
		this.honourDAO = honourDAO;
	}

}
