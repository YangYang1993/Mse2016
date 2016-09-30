package com.chinaMath.hibernate.beans;

public abstract class AbstractUser {

	private Integer userID;
	private String userName;
	private String password;
	private Integer grade;
	private String email;
	private String picture;
	private Integer sex;
	
	// Constructors

	/** default constructor */
	public AbstractUser() {
	}

	/** minimal constructor */
	public AbstractUser(String userName, String password, Integer grade, Integer sex,
			String email) {
		this.userName = userName;
		this.password = password;
		this.grade = grade;
		this.email = email;
		this.sex = sex;
	}

	/** full constructor */
	public AbstractUser(String userName, String password, Integer grade, Integer sex,
			String email, String picture) {
		this.userName = userName;
		this.password = password;
		this.grade = grade;
		this.email = email;
		this.picture = picture;
		this.sex = sex;
	}

	// Property accessors

	public Integer getUserID() {
		return this.userID;
	}

	public void setUserID(Integer userID) {
		this.userID = userID;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getGrade() {
		return this.grade;
	}

	public void setGrade(Integer grade) {
		this.grade = grade;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPicture() {
		return this.picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public Integer getSex() {
		return this.sex;
	}
}
