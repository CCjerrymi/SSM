package com.entity;

public class Manager {
	private String ID;
	private String passWord;
	private String loginName;
	
	public Manager(){
		
	}
	public Manager(String id,String name,String password) {
		this.ID = id;
		this.loginName = name;
		this.passWord = password;
	}
	
	public Manager(String loginName, String passWord) {
		this.loginName = loginName;
		this.passWord = passWord;
	}

	public String getID() {
		return ID;
	}

	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}



	public void setID(String iD) {
		ID = iD;
	}

	
	

}
