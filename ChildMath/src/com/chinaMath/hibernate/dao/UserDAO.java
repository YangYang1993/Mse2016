package com.chinaMath.hibernate.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.chinaMath.hibernate.beans.User;


public class UserDAO extends HibernateDaoSupport implements IUserDAO{
	
	public void insertUser(User user) {
		// TODO Auto-generated method stub
		getHibernateTemplate().save(user);
	}

	@Override
	public void updateUser(User user) {
		// TODO Auto-generated method stub
		getHibernateTemplate().update(user);
	}
	public User getUserByUserName(String userName) {
		// TODO Auto-generated method stub
		List<User> temp = (List<User>)getHibernateTemplate().find("from User " +
				"where userName=?", userName);
		return  (temp.size()==0?null:(User)(temp.get(0)));
	}

	@Override
	public User getUserByEmail(String email) {
		// TODO Auto-generated method stub
		List<User> temp = (List<User>)getHibernateTemplate().find("from User " +
				"where email=?", email);
		return  (temp.size()==0?null:(User)(temp.get(0)));
	}
	

}
