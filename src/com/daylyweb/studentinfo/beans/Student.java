package com.daylyweb.studentinfo.beans;

public class Student implements java.io.Serializable {
	private int id=0;
	private String name;
	private String sex;
	private String birthyear;
	private String 	entrydate;
	private String school;
	public Student()
	{
		
	}
	public Student(int id,String name,String sex,String birthyear,String entrydate,String school)
	{
		this.id = id;
		this.name = name;
		this.sex = sex;
		this.birthyear=birthyear;
		this.entrydate = entrydate;
		this.school = school;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getBirthyear() {
		return birthyear;
	}
	public void setBirthyear(String year) {
		this.birthyear = year;
	}
	public String getEntrydate() {
		return entrydate;
	}
	public void setEntrydate(String entrydate) {
		this.entrydate = entrydate;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
}
