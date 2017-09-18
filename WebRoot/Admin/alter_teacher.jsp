<%@ page language="java" import="java.util.*,org.studentinfo.beans.*,org.studentinfo.dao.*" pageEncoding="UTF-8"%>
<%@ page contentType = "text/html;charset=UTF-8 "   %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	User loginuser = (User)session.getAttribute("loginuser");
	int studentid = Integer.valueOf(request.getParameter("studentid"));
	//int classid=Integer.valueOf(request.getParameter("classid"));
	String name=new StudentDAO().queryNameById(studentid);
	session.setAttribute("studentid",studentid);
	//session.setAttribute("classid", classid);
%>
<jsp:useBean id="slecourse" scope="page" class="org.studentinfo.beans.SelCourse"></jsp:useBean>
<jsp:useBean id="selcoursebean" scope="page" class="org.studentinfo.beans.SelCourseBean">
	<jsp:setProperty property="studentid" name="selcoursebean" param="studentid" />
</jsp:useBean>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>SetGrade...</title>
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
							<form id="alterform" method="POST" action="../StuAlter">
									<table>
										<tr style="text-align:center">
											<td colspan="2"><h3>打分</h3></td>
											<td><input type="hidden" name="alter" value="3"/></td>
										</tr>
										<tr>
											<td>学生编号：</td>
											<td><input type="text" name="studentid" value="<%=studentid %>" readonly="readonly"/></td>
										</tr>
										<tr>
											<td>学生姓名：</td>
											<td><input type="text" name="studentname" value="<%=name %>" readonly="readonly"/></td>
										</tr>
										<tr>
											<td>成绩：</td>
											<td><input type="text" name="grade" /></td>
										</tr>
										<tr>
											<td colspan="2" style="text-align:center;">
												<button type="button" onclick="check()">打分</button> 
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
			$("input").each(function(i){
					if($(this).val()==""){flag=false;}
				}		
			);
			if(flag)
			{
				$("#alterform").submit();
			}
			else
			{
				alert("所有输入框不能留空！");
			}
		}
		
		$("input[name='grade']").keyup(function(){  
            var c=$(this);  
            if(/[^\d]/.test(c.val())){//替换非数字字符  
              var temp_amount=c.val().replace(/[^\d]/g,'');  
              $(this).val(temp_amount);  
            }  
         });
     
    </script>
  </body>
</html>