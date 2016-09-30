<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import = "com.chinaMath.hibernate.beans.User" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style type="text/css">
	/*最大块*/
	#pi_body{
		width:800px;
		height:auto;
		padding-top: 20px;
		margin-top: 0px;
	}
	/*头部的用户名*/
	#pi_username_box{
		width: 100%;
		height: 40px;
		text-align: center;
		line-height: 40px;
		color: #000000;
		font-family: 黑体;
		font-size: 1em;
	}
	/*保存设置按钮所在行*/
	#pi_pi_head{
		width: 90%;
		height: 40px;
		margin: 0 auto;
		border-bottom: solid 1px #c0c0c0;
	}
	#pi_pi_head p{
		height:40px;
		margin: 0;
		float: left;
		line-height: 40px;
		font-family: 黑体;
		font-weight: bold;
		font-size: 1.2em;
		color: #c0c0c0;
	}
	#pi_save_pi_button{
		height: 30px;
		width: 80px;
		float: right;
		margin-top: 5px;
		color: #ffffff;
		font-family: 黑体;
		font-size: 1em;
		outline: none;
		background-color: #3D9140;
		border-radius: 15px;
		border: solid 1px #3d9140;
	}
	#pi_save_pi_button:hover{
		cursor: pointer;
	}
	/*修改个人资料和密码两块*/
	.pi_info_and_pwd{
		width: 90%;
		height: 200px;
		margin: 0 auto;
	}
	.pi_label{
		width:20%;
		height: 200px;
		float: left;
		color: #708069;
		font-family: 黑体;
		font-size: 1em;
		text-align: center;
	}
	.pi_content{
		width:80%;
		height: 200px;
		float: left;
	}
	.pi_item{
		width: 100%;
		height: 40px;
		float: left;
		margin-top: 20px;	
	}
	.pi_item p{
		margin: 0;
		width: 25%;
		height: 40px;
		float: left;
		line-height:40px;
		text-align: right;
		color: #708069;
		font-family: 黑体;
		font-size: 1em;
	}
	.pi_item img{
		border: none;
		width: 14px;
		height: 20px;
		float: left;
		margin-top: 10px;
		margin-left: -25px;
	}
	#pi_male_box, #pi_female_box{
		width: 40px;
		height: auto;
		float: left;
		margin-left: 10px;
		margin-top: 5px;
		line-height: 40px;
		border-radius: 20px;
	    border: solid 1px;
	}
	.pi_item div p{
		margin: 0;
		width: 30px;
		height: 30px;
		margin-left: 0px;
		color: white;
		font-family: 黑体;
	}
	.pi_input{
		margin: 0;
		padding: 0;
		border: solid 1px #c0c0c0;
		width: 150px;
		float: left;
		height: 30px;
		border-radius: 15px;
		outline: none;
		margin-top: 5px;
		margin-left: 10px;
		padding-left: 20px;
		padding-right: 20px;
	}
	.pi_input.radio{
		width: 40px;
		opacity: 0;
		margin-top: 0px;
		margin-left: 0px;
	}
	/*设置年级模块*/
	#pi_set_level{
		width: 90%;
		height: 50px;
		margin: 0 auto;
	}
	#pi_level_label{
		width: 20%;
		height: 50px;
		float: left;
		color: #708069;
		font-family: 黑体;
		font-size: 1em;
		text-align: center;
	}
	#pi_level_content{
		width: 80%;
		height: 50px;
		float: left;
	}
	#pi_level_content p{
		margin: 0;
		width: 25%;
		height: 40px;
		float: left;
		line-height:40px;
		text-align: right;
		color: #708069;
		font-family: 黑体;
		font-size: 1em;
	}
	.pi_level_radio_box{
		margin: 0;
		padding: 0;
		border: solid 1px #c0c0c0;
		width: 60px;
		float: left;
		height: 30px;
		margin-left: 10px;
		margin-top: 5px;
		border-radius: 15px;
		background-size: 100% 100%;
	}
	input[name=grade]{
		margin: 0;
		width: 60px;
		height: 30px;
		opacity: 0;
	}
	/*错误信息提示框*/
	.pi_error{
		height: 30px;
		width: 150px;
		float: left;
		margin-top: 5px;
		color: #ff0000;
		font-family: 黑体;
		font-size: 1em;
		line-height: 30px;
	}
</style>
<script type="text/javascript">
	$.setGender = function(){ //设置性别单选按钮的变化
		if($(".pi_input.radio:checked").val() == "1"){
			$("#pi_male_box").css({"background-image" : "url(../picResources/n1.png)", 
								"background-size":"100% 100%",
								"border-color":"#00a0e9"});
			$("#pi_female_box").css({"background-image" : "url(../picResources/n3.png)",
								"background-size":"100% 100%",
								"border-color":"#c0c0c0"});
		}else{
			$("#pi_female_box").css({"background-image" : "url(../picResources/n4.png)",
								"background-size":"100% 100%",
								"border-color":"#00a0e9"});
			$("#pi_male_box").css({"background-image" : "url(../picResources/n2.png)", 
								"background-size":"100% 100%",
								"border-color":"#c0c0c0"});
		}
	};
	
	//存储六个级别的radio所在div
	var levelArray = new Array(6);
	for(var i = 0; i<6; i++){
		levelArray[i] = "#level" + (i+1);
	}
	
	$.setLevel = function(){//设置年纪单选按钮的变化
		var levelIndex = $("input[name=grade]:checked").val();
		levelIndex = parseInt(levelIndex);
		for(var i = 0; i<6; i++){
			if((levelIndex-1) == i){
				var src = "url(../picResources/a" + (i+1) + "-1.png)";
				$(levelArray[i]).css({"background-image" : src,
									"border-color":"#00a0e9"});
				continue;
			}
			var src = "url(../picResources/a" + (i+1) + "-2.png)";
			$(levelArray[i]).css({"background-image" : src,
								"border-color":"#c0c0c0"});
		}
	};

	//检测表单填写是否正确
	$.pi_check_form = function(){
		if($("#pi_userName").val() == ""){
			$("#pi_un_error").empty();
			$("#pi_un_error").append("请填写用户名");
			return false;
		}
		if(!($("#pi_npwd").val() == "" && $("#pi_pwd1").val() == "" && $("#pi_pwd2").val() == "")){
			if($("#pi_npwd").val() == ""){
				$("#pi_npwd_error").empty();
				$("#pi_npwd_error").append("请填写当前密码");
				return false;
			}
			if($("#pi_pwd1").val() == ""){
				$("#pi_pwd1_error").empty();
				$("#pi_pwd1_error").append("请填写新密码");
				return false;
			}
			if($("#pi_pwd2").val() == ""){
				$("#pi_pwd2_error").empty();
				$("#pi_pwd2_error").append("请确认新密码");
				return false;
			}
			if($("#pi_pwd1").val() != $("#pi_pwd2").val()){
				$("#pi_pwd2_error").empty();
				$("#pi_pwd2_error").append("两次密码不一致");
				return false;
			}
			return true;
		}
		return true;
	};
	
	//检测老密码对不对
	$.pi_check_old_pwd = function(){
		if(!($("#pi_npwd").val() == "" && $("#pi_pwd1").val() == "" && $("#pi_pwd2").val() == "")){
			var info = $("#pi_npwd").val();
			info = encodeURI(info);
			$.post("/ChildMath/page/check.do?method=checkPassword&password=" + info, function(data){
				if(data == "0"){
				var form = document.forms[0];
					form.action = "/ChildMath/page/changeInfo.do?method=changeInfo";
					form.method = "post";
				    form.submit();
				}else if(data == "1"){
					$("#pi_npwd_error").empty();
					$("#pi_npwd_error").append("密码不正确");
				}
			});
			
		}else{
			var form = document.forms[0];
			form.action = "/ChildMath/page/changeInfo.do?method=changeInfo";
			form.method = "post";
		    form.submit();
		}
	};
	
	//检验名字是否重复，不重复跳转
	$.pi_check_username = function(oldun){
		var info = $("#pi_userName").val();
		if(info == oldun){
			$.pi_check_old_pwd();
		}else{
			info = encodeURI(info);
			$.post("/ChildMath/page/check.do?method=checkUsername&username=" + info, function(data){
				if(data == "0"){
					$.pi_check_old_pwd();
				}else if(data == "1"){
					$("#pi_un_error").empty();
					$("#pi_un_error").append("该用户名已被注册");
				}
			});
		}
	};

	$(document).ready(function(){
		//记录老用户名
		var oldUserName = $("#pi_userName").val();
		
		$.setGender();
		$.setLevel();
				
		$(".pi_input.radio").click(function(){
			$.setGender();
		});
		
		$("input[name=grade]").click(function(){
			$.setLevel();
		});
		
		$.setTop();
		
		//清除错误提示
		$("#pi_userName").focus(function(){
			$("#pi_un_error").empty();
		});
		$("#pi_npwd").focus(function(){
			$("#pi_npwd_error").empty();
		});
		$("#pi_pwd1").focus(function(){
			$("#pi_pwd1_error").empty();
		});
		$("#pi_pwd2").focus(function(){
			$("#pi_pwd2_error").empty();
		});
		
		//点击保存按钮
		$("#pi_save_pi_button").click(function(){
			if($.pi_check_form()){
				$.pi_check_username(oldUserName);
			}
		});
	});
</script>
<% 
 User user = null;
 if(!session.isNew()){
    user = (User)session.getAttribute("user");
    } %>
<div id="pi_body">
	<form>
	<div id="pi_username_box"><%= user.getUserName()%></div>
	<div id="pi_pi_head">
		<p>设置</p>
		<input type="button" value="保存设置" id="pi_save_pi_button"></input>
	</div>
	<div class="pi_info_and_pwd">
		<div class="pi_label">个人资料</div>
		<div class="pi_content">
			<div class="pi_item">
				<p>姓名</p>
				<input type="text" class="pi_input" id="pi_userName" name="userName" value="<%= user.getUserName()%>"></input>
				<img src="../picResources/pen.png">
				<div class="pi_error" id="pi_un_error"></div>
			</div>
			<div class="pi_item">
				<p>性别</p>
				<% 
					int sex = user.getSex();
					if(sex == 0){
				%>
					<div id="pi_male_box"><input type="radio" class="pi_input radio" name="sex" value="1"></input></div>
					<div id="pi_female_box"><input type="radio" class="pi_input radio" name="sex" value="0" checked="checked"></input></div>
				<%	
					}else if(sex == 1){
				%>
					 <div id="pi_male_box"><input type="radio" class="pi_input radio" name="sex" value="1" checked="checked"></input></div>
					<div id="pi_female_box"><input type="radio" class="pi_input radio" name="sex" value="0"></input></div>
				<%
					}
				%>
			</div>
			<div class="pi_item">
				<p>邮箱</p><input type="text" class="pi_input" disabled="disabled" name="email" value="<%= user.getEmail()%>"></input>
			</div>	
		</div>
	</div>
	<div class="pi_info_and_pwd">
		<div class="pi_label">修改密码</div>
		<div class="pi_content">
			<div class="pi_item">
				<p>当前密码</p>
				<input type="password" class="pi_input" id="pi_npwd" placeholder="当前密码"></input>
				<div class="pi_error" id="pi_npwd_error"></div>
			</div>
			<div class="pi_item">
				<p>新密码</p>
				<input type="password" class="pi_input" id="pi_pwd1" name = "password" placeholder="新密码"></input>
				<div class="pi_error" id="pi_pwd1_error"></div>
			</div>
			<div class="pi_item">
				<p>再次输入新密码</p>
				<input type="password" class="pi_input" id="pi_pwd2" placeholder="再次输入密码"></input>
				<div class="pi_error" id="pi_pwd2_error"></div>
			</div>	
		</div>
	</div>
	<div id="pi_set_level">
		<div id="pi_level_label">设置年级</div>
		<div id="pi_level_content">
			<p>现在的年级</p>
			<% 
				int grade = user.getGrade();
				switch (grade){
				case 1:
			%>
				<div id="level1" class="pi_level_radio_box"><input type="radio" name="grade" value="1" checked="checked"></input></div>
				<div id="level2" class="pi_level_radio_box"><input type="radio" name="grade" value="2"></input></div>
				<div id="level3" class="pi_level_radio_box"><input type="radio" name="grade" value="3"></input></div>
				<div id="level4" class="pi_level_radio_box"><input type="radio" name="grade" value="4"></input></div>
				<div id="level5" class="pi_level_radio_box"><input type="radio" name="grade" value="5"></input></div>
				<div id="level6" class="pi_level_radio_box"><input type="radio" name="grade" value="6"></input></div>
			<%
					break;
				case 2:
			%>
				<div id="level1" class="pi_level_radio_box"><input type="radio" name="grade" value="1"></input></div>
				<div id="level2" class="pi_level_radio_box"><input type="radio" name="grade" value="2" checked="checked"></input></div>
				<div id="level3" class="pi_level_radio_box"><input type="radio" name="grade" value="3"></input></div>
				<div id="level4" class="pi_level_radio_box"><input type="radio" name="grade" value="4"></input></div>
				<div id="level5" class="pi_level_radio_box"><input type="radio" name="grade" value="5"></input></div>
				<div id="level6" class="pi_level_radio_box"><input type="radio" name="grade" value="6"></input></div>
			<%
					break;
				case 3:
			%>
				<div id="level1" class="pi_level_radio_box"><input type="radio" name="grade" value="1"></input></div>
				<div id="level2" class="pi_level_radio_box"><input type="radio" name="grade" value="2"></input></div>
				<div id="level3" class="pi_level_radio_box"><input type="radio" name="grade" value="3" checked="checked"></input></div>
				<div id="level4" class="pi_level_radio_box"><input type="radio" name="grade" value="4"></input></div>
				<div id="level5" class="pi_level_radio_box"><input type="radio" name="grade" value="5"></input></div>
				<div id="level6" class="pi_level_radio_box"><input type="radio" name="grade" value="6"></input></div>
			<%
					break;
				case 4:
			%>
				<div id="level1" class="pi_level_radio_box"><input type="radio" name="grade" value="1"></input></div>
				<div id="level2" class="pi_level_radio_box"><input type="radio" name="grade" value="2"></input></div>
				<div id="level3" class="pi_level_radio_box"><input type="radio" name="grade" value="3"></input></div>
				<div id="level4" class="pi_level_radio_box"><input type="radio" name="grade" value="4" checked="checked"></input></div>
				<div id="level5" class="pi_level_radio_box"><input type="radio" name="grade" value="5"></input></div>
				<div id="level6" class="pi_level_radio_box"><input type="radio" name="grade" value="6"></input></div>
			<%
					break;
				case 5:
			%>
				<div id="level1" class="pi_level_radio_box"><input type="radio" name="grade" value="1"></input></div>
				<div id="level2" class="pi_level_radio_box"><input type="radio" name="grade" value="2"></input></div>
				<div id="level3" class="pi_level_radio_box"><input type="radio" name="grade" value="3"></input></div>
				<div id="level4" class="pi_level_radio_box"><input type="radio" name="grade" value="4"></input></div>
				<div id="level5" class="pi_level_radio_box"><input type="radio" name="grade" value="5" checked="checked"></input></div>
				<div id="level6" class="pi_level_radio_box"><input type="radio" name="grade" value="6"></input></div>
			<%
					break;
				case 6:
			%>
				<div id="level1" class="pi_level_radio_box"><input type="radio" name="grade" value="1"></input></div>
				<div id="level2" class="pi_level_radio_box"><input type="radio" name="grade" value="2"></input></div>
				<div id="level3" class="pi_level_radio_box"><input type="radio" name="grade" value="3"></input></div>
				<div id="level4" class="pi_level_radio_box"><input type="radio" name="grade" value="4"></input></div>
				<div id="level5" class="pi_level_radio_box"><input type="radio" name="grade" value="5"></input></div>
				<div id="level6" class="pi_level_radio_box"><input type="radio" name="grade" value="6" checked="checked"></input></div>
			<%
					break;
				}
			%>
		</div>
	</div>
	</form>
</div>