<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import = "com.chinaMath.hibernate.beans.User" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style type="text/css">
	#qst_body{
		clear: both;
		overflow: auto;
		width: 800px;
		padding-top: 20px;
	}
	/*选择题目的地方*/
	#qst_choose_type{
		clear: both;
		overflow: auto;
		width: 500px;
		float: left;
		margin-left: 100px;
	}
	#qst_confirm_type{
		width: 100px;
		float: left;
	}
	#qst_start_button{
		width: 60px;
		height:20px;
		float: right;
		border: none;
		outline: none;
		background-color: #3d9140;
		color: white;
		font-family: 黑体;
		font-size: 0.8em;
		border-radius: 10px;
		visibility: hidden;
	}
	.qst_qst_type{
		margin: 0px;
		padding: 0px;
		outline: none;
		border: solid 1px #708069;
		width:120px;
		height: 20px;
		float: left;
		margin-right: 20px;
		margin-bottom: 10px;
		border-radius: 10px;
		background-color: transparent;
		color: #708069;
		font-family: 黑体;
		font-size: 0.8em;
	}
	/*盛放题目的块*/
	#qst_qst_body{
		clear: both;
		overflow: auto;
		width: 600px;
		float: left;
		margin-left: 100px;
		padding-bottom: 10px;
		border-top: solid 1px #c0c0c0;
	}
	#qst_hint{
		background-image: url(../picResources/tishi.png);
		background-size: 100% 100%;
		width: 400px;
		height: 300px;
		margin: 0 auto;
	}
	/*一题一行*/
	.qst_qst{
		width: auto;
		height: 40px;
		margin: 0 auto;
		margin-top: 5px;
		padding-left: 0;
		padding-right: 0;
		//border-bottom: solid 1px #c0c0c0;
		text-align: right;
	}
	.qst_qst p{
		margin: 0;
		padding: 0;
		width: 350px;
		height: 40px;
		line-height: 40px;
		float: left;
		text-align: right;
		font-family: 黑体;
		font-size: 1.2em;
	}
	.qst_ans{
		width: 80px;
		height: 30px;
		margin: 0;
		padding: 0;
		float: left;
		margin-top: 5px;
		margin-left: 10px;
		padding-left: 10px;
		padding-right: 10px;
		outline: none;
		border: solid 1px #c0c0c0;
		border-radius: 15px;
		font-family: 黑体;
		font-size: 1.2em;
	}
	.qst_mark{
		width: 30px;
		height: 30px;
		float: left;
		margin-top: 5px;
		margin-left: 5px;
		background-size: 100% 100%;
	}
	/*提交按钮*/
	#qst_foot{
		width: 600px;
		height: 40px;
		float: left;
		margin-left: 100px;
	}
	#qst_submit{
		width: 60px;
		height: 20px;
		float: right;
		border: none;
		outline: none;
		border-radius: 10px;
		background-color: #ff0000;
		color: white;
		font-family: 黑体;
		cursor: pointer;
		visibility: hidden;
	}
	#qst_userId{
		visibility: hidden;
		float: left;
	}
	/*计时器*/
	#qst_time{
		position: fixed;
		margin-left: 10px;
		margin-top: 100px;
		z-index: 6;
		width: 120px;
		height: 120px;
		background-image: url(../picResources/clock2.png);
		background-size: 100% 100%;
	}
	.qst_m_s{
		float: left;
		width: 120px;
		height:30px;
		font-family: 黑体;
		font-size: 1.5em;
		line-height: 30px;
		color: red;
		line-height: 30px;
		text-align: center;
	}
	#qst_min{
		margin-top: 30px;
	}
	#qst_sec{
		margin-top: 0px;
	}
</style>
<script src="../js/jquery.timer.js"></script>
<script src="../js/createMathMethods.js"></script>
<script src="../js/questionJSPclick.js"></script>
<div id="qst_body">
<% 
User user = null;
if(!session.isNew()){
	user = (User)session.getAttribute("user");
}
int grade = user.getGrade();
int userId = user.getUserID();
%>
	<div id="qst_choose_type">
<% 
switch (grade){
	case 1:
%>
		<input class="qst_qst_type first" type="button" value="20以内加法" id="qst_1_0"></input>
		<input class="qst_qst_type" type="button" value="20以内减法" id="qst_1_1"></input>
		<input class="qst_qst_type" type="button" value="20以内连加" id="qst_1_2"></input>
		<input class="qst_qst_type" type="button" value="20以内连减" id="qst_1_3"></input>
		<input class="qst_qst_type" type="button" value="20以内加减混合" id="qst_1_4"></input>
		<input class="qst_qst_type" type="button" value="100以内加减整十" id="qst_1_5"></input>
		<input class="qst_qst_type" type="button" value="100以内加减一位" id="qst_1_6"></input>
<%
	break;
	case 2:
%>
		<input class="qst_qst_type" type="button" value="两位数加法" id="qst_2_0"></input>
		<input class="qst_qst_type" type="button" value="两位数减法" id="qst_2_1"></input>
		<input class="qst_qst_type" type="button" value="表内乘法" id="qst_2_2"></input>
		<input class="qst_qst_type" type="button" value="表内除法" id="qst_2_3"></input>
		<input class="qst_qst_type" type="button" value="加减乘除混合" id="qst_2_4"></input>
		<input class="qst_qst_type" type="button" value="带括号" id="qst_2_5"></input>
<%
	break;
	case 3:
%>
		<input class="qst_qst_type" type="button" value="一位数乘除法" id="qst_3_0"></input>
		<input class="qst_qst_type" type="button" value="两位数乘除法" id="qst_3_1"></input>
<%
	break;
	case 4:
%>
		<input class="qst_qst_type" type="button" value="接近整十整百加减" id="qst_4_0"></input>
		<input class="qst_qst_type" type="button" value="接近整十整百乘法" id="qst_4_1"></input>
<%
	break;
	case 5:
%>
		<input class="qst_qst_type" type="button" value="小数乘法" id="qst_5_0"></input>
		<input class="qst_qst_type" type="button" value="小数除法" id="qst_5_1"></input>
<%
	break;
	case 6:
%>
		<input class="qst_qst_type" type="button" value="最大公约数" id="qst_6_0"></input>
		<input class="qst_qst_type" type="button" value="最小公倍数" id="qst_6_1"></input>
<%
	break;
}
%>
	</div>
	<div id="qst_confirm_type">
		<input type="button" id="qst_start_button" value="开始"></input>
	</div>
	<div id="qst_qst_body">
		<div id="qst_hint"></div>
	</div>
	<div id="qst_foot">
		<div id="qst_userId"><%=userId %></div>
		<input type="button" value="提交" id="qst_submit"></input>
	</div>
	<div id="qst_time">
		<div class="qst_m_s" id="qst_min">0</div>
		<div class="qst_m_s" id="qst_sec">0</div>
	</div>
</div>
