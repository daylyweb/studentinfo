package org.studentinfo.beans;

public class Class {
	private int id;
	private String name;
	private int teacher;
	private String time;
	private String classroom;
	private String weeks;
	private String type;
	private double grade;
	public Class()
	{
	}
	
	public Class(int id,String name,int teacher,String time,String classroom,String weeks,String type,double grade)
	{
		this.id=id;
		this.name=name;
		this.teacher=teacher;
		this.time=time;
		this.classroom=classroom;
		this.weeks=weeks;
		this.type=type;
		this.grade=grade;
	}
	public int getId() {
		return id;
	}
	public String getName() {
		return name;
	}
	public int getTeacher() {
		return teacher;
	}
	public String getTime() {
		return time;
	}
	public String getClassroom() {
		return classroom;
	}
	public String getWeeks() {
		return weeks;
	}
	public String getType() {
		return type;
	}
	public double getGrade() {
		return grade;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setTeacher(int teacher) {
		this.teacher = teacher;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public void setClassroom(String classroom) {
		this.classroom = classroom;
	}
	public void setWeeks(String weeks) {
		this.weeks = weeks;
	}
	public void setType(String type) {
		this.type = type;
	}
	public void setGrade(double grade) {
		this.grade = grade;
	}
}
