package org.studentinfo.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.studentinfo.beans.UserBean;
import org.studentinfo.beans.User;

public class Login extends HttpServlet {

	public Login() {
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
		String username = request.getParameter("user");
		String password = request.getParameter("password");
		String msg,resultjsp = "login.jsp";
		User User = new User();
		User.setUsername(username);
		User.setPassword(password);
		PrintWriter out = response.getWriter();
		String path = request.getContextPath();
		User newadmin = new UserBean().logincheck(User);
		if(newadmin!=null)
		{
			request.getSession().setAttribute("loginuser", newadmin);
			switch(newadmin.getType())  //1管理员 2教师 3学生
			{
				case 1: msg="管理员账号："+User.getUsername()+"登陆成功！";resultjsp="stu_manage.jsp";break;
				case 2: msg="教师账号："+User.getUsername()+"登陆成功！";resultjsp="my_teacher.jsp";break;
				case 3: msg="学生账号："+User.getUsername()+"登陆成功！";resultjsp="all_stu.jsp";break;
				default:msg="未定义账号，请重试！";
			}
			out.println("<script type='text/javascript'>");
			out.println("alert('"+msg+"');window.location.href='"+path+"/Admin/"+resultjsp+"';");
			out.println("</script>");
			out.flush();
			out.close();
		}
		else
		{
			
			out.println("<script type='text/javascript'>");
			out.println("alert('用户登陆失败！请重试！(用户ID或用户名)');window.location.href='"+path+"/Admin/login.jsp';");
			out.println("</script>");
			out.flush();
			out.close();
		}
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
