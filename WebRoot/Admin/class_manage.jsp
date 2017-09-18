<%@ page language="java" import="java.util.*,com.daylyweb.studentinfo.beans.*" pageEncoding="UTF-8"%>
<%@ page contentType = "text/html;charset=UTF-8 "   %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:useBean id="Class" scope="page" class="com.daylyweb.studentinfo.beans.Class"  />
<jsp:useBean id="classbean" scope="page" class="com.daylyweb.studentinfo.beans.ClassBean">
	<jsp:setProperty property="page" name="classbean" param="page" />
	<jsp:setProperty property="allclass" name="classbean" value="${classbean.allclass}" />
</jsp:useBean>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>ClassManage...</title>
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
					<li class="selected"><a href="class_manage.jsp">课程管理</a></li>
					<li><a href="stu_manage.jsp">学生管理</a></li>
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
						<span class="add"><a href="./class_add.jsp">添加课程信息</a></span>
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
							<c:forEach items="${classbean.allclass}" var="Class" begin="${classbean.page*10-10}" end="${classbean.page*10-1}" varStatus="status" >
								
								<c:if test="${status.index < classbean.size}">
									<tr align='center' class="tr">
										<td id='${Class.id}'>${Class.id}</td>
										<td>${Class.name}</td>
										<td>${Class.teacher}</td>
										<td>${Class.time}</td>
										<td>${Class.classroom}</td>
										<td>${Class.weeks}</td>
										<td>${Class.type}</td>
										<td>${Class.grade}</td>
										<td>
											<a href='class_update.jsp?id=${Class.id}'>修改</a>/
											<a href="javascript:void(0)" name='${Class.id}' onclick="con(this)">删除</a>
										</td>
									</tr>
								</c:if>
							</c:forEach>
						</table>
						
					</div>	
					<div class="pagegroup" align="center">
							   第${classbean.page}页，共${classbean.allpage}页<br>
							   <c:if test="${classbean.page==1}" var="flag"></c:if>
							   <c:if test="${flag==true}">
							   		<a>首页</a>
							   		<a>上一页</a>
							   </c:if>
							   <c:if test="${flag==false}">
							   		<a href='class_manage.jsp'>首页</a>
							   		<a href='class_manage.jsp?page=${classbean.page-1}'>上一页</a>
							   </c:if>
							   <c:if test="${classbean.page==classbean.allpage}" var="flag1"></c:if>
							    <c:if test="${flag1==true}">
							    	<a>下一页</a>
							   		<a>尾页</a>
							    </c:if>
							    <c:if test="${flag1==false}">
							   		<a href='class_manage.jsp?page=${classbean.page+1}'>下一页</a>
							   		<a href='class_manage.jsp?page=${classbean.allpage}'>尾页</a>
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
				window.location.href="<%=path%>/Alter?type=4&alter=3&userid="+$(dom).prop("name");
			}
		}
		</script>
  </body>
</html>