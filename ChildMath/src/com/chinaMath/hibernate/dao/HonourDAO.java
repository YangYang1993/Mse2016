package com.chinaMath.hibernate.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.chinaMath.hibernate.beans.Honour;

public class HonourDAO extends HibernateDaoSupport implements IHonourDAO {

	@Override
	public void deleteHonour(Honour honour) {
		// TODO Auto-generated method stub
		getHibernateTemplate().delete(honour);
	}

	@Override
	public void deleteHonourByHonourID(Integer honourID) {
		// TODO Auto-generated method stub
		getHibernateTemplate().delete("honourID", honourID);
	}

	@Override
	public Honour getHonourByHonourID(Integer honourID) {
		// TODO Auto-generated method stub
		List<Honour> temp = (List<Honour>)getHibernateTemplate().find("from Honour " +
				"where honourID=?", honourID);
		return  (temp.size()==0?null:(Honour)(temp.get(0)));
	}

	@Override
	public List<Honour> getHonourByUserID(Integer userID) {
		// TODO Auto-generated method stub
		List<Honour> temp = (List<Honour>)getHibernateTemplate().find("from Honour " + 
				"where userID=?", userID);
		return (temp.size()==0?null:temp);
	}

	@Override
	public void insertHonour(Honour honour) {
		// TODO Auto-generated method stub
		getHibernateTemplate().save(honour);
	}

	@Override
	public void updateHonour(Honour honour) {
		// TODO Auto-generated method stub
		getHibernateTemplate().update(honour);
	}

	@Override
	public Honour getHonourByHonourTypeAndUserID(Integer userID, Integer honourType) {
		// TODO Auto-generated method stub
		String sql = "from Honour where userID=? and honourType=?";
	       // String month1=String.valueOf(month);
		Object[] value={userID,honourType};
		List<Honour> temp =(List<Honour>)getHibernateTemplate().find(sql,value);
		return (temp.size()==0?null:(Honour)(temp.get(0)));
	}

}
