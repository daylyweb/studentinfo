<%@ page language="java" import="java.util.*,com.daylyweb.studentinfo.beans.*,com.daylyweb.studentinfo.dao.*" pageEncoding="UTF-8"%>
<%@ page contentType = "text/html;charset=UTF-8 "   %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	User loginuser = (User)session.getAttribute("loginuser");
%>
<jsp:useBean id="Class" scope="page" class="com.daylyweb.studentinfo.beans.Class"  />
<jsp:useBean id="selcoursebean" scope="page" class="com.daylyweb.studentinfo.beans.SelCourseBean">
	<jsp:setProperty property="studentid" name="selcoursebean" value="${loginuser.userid}" />
	<jsp:setProperty property="usertype" name="selcoursebean" value="${loginuser.type}" />
	<jsp:setProperty property="page" name="selcoursebean" param="page" />
	<jsp:setProperty property="classes" name="selcoursebean" value="${selcoursebean.classes}" />
</jsp:useBean>
<jsp:useBean id="selcourse" scope="page" class="com.daylyweb.studentinfo.beans.SelCourse" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>MyCourse...</title>
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
			<p>欢迎<%=loginuser.getUsername()%>(<%=loginuser.getUserid()%>)登陆本系统</p>
		</div>
		<div id="content">
			<div id="content-left">
				<img alt="" src="../images/lefthead.jpg">
				<ul id="ul">
					<li class="selected"><a href="my_teacher.jsp">我的课程</a></li>
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
							<tr align="center">
								<th>课程编号</th>
								<th>课程名</th>
								<th>任课教师</th>
								<th>上课时间</th>
								<th>课室</th>
								<th>周数</th>
								<th>选课类型</th>
								<th>学分</th>
								<th>操作</th>
							</tr>
							<c:forEach items="${selcoursebean.classes}" var="varclass" begin="${selcoursebean.page*10-10}" end="${selcoursebean.page*10-1}" varStatus="status" >
								<jsp:setProperty property="teacher" name="Class" value="${varclass.teacher}" />
								<jsp:setProperty property="classid" name="selcoursebean" value="${varclass.id}" />
								<c:if test="${status.index < selcoursebean.size}">
									<tr align='center' class="tr">
										<td id='${varclass.id}'>${varclass.id}</td>
										<td>${varclass.name}</td>
										<td><%=new TeacherDAO().queryNameById(Class.getTeacher()) %></td>
										<td>${varclass.time}</td>
										<td>${varclass.classroom}</td>
										<td>${varclass.weeks}</td>
										<td>${varclass.type}</td>
										<td>${varclass.grade}</td>
										<td><a href="stu_teacher.jsp?classid=${varclass.id}">成绩</a></td>
									</tr>
								</c:if>
							</c:forEach>
						</table>
						
					</div>	
					<div class="pagegroup" align="center">
							   第${selcoursebean.page}页，共${selcoursebean.allpage}页<br>
							   <c:if test="${selcoursebean.page==1}" var="flag"></c:if>
							   <c:if test="${flag==true}">
							   		<a>首页</a>
							   		<a>上一页</a>
							   </c:if>
							   <c:if test="${flag==false}">
							   		<a href='my_teacher.jsp'>首页</a>
							   		<a href='my_teacher.jsp?page=${selcoursebean.page-1}'>上一页</a>
							   </c:if>
							   <c:if test="${selcoursebean.page==selcoursebean.allpage}" var="flag1"></c:if>
							    <c:if test="${flag1==true}">
							    	<a>下一页</a>
							   		<a>尾页</a>
							    </c:if>
							    <c:if test="${flag1==false}">
							   		<a href='my_teacher.jsp?page=${selcoursebean.page+1}'>下一页</a>
							   		<a href='my_teacher.jsp?page=${selcoursebean.allpage}'>尾页</a>
							   </c:if>
					 </div>
				</div>
				<img src="../images/rightfoot.jpg" />
			</div>
		</div>
    </div>
  </body>
</html>