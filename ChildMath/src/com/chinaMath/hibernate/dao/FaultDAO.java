package com.chinaMath.hibernate.dao;

import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.chinaMath.hibernate.beans.Fault;
import com.chinaMath.hibernate.beans.Fault;


public class FaultDAO extends HibernateDaoSupport implements IFaultDAO {
	@Override
	public void deleteFault(Fault fault) {
		// TODO Auto-generated method stub
		getHibernateTemplate().delete(fault);
	}

	@Override
	public void deleteFaultByFaultID(Integer faultID) {
		// TODO Auto-generated method stub
		getHibernateTemplate().delete("faultID", faultID);
	}

	@Override
	public Fault getFaultByFaultID(Integer faultID) {
		// TODO Auto-generated method stub
		List<Fault> temp = (List<Fault>)getHibernateTemplate().find("from Fault " +
				"where faultID=?", faultID);
		return  (temp.size()==0?null:(Fault)(temp.get(0)));
	}

	@Override
	public Fault getFaultByUserID(Integer userID) {
		// TODO Auto-generated method stub
		List<Fault> temp = (List<Fault>)getHibernateTemplate().find("from Fault " + 
				"where userID=?", userID);
		return (temp.size()==0?null:(Fault)(temp.get(0)));
	}

	@Override
	public void insertFault(Fault fault) {
		// TODO Auto-generated method stub
		getHibernateTemplate().save(fault);
	}

	@Override
	public void updateFault(Fault fault) {
		// TODO Auto-generated method stub
		getHibernateTemplate().update(fault);
	}
}