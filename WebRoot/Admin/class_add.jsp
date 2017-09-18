<%@ page language="java" import="java.util.*,com.daylyweb.studentinfo.beans.*" pageEncoding="UTF-8"%>
<%@ page contentType = "text/html;charset=UTF-8 "   %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>AddClass..</title>
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
											<td colspan="2"><h3>添加课程信息</h3></td>
											<td><input type="hidden" name="alter" value="1"/></td>
											<td><input type="hidden" name="type" value="4"/></td>
										</tr>
										<tr>
											<td>课程编号：</td>
											<td><input type="text" name="userid"/></td>
										</tr>
										<tr>
											<td>课程名：</td>
											<td><input type="text" name="username"/></td>
										</tr>
										<tr>
											<td>任课教师：</td>
											<td><input type="text" name="teacher"/></td>
										</tr>
										<tr>
											<td>上课时间：</td>
											<td><input type="text" name="time"/></td>
										</tr>
										<tr>
											<td>课室：</td>
											<td><input type="text" name="classroom"/></td>
										</tr>
										<tr>
											<td>周数：</td>
											<td><input type="text" name="weeks"/></td>
										</tr>
										<tr>
											<td>选课类型</td>
											<td>
												<select name="classtype">
													<option value="必修课">必修课</option>
													<option value="选修课">选修课</option>
													<option value="公选课">公选课</option>
												</select>
											</td>
										</tr>
										<tr>
											<td>学分</td>
											<td><input type="text" name="grade"/></td>
										</tr>
										<tr>
											<td colspan="2" style="text-align:center;">
												<button type="button" onclick="check()">添加</button> 
												<button type="reset">清 空</button>
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
