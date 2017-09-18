<%@ page language="java" import="java.util.*,org.studentinfo.beans.*,org.studentinfo.dao.*" pageEncoding="UTF-8"%>
<%@ page contentType = "text/html;charset=UTF-8 "   %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	User loginuser = (User)session.getAttribute("loginuser");
	session.setAttribute("classid",request.getParameter("classid"));
%>
<jsp:useBean id="selcoursebean" scope="page" class="org.studentinfo.beans.SelCourseBean">
	<jsp:setProperty property="classid" name="selcoursebean" param="classid" />
	<jsp:setProperty property="usertype" name="selcoursebean" value="4" />
	<jsp:setProperty property="students" name="selcoursebean" value="${selcoursebean.students}" />
	<jsp:setProperty property="page" name="selcoursebean" param="page" />
</jsp:useBean>
<jsp:useBean id="selcourse" scope="page" class="org.studentinfo.beans.SelCourse" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>AllCourse...</title>
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
						<table id="table" style="margin-top: 10px;">
							<tr style="text-align:center">
									<td colspan="4"><h3>学生名单</h3></td>
									<td><input type="hidden" name="alter" value="3"/></td>
							</tr>
							<tr align="center">
								<th>学号</th>
								<th>姓名</th>
								<th>成绩</th>
								<th>操作</th>
							</tr>
							<c:forEach items="${selcoursebean.students}" var="varstudent" begin="${selcoursebean.page*10-10}" end="${selcoursebean.page*10-1}" varStatus="status" >
								<jsp:setProperty property="studentid" name="selcourse" value="${varstudent.studentid}"/>
								<c:if test="${status.index < selcoursebean.size}">
									<tr align='center'>
										<td id='${varstudent.studentid}'>${varstudent.studentid}</td>
										<td><%=new StudentDAO().queryNameById(selcourse.getStudentid()) %></td>
										<c:if test="${varstudent.grade!=-1}">
											<td>${varstudent.grade}</td>
											<td><a>已修完</a></td>
										</c:if>
										<c:if test="${varstudent.grade==-1}">
											<td>未打分</td>
											<td><a href="alter_teacher.jsp?studentid=${varstudent.studentid}">打分</a></td>
										</c:if>
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
							   		<a href='stu_teacher.jsp?classid=${selcoursebean.classid}'>首页</a>
							   		<a href='stu_teacher.jsp?classid=${selcoursebean.classid}&page=${selcoursebean.page-1}'>上一页</a>
							   </c:if>
							   <c:if test="${selcoursebean.page==selcoursebean.allpage}" var="flag1"></c:if>
							    <c:if test="${flag1==true}">
							    	<a>下一页</a>
							   		<a>尾页</a>
							    </c:if>
							    <c:if test="${flag1==false}">
							   		<a href='stu_teacher.jsp?classid=${selcoursebean.classid}&page=${selcoursebean.page+1}'>下一页</a>
							   		<a href='stu_teacher.jsp?classid=${selcoursebean.classid}&page=${selcoursebean.allpage}'>尾页</a>
							   </c:if>
					 </div>
				</div>
				<img src="../images/rightfoot.jpg" />
			</div>
		</div>
    </div>
  </body>
</html>