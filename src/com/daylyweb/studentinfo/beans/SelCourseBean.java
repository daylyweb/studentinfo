package com.daylyweb.studentinfo.beans;

import java.util.ArrayList;

import com.daylyweb.studentinfo.dao.ClassDAO;
import com.daylyweb.studentinfo.dao.SelCourseDAO;

public class SelCourseBean implements java.io.Serializable{
	SelCourseDAO dao ;
	ClassDAO classdao=new ClassDAO();
	private int studentid;
	private int classid;
	private int usertype;
	private ArrayList<Class>  classes;
	private ArrayList<SelCourse> students;
	private SelCourse student;
	private int classtype=1;
	private int page=1;
	private int allpage=1;
	private int size=0;
	private int alter=4;
	public SelCourseBean()
	{
		dao= new SelCourseDAO();
	}
	
	public void setClasses(ArrayList<Class> classes) {
		if(usertype==3)
		{
			if(classtype==1)this.classes = dao.queryByStudentId(studentid); //已选
			else this.classes=dao.queryOkByStudentId(studentid); //已修
		}
		else if(usertype==2)
		{
			this.classes = classdao.queryByTeacher(studentid);
		}
		
	}
	
	public ArrayList<Class> getClasses()
	{
		
		return classes;
		
	}
	public void setSize(int size) {
		this.size = size;
	}
	public int getSize()
	{
		if(usertype==4)
		{
			return students.size();
		}
		else
		{
			return classes.size();
		}
	}
	public Class getClass(int index)
	{
		return classes.get(index);
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page=page;
	}
	public void setAllpage(int allpage) {
		this.allpage = allpage;
	}
	public int getAllpage()
	{
		if(usertype==4)
		{
			if(students.size()<=9){return 1;}
			this.allpage=(int)(Math.ceil((double)(students.size())/10));
		}
		else
		{
			if(classes.size()<=9){return 1;}
			this.allpage=(int)(Math.ceil((double)(classes.size())/10));
		}
		return allpage;
	}
	public void setAlter(int alter)  /*1 添加    2 修改    3删除*/
	{
		this.alter=alter;
	}
	public int getAlter() {
		return alter;
	}
	public int getStudentid() {
		return studentid;
	}

	public void setStudentid(int studentid) {
		this.studentid = studentid;
	}
	public void setClassid(int classid) {
		this.classid = classid;
	}
	public int getClassid() {
		return classid;
	}
	public int getClasstype() {
		return classtype;
	}
	public void setClasstype(int classtype) {  //1已选   2已修
		this.classtype = classtype;
	}
	public int getUsertype() {
		return usertype;
	}

	public void setUsertype(int usertype) {
		this.usertype = usertype;
	}
	public ArrayList<SelCourse> getStudents() {
		return students;
	}

	public void setStudents(ArrayList<SelCourse> students) {
		this.students = dao.queryByClassId(classid);
	}
	public SelCourse getStudent() {
		return student;
		
	}

	public void setStudent(SelCourse student) {
		this.student = student;
	}


}
