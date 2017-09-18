package com.daylyweb.studentinfo.beans;

public class Teacher {
	private int id;
	private String name;
	private String sex;
	private String birthyear;
	private String edu;
	private String title;
	private String entryyear;
	private String school;
	public Teacher()
	{
		
	}
	
	public Teacher(int id,String name,String sex,String birthyear,String edu,String title,String entryyear,String shcool)
	{
		this.id = id;
		this.name = name;
		this.sex = sex;
		this.birthyear = birthyear;
		this.edu = edu;
		this.title = title;
		this.entryyear = entryyear;
		this.school = shcool;
	}
	
	
	public int getId() {
		return id;
	}
	public String getName() {
		return name;
	}
	public String getSex() {
		return sex;
	}
	public String getBirthyear() {
		return birthyear;
	}
	public String getEdu() {
		return edu;
	}
	public String getTitle() {
		return title;
	}
	public String getEntryyear() {
		return entryyear;
	}
	public String getSchool() {
		return school;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public void setBirthyear(String birthyear) {
		this.birthyear = birthyear;
	}
	public void setEdu(String edu) {
		this.edu = edu;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setEntryyear(String entryyear) {
		this.entryyear = entryyear;
	}
	public void setSchool(String school) {
		this.school = school;
	}
}
