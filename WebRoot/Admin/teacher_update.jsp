<%@ page language="java" import="java.util.*,org.studentinfo.beans.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:useBean id="teacher" scope="page" class="org.studentinfo.beans.Teacher"  />
<jsp:useBean id="teacherbean" scope="request" class="org.studentinfo.beans.TeacherBean"  />
<jsp:setProperty property="id" name="teacher" param="id" />
<%@ page contentType = "text/html;charset=UTF-8 "   %>
<%
		request.getSession().setAttribute("alterid", teacher.getId());
		teacher = teacherbean.queryById(teacher.getId());
 %>
<jsp:setProperty property="id" name="teacher" value="<%=teacher.getId() %>" />
<jsp:setProperty property="name" name="teacher" value="<%=teacher.getName() %>" />
<jsp:setProperty property="sex" name="teacher" value="<%=teacher.getSex() %>" />
<jsp:setProperty property="birthyear" name="teacher" value="<%=teacher.getBirthyear() %>" />
<jsp:setProperty property="edu" name="teacher" value="<%=teacher.getEdu() %>" />
<jsp:setProperty property="title" name="teacher" value="<%=teacher.getTitle() %>" />
<jsp:setProperty property="entryyear" name="teacher" value="<%=teacher.getEntryyear() %>" />
<jsp:setProperty property="school" name="teacher" value="<%=teacher.getSchool() %>" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>Update..</title>
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
					<li><a href="../LoginOut">退出系统</a></li>
				</ul>
				<img alt="" src="../images/leftfoot.jpg">
			</div>
			<div id="content-right">
				<img src="../images/righthead.jpg"  />
				<div id="content-content">
					<form id="alterform" method="POST" action="<%=path%>/Alter">
						<table>
							<tr style="text-align:center">
								<td colspan="2"><h3>修改教师信息</h3></td>
								<td><input type="hidden" name="alter" value="2"/></td>
								<td><input type="hidden" name="type" value="2"/></td>
							</tr>
							<tr>
								<td>教师编号：</td>
								<td><input type="text" name="userid" readonly="true" value='${teacher.id}' /></td>
							</tr>
							<tr>
								<td>姓 名：</td>
								<td><input type="text" name="username" value='${teacher.name}' /></td>
							</tr>
							<tr>
									<td>性 别：</td>
								<td><input type="text" name="sex" value='${teacher.sex}' /></td>
							</tr>
							<tr>
								<td>出生年份：</td>
								<td>
									<select id="year" name="year">
										<%
											for(int i=1900;i<=2017;i++)
											{
												if(teacher.getBirthyear().equals(String.valueOf(i)))
												{out.println("<option value=\""+i+"\" selected=\"selected\">"+i+"年</option>");}
												else{out.println("<option value=\""+i+"\">"+i+"年</option>");}
											}
										%>
									</select>
								</td>
							</tr>
							<tr>
								<td>学历：</td>
								<td><input type="text" name="edu" value='${teacher.edu}' /></td>
							</tr>
							<tr>
								<td>职称：</td>
								<td><input type="text" name="title" value='${teacher.title}' /></td>
							</tr>
							<tr>
								<td>入职年份：</td>
								<td>
									<select id="entryyear" name="entryyear">
										<%
											for(int i=2000;i<=2017;i++)
											{
												if(String.valueOf(i).equals(teacher.getEntryyear()))
												{out.println("<option value='"+i+"' selected='selected'>"+i+"年</option>");}
												else{out.println("<option value=\""+i+"\">"+i+"年</option>");}
											}
										%>
									</select>
								</td>
							</tr>
							<tr>
								<td>学 院：</td>
								<td>
									<select id="school" name="school">
									<% 
										if(teacher.getSchool().equals("外贸系"))
										{
											out.println("<option value='外贸系' selected='selected'>外贸系</option>");
											out.println("<option value='计算机系'>计算机系</option>");
											out.println("<option value='商务系'>商务系</option>");
										}
										else if(teacher.getSchool().equals("计算机系"))
										{
											out.println("<option value='计算机系' selected='selected'>计算机系</option>");
											out.println("<option value='外贸系'>外贸系</option>");
											out.println("<option value='商务系'>商务系</option>");
										}
										else 
										{
											out.println("<option value='商务系' selected='selected'>商务系</option>");
											out.println("<option value='计算机系'>计算机系</option>");
											out.println("<option value='外贸系'>外贸系</option>");
										}
									 %>
									</select>
								</td>
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
				<img src="<%=path %>/images/rightfoot.jpg" />
			</div>
		</div>
    </div>
    <script src="<%=path %>/js/jquery.js"></script>
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
         })   
    </script>
    
  </body>
</html>
