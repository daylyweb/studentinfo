package com.daylyweb.studentinfo.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.daylyweb.studentinfo.beans.User;

public class LoginFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) arg0;
		HttpServletResponse response = (HttpServletResponse) arg1;
		String resultjsp ="login.jsp",msg="",url=request.getRequestURL().toString(),typename = "";
		User User =(com.daylyweb.studentinfo.beans.User) request.getSession().getAttribute("loginuser");
		PrintWriter out = response.getWriter();
		String path = request.getContextPath();
		if (User == null) {//用户未登录
			if(url.indexOf("login")==-1)
			{
				msg="用户未登录！请先登录！";
				out.println("<script>alert('"+msg+"');window.location.href='"+path+"/Admin/"+resultjsp+"';</script>");
				out.flush();
				out.close();
			}
		} else {//用户已登录
			if(url.indexOf("alterpass")==-1)
			{
				int type=User.getType();
				switch(type)  //1管理员 2教师 3学生
				{
					case 1:	resultjsp="stu_manage.jsp";typename="管理员";break;
					case 2:	resultjsp="my_teacher.jsp";typename="教师";break;
					case 3:	resultjsp="my_stu.jsp";typename="学生";break;
					default:resultjsp="login.jsp";
				}
				if(url.indexOf("login")==-1)
				{	//如果用户类型为管理员 url不包含三种情况为登入错误
					if(type==1 && url.indexOf("_add")==-1  && url.indexOf("_manage")==-1 && url.indexOf("_update")==-1)
					{
						msg="当前登录的用户为"+typename+"，点击确定跳转到相应页面！";
						out.println("<script>alert('"+msg+"');window.location.href='"+path+"/Admin/"+resultjsp+"';</script>");
						out.flush();
						out.close();
					}
					else if(type==2 && url.indexOf("_teacher")==-1)
					{
						msg="当前登录的用户为"+typename+"，点击确定跳转到相应页面！";
						out.println("<script>alert('"+msg+"');window.location.href='"+path+"/Admin/"+resultjsp+"';</script>");
						out.flush();
						out.close();
					}
					else if(type==3 && url.indexOf("_stu")==-1)
					{
						msg="当前登录的用户为"+typename+"，点击确定跳转到相应页面！";
						out.println("<script>alert('"+msg+"');window.location.href='"+path+"/Admin/"+resultjsp+"';</script>");
						out.flush();
						out.close();
					}
				}
			}
			
		}
		arg2.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
