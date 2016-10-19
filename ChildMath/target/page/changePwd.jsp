<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en-US" xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html"; charset="utf-8">
	<title➕➖✖️➗我会算 找回密码</title>
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
			margin-top: 80px;
			margin-right: 280px;
		}
		/*包含表单的部分*/
		#login_box{
			width:230px;
			height:180px;
			/*background-color:#dddddd;
			margin-top:150px;
			margin-left:650px;*/
			margin:0 auto;		
		}
		/*输入框*/
		input[type=text],input[type=password]{
			width:80%;
			height:31px;
			margin-left:10px;
			margin-top:10px;
			border-radius:5px;
			outline:none;
			padding-left:15px;
			padding-right: 15px;
			font-family: 黑体;
			font-size:1em;
			border: solid 1px #C0C0C0;
		}
		input[type=text]:hover,input[type=password]:hover{
			background-color:#eeeeee;
		}
		input[type=text]:focus,input[type=password]:focus{
			border-color:#808A87;
		}
		/*提交按钮*/
		input[type=button]{
			width:80px;
			height:30px;
			border-radius:5px;
			margin-left:75px;
			margin-top:20px;
			outline:none;
			font-family: 黑体;
			font-size:1em;
			font-weight: bold;
			border: none;
			
		}
		#nextButton{
			background-color:#71C875;
			border: solid 1px #3D9140;
			color:#ffffff;
		}
		input[type=button]:hover{
			cursor: pointer;
		}
		#nextButton:active{
			background-color: #308014;
		}
	    /*找回密码的头部*/
		#login_head_box{
			width: 230px;
			height: 45px;
			font-family: 黑体;
			font-size:1.2em;
			color: #5d6160;
			margin:0 auto;
			text-align: center;
			line-height: 45px;
			font-weight: bold;
			border-bottom: solid 1px #C0C0C0;
		}
		#info{
			height: 15px;
			color:#808A87;
			margin-left: 12px;
			margin-top: 10px;
			font-family: 黑体;
			font-size: 0.8em;
		}
		/*找回密码整块*/
		#head_and_body{
			width: 260px;
			height: 260px;
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
			float: left;
			margin-top: 105px;
			background-image: url(../picResources/footer.png);
			background-size: 100% 100%;
		}
		/*错误信息*/
		.error{
			width: 80%;
			height:8px;
			margin-left: 12px;
			margin-top: 5px;
			color: #ff0000;
			font-family: 黑体;
			font-size: 0.8em;
		}
		
	</style>
	<script src="../js/jquery-1.11.3.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#password").focus(function(){
				$("#error").empty();
			});

			$.isRight = function(){
				var password=document.getElementById('password').value;
				if(password == ""){
					$("#error").empty();
					$("#error").append("密码不能为空");
					return false;
				}else if($("#newpwd").val() == ""){
					$("#newpwd_error").empty();
					$("#newpwd_error").append("请确认密码");
					return false;
				}else if($("#password").val() != $("#newpwd").val()){
					$("#newpwd_error").empty();
					$("#newpwd_error").append("两次密码不一致");
					return false;
				}else{
					return true;
				}
			}

			$("#nextButton").click(function(){
				if($.isRight()){
					alert("密码设置成功！");
					var nPassword = document.getElementById('password').value;
					location.href="login.html";
					/*var form = document.forms[0];
					form.action = "getUser.do?method=changePassword2";
					form.method = "post";					
					form.submit();*/
				}
			});
		});
	</script>
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
				 设置新密码
			</div>
			<div id="login_box">
				
				<div id="info">*请填写新密码：</div>
				<form>
				<input type="text" id="password" placeholder="密码" name="password">
				</input>
				<div id="error" class="error"></div>				
				<input type="password" placeholder="确认密码" id="newpwd"></input>
				<div id="newpwd_error" class="error"></div>	
				</form>
				<div>
					<input type="button" value="提交" id="nextButton"></input>	
				</div>
			</div>
		</div>
		<div id="footer"></div>
	</div>
</div>
</body>
</html>