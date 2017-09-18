package org.studentinfo.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.studentinfo.beans.Class;
import org.studentinfo.beans.ClassBean;
import org.studentinfo.beans.Student;
import org.studentinfo.beans.StudentBean;
import org.studentinfo.beans.Teacher;
import org.studentinfo.beans.TeacherBean;
import org.studentinfo.beans.User;
import org.studentinfo.beans.UserBean;

public class Alter extends HttpServlet {
	HttpServletRequest Request;
	HttpServletResponse Response;
	
	public Alter() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.Request=request;
		this.Response=response;
		String path = request.getContextPath();
		String msg="",jspname="";
		int id;
		int alter  = Integer.parseInt(request.getParameter("alter"));
		Object obj = request.getSession().getAttribute("alterid");

		if(alter!=1 && alter!=3 && obj==null)
		{
			msg="无法获取需要修改的相应id！请登了重试！";
			jspname="LoginOut";
		}
		else
		{
			if(alter==1 || alter==3)
			{
				id=Integer.parseInt((String) request.getParameter("userid"));
			}
			else
			{
				id=Integer.parseInt(obj.toString());
			}
			int type = Integer.parseInt(request.getParameter("type"));   //1用户  2教师  3学生  4课程
			switch(type)
			{
				case 1:msg=alteruser(alter,id);if("原密码错误！".equals(msg)){jspname="alterpass.jsp";}else{jspname="LoginOut";}break;
				case 2: msg = alterteacher(alter,id);jspname="teacher_manage.jsp";break;
				case 3: msg = alterstudent(alter,id);jspname="stu_manage.jsp";break;
				case 4: msg = alterclass(alter,id);jspname="class_manage.jsp";break;
				default:msg = "未知操作！";jspname="stu_manage.jsp";
			}
		}
		
		request.getSession().removeAttribute("alterid");
		PrintWriter out = response.getWriter();
		out.println("<script type='text/javascript'>");
		out.println("alert('"+msg+"');window.location.href='"+path+"/Admin/"+jspname+"'");
		out.println("</script>");
		out.flush();
		out.close();
	}


	public void init() throws ServletException {
		// Put your code here
	}
	
	public String alterstudent(int alter,int id)
	{
		StudentBean  studentbean = new StudentBean();
		Student student = new Student();
		student.setId(id);
		if(alter!=3)
		{
			student.setName(Request.getParameter("username"));
			student.setSex(Request.getParameter("sex"));
			student.setBirthyear(Request.getParameter("year"));
			student.setEntrydate(Request.getParameter("entrydate"));
			student.setSchool(Request.getParameter("school"));
		}
		studentbean.setAlter(alter);
		return studentbean.alter(student);
	}
	
	public String alterteacher(int alter,int id)
	{
		TeacherBean teacherbean = new TeacherBean();
		Teacher teacher = new Teacher();
		teacher.setId(id);
		if(alter!=3)
		{
			teacher.setName(Request.getParameter("username"));
			teacher.setSex(Request.getParameter("sex"));
			teacher.setBirthyear(Request.getParameter("year"));
			teacher.setEdu(Request.getParameter("edu"));
			teacher.setTitle(Request.getParameter("title"));
			teacher.setEntryyear(Request.getParameter("entryyear"));
			teacher.setSchool(Request.getParameter("school"));
		}
		teacherbean.setAlter(alter);
		return teacherbean.alter(teacher);
	}
	
	public String alterclass(int alter,int id)
	{
		ClassBean classbean = new ClassBean();
		Class Class = new Class();
		Class.setId(id);
		if(alter!=3)
		{
			Class.setName(Request.getParameter("username"));
			Class.setTeacher(Integer.parseInt(Request.getParameter("teacher")));
			Class.setTime(Request.getParameter("time"));
			Class.setClassroom(Request.getParameter("classroom"));
			Class.setWeeks(Request.getParameter("weeks"));
			Class.setType(Request.getParameter("classtype"));
			Class.setGrade(Double.valueOf(Request.getParameter("grade")));
		}
		classbean.setAlter(alter);
		return classbean.alter(Class);
		
	}

	public String alteruser(int alter,int id)
	{
		UserBean userbean = new UserBean();
		User user= new User();
		user.setUserid(id);
		if(alter==4)
		{
			user.setUsername(Request.getParameter("oldpwd"));  //用username充当一下旧密码
			user.setPassword(Request.getParameter("newpwd"));
		}
		else if(alter!=3  && alter!=4)
		{
			user.setUsername(Request.getParameter("username"));
			user.setPassword(Request.getParameter("password"));
		}
		userbean.setAlter(alter);
		return userbean.alter(user);
	}
}
