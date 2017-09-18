<%@ page language="java" import="java.util.*,com.daylyweb.studentinfo.beans.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:useBean id="student" scope="page" class="com.daylyweb.studentinfo.beans.Student"  />
<jsp:useBean id="userbean" scope="request" class="com.daylyweb.studentinfo.beans.UserBean"  />
<%@ page contentType = "text/html;charset=UTF-8 "   %>
<%
		User loginuser = (User)session.getAttribute("loginuser");
		session.setAttribute("alterid",loginuser.getUserid());
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>ResetPassword...</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link rel="stylesheet" href="../css/style.css"></link>
	</head>
  <body>
    <div id="body">
		<div id="header">
			<p>欢迎<%=((User)session.getAttribute("loginuser")).getUsername()%>(<%=((User)session.getAttribute("loginuser")).getUserid()%>)登陆本系统</p>
		</div>
		<div id="content">
			<div id="content-left">
				<img alt="" src="../images/lefthead.jpg">
				<ul id="ul">
					<c:if test="${loginuser.type==1}">
						<li><a href="class_manage.jsp">课程管理</a></li>
						<li><a href="stu_manage.jsp">学生管理</a></li>
						<li><a href="teacher_manage.jsp">教师管理</a></li>
						<li><a href="user_manage.jsp">用户管理</a></li>
					</c:if>
					<c:if test="<%=loginuser.getType()==2%>">
						<li><a href="my_teacher.jsp">我的课程</a></li>
					</c:if>
					<c:if test="${loginuser.type==3}">
						<li><a href="all_stu.jsp">所有课程</a></li>
						<li><a href="my_stu.jsp">已选课程</a></li>
						<li><a href="ok_stu.jsp">已修课程</a></li>
					</c:if>
					<li class="selected"><a href="alterpass.jsp">修改密码</a></li>
					<li><a href="../LoginOut">退出系统</a></li>
				</ul>
				<img alt="" src="../images/leftfoot.jpg">
			</div>
			<div id="content-right">
				<img src="../images/righthead.jpg"  />
				<div id="content-content">
								<form id="alterform" method="POST" action="../Alter">
									<table>
										<tr style="text-align:center">
											<td colspan="2"><h3>修改用户密码</h3></td>
											<td><input type="hidden" name="alter" value="4"/></td>
											<td><input type="hidden" name="type" value="1"/></td>
										</tr>
										<tr>
											<td>原密码：</td>
											<td><input type="password" name="oldpwd"  /></td>
										</tr>
										<tr>
											<td>新密码：</td>
											<td><input type="password" name="newpwd" /></td>
										</tr>
										<tr>
											<td>确认密码：</td>
											<td><input type="password" name="newpwd1" /></td>
										</tr>
										<tr>
											<td colspan="2" style="text-align:center;">
												<button type="button" onclick="check()">修改</button> 
												<button type="button" onclick="window.history.back();">返回</button>
											</td>
										</tr>
									</table>
								</form>
				</div>
				<img src="../images/rightfoot.jpg" />
			</div>
		</div>
    </div>
    <script src="../js/jquery.js"></script>
  	<script type="text/javascript">	
	  	function check()
		{
	  		var flag=true;
	  		$('input').each(function(){
	  			if($(this).val()==null || $(this).val()=="")
	  			{
	  				flag=false;
	  			}
	  		});
	  		
	  		if(flag)
	  		{
	  			if($('input[name=newpwd]').val()==$('input[name=newpwd1]').val())
				{
					$('#alterform').submit();
				}
				else
				{
					alert("两次输入的新密码密码不一致！请检查！");
				}
	  		}
	  		else
	  		{
	  			alert("输入框不能为空！请检查！");
	  		}
			
		}
    </script>
    
  </body>
</html>
