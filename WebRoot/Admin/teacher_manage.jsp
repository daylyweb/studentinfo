<%@ page language="java" import="java.util.*,org.studentinfo.beans.*" pageEncoding="UTF-8"%>
<%@ page contentType = "text/html;charset=UTF-8 "   %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:useBean id="teacher" scope="page" class="org.studentinfo.beans.Teacher"  />
<jsp:useBean id="teacherbean" scope="page" class="org.studentinfo.beans.TeacherBean">
<jsp:setProperty property="page" name="teacherbean" param="page" />
<jsp:setProperty property="allteacher" name="teacherbean" value="${teacherbean.allteacher}"/>
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
					<li class="selected"><a href="teacher_manage.jsp">教师管理</a></li>
					<li><a href="user_manage.jsp">用户管理</a></li>
					<li><a href="alterpass.jsp">修改密码</a></li>
					<li><a href="../Admin/LoginOut">退出系统</a></li>
				</ul>
				<img alt="" src="../images/leftfoot.jpg">
			</div>
			<div id="content-right">
				<img src="../images/righthead.jpg"  />
				<div id="content-content">
					<div class="list">
						<span class="add"><a href="<%=path %>/Admin/teacher_add.jsp">添加教师信息</a></span>
						<table id="table">
							<tr align="center">
								<th>教师编号</th>
								<th>姓名</th>
								<th>性别</th>
								<th>出生年份</th>
								<th>学历</th>
								<th>职称</th>
								<th>入职年份</th>
								<th>院系</th>
								<th>操作</th>
							</tr>
							<c:forEach items="${teacherbean.allteacher}" var="teacher" begin="${teacherbean.page*10-10}" end="${teacherbean.page*10-1}" varStatus="status" >
								
								<c:if test="${status.index < teacherbean.size}">
									<tr align='center' class="tr">
										<td id='${teacher.id}'>${teacher.id}</td>
										<td>${teacher.name}</td>
										<td>${teacher.sex}</td>
										<td>${teacher.birthyear}</td>
										<td>${teacher.edu}</td>
										<td>${teacher.title}</td>
										<td>${teacher.entryyear}</td>
										<td>${teacher.school}</td>
										<td>
											<a href='teacher_update.jsp?id=${teacher.id}'>修改</a>/
											<a href="javascript:void(0)" name='${teacher.id}' onclick="con(this)">删除</a>
										</td>
									</tr>
								</c:if>
							</c:forEach>
						</table>
						
					</div>	
					<div class="pagegroup">
							   第${teacherbean.page}页，共${teacherbean.allpage}页<br>
							   <c:if test="${teacherbean.page==1}" var="flag"></c:if>
							   <c:if test="${flag==true}">
							   		<a>首页</a>
							   		<a>上一页</a>
							   </c:if>
							   <c:if test="${flag==false}">
							   		<a href='teacher_manage.jsp'>首页</a>
							   		<a href='teacher_manage.jsp?page=${teacherbean.page-1}'>上一页</a>
							   </c:if>
							   <c:if test="${teacherbean.page==teacherbean.allpage}" var="flag1"></c:if>
							    <c:if test="${flag1==true}">
							    	<a>下一页</a>
							   		<a>尾页</a>
							    </c:if>
							    <c:if test="${flag1==false}">
							   		<a href='teacher_manage.jsp?page=${teacherbean.page+1}'>下一页</a>
							   		<a href='teacher_manage.jsp?page=${teacherbean.allpage}'>尾页</a>
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
				window.location.href="<%=path%>/Alter?type=2&alter=3&userid="+$(dom).prop("name");
			}
		}
		</script>
  </body>
</html>