package com.chinaMath.hibernate.beans;

import java.util.Set;


public class User extends AbstractUser {

	public User() {
	}

	/** minimal constructor */
	public User(String userName, String password, Integer grade,Integer sex,
			String email ) {
		super(userName, password, grade, sex, email);
	}

	/** full constructor */
	public User(String userName, String password, Integer grade,Integer sex,
			String email, String picture) {
		super(userName, password, grade, sex, email, picture);
	}

}
