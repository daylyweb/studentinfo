package com.daylyweb.studentinfo.beans;

public class SelCourse {
	private int classid;
	private int studentid;
	private int grade;
	public SelCourse()
	{
		
	}
	
	public SelCourse(int classid,int studentid,int grade)
	{
		this.classid = classid;
		this.studentid = studentid;
		this.grade = grade;
	}
	
	public int getClassid() {
		return classid;
	}
	public int getStudentid() {
		return studentid;
	}
	public int getGrade() {
		return grade;
	}
	public void setClassid(int classid) {
		this.classid = classid;
	}
	public void setStudentid(int studentid) {
		this.studentid = studentid;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
}
