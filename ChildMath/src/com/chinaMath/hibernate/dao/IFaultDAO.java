package com.chinaMath.hibernate.dao;

import java.util.List;

import com.chinaMath.hibernate.beans.Fault;

public interface IFaultDAO {
	public void insertFault(Fault fault);
	public void updateFault(Fault fault);
	public Fault getFaultByFaultID(Integer faultID);
	public Fault getFaultByUserID(Integer userID);
	public void deleteFaultByFaultID(Integer faultID);
	public void deleteFault(Fault fault);

}
