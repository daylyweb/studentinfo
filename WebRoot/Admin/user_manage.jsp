<%@ page language="java" import="java.util.*,com.daylyweb.studentinfo.beans.*" pageEncoding="UTF-8"%>
<%@ page contentType = "text/html;charset=UTF-8 "   %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:useBean id="user" scope="page" class="com.daylyweb.studentinfo.beans.User"  />
<jsp:useBean id="userbean" scope="page" class="com.daylyweb.studentinfo.beans.UserBean">
<jsp:setProperty property="page" name="userbean" param="page" />
<jsp:setProperty property="alluser" name="userbean" value="${userbean.alluser}"/>
</jsp:useBean>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>Manage...</title>
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
					<li><a href="class_manage.jsp">课程管理</a></li>
					<li><a href="stu_manage.jsp">学生管理</a></li>
					<li><a href="teacher_manage.jsp">教师管理</a></li>
					<li class="selected"><a href="user_manage.jsp">用户管理</a></li>
					<li><a href="alterpass.jsp">修改密码</a></li>
					<li><a href="../LoginOut">退出系统</a></li>
				</ul>
				<img alt="" src="../images/leftfoot.jpg">
			</div>
			<div id="content-right">
				<img src="../images/righthead.jpg"  />
				<div id="content-content">
					<div class="list">
						<table id="table">
							<tr>
								<th>userid</th>
								<th>username</th>
								<th>用户类型</th>
								<th>操作</th>
							</tr>
							<c:forEach items="${userbean.alluser}" var="user" begin="${userbean.page*10-10}" end="${userbean.page*10-1}" varStatus="status" >
								<c:if test="${status.index < userbean.size}">
									<tr align='center'>
										<td id='${user.userid}'>${user.userid}</td>
										<td>${user.username}</td>
										<c:if test="${user.type==1}">
											<td>管理员</td>
										</c:if>
										<c:if test="${user.type==2}">
											<td>教师</td>
										</c:if>
										<c:if test="${user.type==3}">
											<td>学生</td>
										</c:if>
										<td>
											<a href='user_update.jsp?id=${user.userid}'>修改</a>
										</td>
									</tr>
								</c:if>
							</c:forEach>
						</table>
						
					</div>	
					<div class="pagegroup" >
							   第${userbean.page}页，共${userbean.allpage}页<br>
							   <c:if test="${userbean.page==1}" var="flag"></c:if>
							   <c:if test="${flag==true}">
							   		<a>首页</a>
							   		<a>上一页</a>
							   </c:if>
							   <c:if test="${flag==false}">
							   		<a href='user_manage.jsp'>首页</a>
							   		<a href='user_manage.jsp?page=${userbean.page-1}'>上一页</a>
							   </c:if>
							   <c:if test="${userbean.page==userbean.allpage}" var="flag1"></c:if>
							    <c:if test="${flag1==true}">
							    	<a>下一页</a>
							   		<a>尾页</a>
							    </c:if>
							    <c:if test="${flag1==false}">
							   		<a href='user_manage.jsp?page=${userbean.page+1}'>下一页</a>
							   		<a href='user_manage.jsp?page=${userbean.allpage}'>尾页</a>
							   </c:if>
					 </div>
				</div>
				<img src="../images/rightfoot.jpg" />
			</div>
		</div>
    </div>
  </body>
</html>