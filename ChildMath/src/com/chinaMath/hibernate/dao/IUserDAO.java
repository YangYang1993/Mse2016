package com.chinaMath.hibernate.dao;

import com.chinaMath.hibernate.beans.User;

public interface IUserDAO {
	
	public void insertUser(User user);
	public void updateUser(User user);
	public User getUserByUserName(String userName);
	public User getUserByEmail(String email);

}
