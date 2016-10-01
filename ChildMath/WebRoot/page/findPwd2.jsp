<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<% 
String email=request.getParameter("email");  
%>
<html lang="en-US" xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html"; charset="utf-8">
	<title>➕➖✖️➗我会算 找回密码</title>
	<style type="text/css">
	/*最大块*/
		#main_body{
			position: absolute;
			left: 0;
			top: 0;
			min-width: 800px;
			width:100%;
			height:100%;
			background-image: url(../picResources/background.png);
			background-size:100% 100%;
		}
		/*中间最大块*/
		#login_body{
			width:800px;
			height:460px;
			margin:0 auto;
			/*background-color:#eeeeee;*/
			margin-top:15px;
		}
		/*上部的logo*/
		#logo_body{
			width:800px;
			height:50px;
			/*background-color:#eeeeee;*/
			margin:0 auto;
		}
		#logo_img_box{
			height: 40px;
			width: 40px;
			background-image: url(../picResources/logo.png);
			background-size: 100% 100%;
			float: right;
			margin-top: 55px;
			margin-right: 280px;
		}
		/*包含表单的部分*/
		#login_box{
			width:230px;
			height:120px;
			/*background-color:#dddddd;
			margin-top:150px;
			margin-left:650px;*/
			margin:0 auto;		
		}
		/*提交按钮*/
		input[type=button]{
			width:120px;
			height:30px;
			border-radius:15px;
			margin-left:55px;
			margin-top:30px;
			outline:none;
			font-family: 黑体;
			font-size:1em;
			font-weight: bold;
			border: none;
		}
		#registButton{
			background-color:#3D9140;
			border: solid 1px #3D9140;
			color:#ffffff;
		}
		#loginButton{
			background-color:#F5F5F5;
			border: solid 1px #C0C0C0;
			color:#c0c0c0;
		}
		input[type=button]:hover{
			cursor: pointer;
		}
		#registButton:active{
			background-color: #308014;
		}
		#loginButton:active{
			background-color: #E6E6FA;
		}
	    /*找回密码的头部*/
		#login_head_box{
			width: 230px;
			height: 46px;
			font-family: 黑体;
			font-size:1.2em;
			color: #5d6160;
			margin:0 auto;
			text-align: center;
			line-height: 46px;
			font-weight: bold;
			border-bottom: solid 1px #C0C0C0;
		}
		#info{
			width: 200px;
			height: 50px;
			color:#808A87;
			margin-left: 15px;
			margin-top: 26px;
			font-family: 黑体;
			font-size: 1em;
		}
		/*找回密码整块*/
		#head_and_body{
			width: 260px;
			height: 200px;
			float: left;
			/*background-color: #00ff00;*/
			margin-left: 100px;
			margin-top: 65px;
			background-image: url(../picResources/circle_angle.png);
			background-size: 100% 100%;
		}
	    /*找回旁边的图片*/
		#welcome_img{
			width: 260px;
			height: 260px;
			float: left;
			background-image: url(../picResources/findpwd.png);
			background-size: 100% 100%;
			margin-top: 40px;
			margin-left: 65px;
		}
		/*底部图片*/
		#footer{
			width: 800px;
			height: 130px;
			position: fixed;
			bottom: 0px;
			/*float: left;
			margin-top: 105px;*/
			background-image: url(../picResources/footer.png);
			background-size: 100% 100%;
		}
	</style>

</head>
 
<body>

<div id="main_body">
	<div id="logo_body">
		<div id="logo_img_box"></div>
	</div>
	<div id="login_body">
		<div id="welcome_img"></div>
		<div id="head_and_body">
			<div id="login_head_box">
				密码验证
			</div>
			<form action="" enctype="multipart/form-data" method="post" name="form1">
			<div id="login_box">
				<div id="info">您的邮箱：<%= email%></div>
				<div>
					<input type="button" value="发送重置邮件" id="registButton" onclick="location.href='find.do?method=findPwd&email=<%= email%>'"></input>	
				</div>
			</div>
			</form>
		</div>
		<div id="footer"></div>
	</div>
</div>
</body>
</html>