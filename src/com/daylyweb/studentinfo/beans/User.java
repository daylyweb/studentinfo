package com.daylyweb.studentinfo.beans;

public class User implements java.io.Serializable{
	private int userid;
	private String username;
	private String password;
	private int type=1;
	
	public User()
	{
		
	}
	public User(int userid,String username,String password,int type)
	{
		this.userid = userid;
		this.username = username;
		this.password = password;
		this.type=type;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
}
