package org.studentinfo.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import org.studentinfo.beans.*;
import org.studentinfo.dao.SelCourseDAO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class StuAlter extends HttpServlet {

	SelCourseDAO dao = new SelCourseDAO();

	public StuAlter() {
		super();
	}

	public void destroy() {
		super.destroy(); 
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getContextPath(), msg="",jspname="all_stu.jsp";
		int classid;
		HttpSession session = request.getSession();
		User loginuser = (User)(session.getAttribute("loginuser"));
		int alter = Integer.valueOf((String)request.getParameter("alter"));
		if(alter==3)	classid=Integer.valueOf((String)session.getAttribute("classid"));
		else classid = Integer.valueOf((String)request.getParameter("classid"));
		switch(alter)  //1 添加选课 2删除选课  3修改成绩
		{
			case 1:	if(dao.insert(new SelCourse(classid,loginuser.getUserid(),-1))){msg="选课成功！";}else{msg="选课失败！！";}jspname="my_stu.jsp";break;
			case 2:	if(dao.delete(new SelCourse(classid,loginuser.getUserid(),-1))){msg="退课成功！";}else{msg="退课失败！！";}jspname="my_stu.jsp";break;
			case 3: 
				int studentid = (Integer)session.getAttribute("studentid");
				int grade = Integer.valueOf((String)request.getParameter("grade"));
				if(dao.upadte(new SelCourse(classid,studentid,grade)))
				{
					msg="打分成功！";
				}
				else
				{
					msg="打分失败！！";
				}
				jspname="stu_teacher.jsp?classid="+classid;break;
			default:msg="未知操作！";
		}
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

}
