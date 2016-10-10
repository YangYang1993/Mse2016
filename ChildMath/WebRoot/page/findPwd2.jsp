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
		#logo_body div{
			display: inline-block;
		}
		#logo_img_box{
			height: 40px;
			width: 40px;
			background-image: url(../picResources/logo.png);
			background-size: 100% 100%;
			float: right;
			margin-top: 80px;
			margin-right: 280px;
		}
		.logo_font{
			height: 40px;
			width: 110px;
			background-image: url(../picResources/logo_font.png);
			background-size: 100% 100%;
			float: right;
			margin-top: 85px;
			margin-right: -170px;
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
		/*验证码输入框*/
		input[type=text]{
			width: 160px;
			height: 30px;
			border-radius: 5px;
			margin-top: 6px;
			margin-left: 30px;
			outline: none;
			font-size: 0.9em;
		}
		/*确定按钮*/
		input[type=button]{
			width:80px;
			height:30px;
			border-radius:5px;
			margin-left:75px;
			margin-top:5px;
			outline:none;
			font-family: 黑体;
			font-size:1em;
			font-weight: bold;
			border: none;
		}
		#registButton{
			background-color:#71C875;;
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
			font-family: 黑体;
			font-size:1.2em;
			color: #5d6160;
			margin:0 auto;
			text-align: center;
			margin-top: 20px;
			font-weight: bold;
			border-bottom: solid 1px #C0C0C0;
			height: 33px;
			/*
			line-height: 46px;*/
		}
		#info{
			width: 200px;
			height: 50px;
			color:#808A87;
			margin-left: 35px;
			margin-top: 12px;
			font-family: 黑体;
			font-size: 1em;
		}
		/*找回密码整块*/
		#head_and_body{
			width: 260px;
			height: 235px;
			float: left;
			/*background-color: #00ff00;*/
			margin-left: 100px;
			margin-top: 18px;
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
			margin-top: 80px;
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
		/*错误信息*/
		#error{
			width: 80%;
			height:18px;
			margin-left: 30px;
			margin-top: 5px;
			color: #ff0000;
			font-family: 黑体;
			font-size: 0.8em;
		}
	</style>
	<script src="../js/jquery-1.11.3.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			
			$("#verify").focus(function(){
				$("#error").empty();
			});
			
			$.isVerify = function(){
				var verify=document.getElementById('verify').value;
				if(verify == ""){
					$("#error").empty();
					$("#error").append("请输入验证码");
					return false;
				}else{
					return true;
				}
			}

			$("#registButton").click(function(){
				if($.isVerify()){
				var verify=document.getElementById('verify').value;
					location.href="changePwd.jsp?"+"verify="+verify;
				}
			});
		});
	</script>
</head>
 
<body>

<div id="main_body">
	<div id="logo_body">
		<div id="logo_img_box"></div>
		<div class="logo_font"></div>
	</div>
	<div id="login_body">
		<div id="welcome_img"></div>
		<div id="head_and_body">
			<div id="login_head_box">
				邮箱验证码
			</div>
			<form action="" enctype="multipart/form-data" method="post" name="form1">
			<div id="login_box">
				<div id="info">验证码已发送至您的邮箱：<br>
					<%= email%></div>
				<div>
					<input type="text" id="verify" placeholder="验证码"></input>
					<div id="error"></div>
					<input type="button" value="确定" id="registButton"></input>	
				</div>
			</div>
			</form>
		</div>
		<div id="footer"></div>
	</div>
</div>
</body>
</html>