<%@ page language="java" import="java.util.*,com.daylyweb.studentinfo.beans.*" pageEncoding="UTF-8"%>
<%@ page contentType = "text/html;charset=UTF-8 "   %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:useBean id="student" scope="page" class="com.daylyweb.studentinfo.beans.Student"  />
<jsp:useBean id="studentbean" scope="page" class="com.daylyweb.studentinfo.beans.StudentBean">
<jsp:setProperty property="page" name="studentbean" param="page" />
<jsp:setProperty property="allstudent" name="studentbean" value="${studentbean.allstudent}"/>
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
					<li class="selected"><a href="stu_manage.jsp">学生管理</a></li>
					<li><a href="teacher_manage.jsp">教师管理</a></li>
					<li><a href="user_manage.jsp">用户管理</a></li>
					<li><a href="alterpass.jsp">修改密码</a></li>
					<li><a href="../LoginOut">退出系统</a></li>
				</ul>
				<img alt="" src="../images/leftfoot.jpg">
			</div>
			<div id="content-right">
				<img src="../images/righthead.jpg"  />
				<div id="content-content">
					<div class="list">
						<span class="add"><a href="stu_add.jsp">添加学生信息</a></span>
						<table id="table">
							<tr>
								<th>学号</th>
								<th>姓名</th>
								<th>性别</th>
								<th>出生年份</th>
								<th>入学时间</th>
								<th>院系</th>
								<th>操作</th>
							</tr>
							<c:forEach items="${studentbean.allstudent}" var="student" begin="${studentbean.page*10-10}" end="${studentbean.page*10-1}" varStatus="status" >
								
								<c:if test="${status.index < studentbean.size}">
									<tr align='center'>
										<td id='${student.id}'>${student.id}</td>
										<td>${student.name}</td>
										<td>${student.sex}</td>
										<td>${student.birthyear}</td>
										<td>${student.entrydate}</td>
										<td>${student.school}</td>
										<td>
											<a href='stu_update.jsp?id=${student.id}'>修改</a>/
											<a href="javascript:void(0)" name='${student.id}' onclick="con(this)">删除</a>
										</td>
									</tr>
								</c:if>
							</c:forEach>
						</table>
						
					</div>	
					<div class="pagegroup" >
							   第${studentbean.page}页，共${studentbean.allpage}页<br>
							   <c:if test="${studentbean.page==1}" var="flag"></c:if>
							   <c:if test="${flag==true}">
							   		<a>首页</a>
							   		<a>上一页</a>
							   </c:if>
							   <c:if test="${flag==false}">
							   		<a href='stu_manage.jsp'>首页</a>
							   		<a href='stu_manage.jsp?page=${studentbean.page-1}'>上一页</a>
							   </c:if>
							   <c:if test="${studentbean.page==studentbean.allpage}" var="flag1"></c:if>
							    <c:if test="${flag1==true}">
							    	<a>下一页</a>
							   		<a>尾页</a>
							    </c:if>
							    <c:if test="${flag1==false}">
							   		<a href='stu_manage.jsp?page=${studentbean.page+1}'>下一页</a>
							   		<a href='stu_manage.jsp?page=${studentbean.allpage}'>尾页</a>
							   </c:if>
					 </div>
				</div>
				<img src="../images/rightfoot.jpg" />
			</div>
		</div>
    </div>
    <script type="text/javascript" src="../js/jquery.js"></script>
    <script type="text/javascript">
		function con(dom)
		{
			if(confirm("确定删除吗？"))
			{
				window.location.href="<%=path%>/Alter?type=3&alter=3&userid="+$(dom).prop("name");
			}
		}
		</script>
  </body>
</html>