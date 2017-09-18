<%@ page language="java" import="java.util.*,org.studentinfo.beans.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:useBean id="Class" scope="page" class="org.studentinfo.beans.Class"  />
<jsp:useBean id="classbean" scope="request" class="org.studentinfo.beans.ClassBean"  />
<jsp:setProperty property="id" name="Class" param="id" />
<%@ page contentType = "text/html;charset=UTF-8 "   %>
<%
	session.setAttribute("alterid", Class.getId());
	Class = classbean.queryById(Class.getId());
 %>
<jsp:setProperty property="id" name="Class" value="<%=Class.getId()%>" />
<jsp:setProperty property="name" name="Class" value="<%=Class.getName() %>" />
<jsp:setProperty property="teacher" name="Class" value="<%=Class.getTeacher() %>" />
<jsp:setProperty property="time" name="Class" value="<%=Class.getTime() %>" />
<jsp:setProperty property="classroom" name="Class" value="<%=Class.getClassroom() %>" />
<jsp:setProperty property="weeks" name="Class" value="<%=Class.getWeeks()%>" />
<jsp:setProperty property="type" name="Class" value="<%=Class.getType() %>" />
<jsp:setProperty property="grade" name="Class" value="<%=Class.getGrade() %>" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>ClassUpdate..</title>
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
								<form id="alterform" method="POST" action="../Alter">
									<table>
										<tr style="text-align:center">
											<td colspan="2"><h3>修改课程信息</h3></td>
											<td><input type="hidden" name="alter" value="2"/></td>
											<td><input type="hidden" name="type" value="4"/></td>
										</tr>
										<tr>
											<td>课程编号：</td>
											<td><input type="text" readonly="true" name="userid" value="${Class.id}"/></td>
										</tr>
										<tr>
											<td>课程名：</td>
											<td><input type="text" name="username" value="${Class.name}" /></td>
										</tr>
										<tr>
											<td>任课教师：</td>
											<td><input type="text" name="teacher" value="${Class.teacher}" /></td>
										</tr>
										<tr>
											<td>上课时间：</td>
											<td><input type="text" name="time" value="${Class.time}" /></td>
										</tr>
										<tr>
											<td>课室：</td>
											<td><input type="text" name="classroom" value="${Class.classroom}" /></td>
										</tr>
										<tr>
											<td>周数：</td>
											<td><input type="text" name="weeks" value="${Class.weeks}" /></td>
										</tr>
										<tr>
											<td>选课类型</td>
											<td>
												<select name="classtype">
													<% 
														if(Class.getType().equals("选修课"))
														{
															out.println("<option value='选修课' selected='selected'>选修课</option>");
															out.println("<option value='必修课'>必修课</option>");
															out.println("<option value='公选课'>公选课</option>");
														}
														else if(Class.getType().equals("必修课"))
														{
															out.println("<option value='选修课'>选修课</option>");
															out.println("<option value='必修课' selected='selected'>必修课</option>");
															out.println("<option value='公选课'>公选课</option>");
														}
														else 
														{
															out.println("<option value='选修课'>选修课</option>");
															out.println("<option value='必修课'>必修课</option>");
															out.println("<option value='公选课' selected='selected'>公选课</option>");
														}
													 %>
												</select>
											</td>
										</tr>
										<tr>
											<td>学分</td>
											<td><input type="text" name="grade" value="${Class.grade}" /></td>
										</tr>
										<tr>
											<td colspan="2" style="text-align:center;">
												<button type="button" onclick="check()">修改</button> 
												<button type="button"onclick="window.history.back();">返回</button>
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
		
		$("input[name='userid']").keyup(function(){  
            var c=$(this);  
            if(/[^\d]/.test(c.val())){//替换非数字字符  
              var temp_amount=c.val().replace(/[^\d]/g,'');  
              $(this).val(temp_amount);  
            }  
         });
     
         $("input[name='teacher']").keyup(function(){  
            var c=$(this);  
            if(/[^\d]/.test(c.val())){//替换非数字字符  
              var temp_amount=c.val().replace(/[^\d]/g,'');  
              $(this).val(temp_amount);  
            }  
         });
    </script>
    
  </body>
</html>
