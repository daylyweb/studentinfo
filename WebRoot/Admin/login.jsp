<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>用户登陆...</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<style>
		#login
		{
			width:600px;
			height:200px;
		}
	</style>
  </head>
  <body>
  		
    	<div style="width:800px;height:570px;margin:0 auto;background:url(<%=basePath%>/images/login.jpg) no-repeat;">
    		<div style="width:100%;height:65%;float:left">
    		</div>
    		<div style="width:100%;height:35%;float:right">
    			<form id="login" method="post" action="<%=path %>/Login" style="margin:0 auto;" align="center" onsubmit="return check()">
					<fieldset style="border-color:grey;">
						<legend style="text-align:center">用户登录</legend>
						<p align="center" >用户名:<input type="text" name="user"  maxlength="10" /></p>
						<p align="center">密&nbsp;码:<input type="password"  name="password" maxlength="10" /></p>
						<p align="center">
						<input type="submit" value="登陆" />
						<input type="reset" value="重置" 	/>
						</p>
					</fieldset>
				</form>
			</div>
    	</div>
    	<script type="text/javascript">
    		function check()
    		{
    			var user=document.getElementsByName("username")[0];
  				var pwd=document.getElementsByName("password")[0];
  				if(pwd.value=="" || pwd.value.equals("") || user.value.equals("")||user.value=="")
				{alert("用户名或密码不能为空！");return false;}
				return true;
    		}
  			
  			
  		</script>
  </body>
</html>
