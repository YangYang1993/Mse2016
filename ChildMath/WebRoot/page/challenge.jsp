<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import = "com.chinaMath.hibernate.beans.User" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style type="text/css">
#chall_body{
	clear: both;
	overflow: auto;
	width: 800px;
	padding-top: 20px;
}
#chall_info{
	width: 600px;
	height: auto;
	visibility: hidden;
	float: left;
	margin-left: 100px;
}
/*盛放年级的地方*/
#chall_grade{
	clear: both;
	overflow: auto;
	width: 600px;
	padding-bottom: 5px;
	border-bottom: solid 1px #c0c0c0;
	float: left;
	margin-left: 100px;
}
.chall_grade_choose,.qst_qst_type{
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
	cursor: pointer;
}
/*挑战的题目*/
#chall_qst{
	width: 600px;
	clear: both;
	overflow: auto;
	padding-top: 10px;
	padding-bottom: 5px;
	border-bottom: solid 1px #c0c0c0;
	float: left;
	margin-left: 100px;
}
/*盛放题目的块*/
#qst_qst_body{
	clear: both;
	overflow: auto;
	width: 600px;
	float: left;
	margin-left: 100px;
	padding-bottom: 10px;
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
	border-bottom: solid 1px #c0c0c0;
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
</style>
<script src="../js/createMathMethods.js"></script>
<script src="../js/challenge.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var nowGrade = parseInt($("#chall_info").html());
	$.addChooseGrade(nowGrade);		
	$.setTop();
	
	//选择年级的按钮被点击
	$(".chall_grade_choose").click(function(){
		$.setChallGradeCss(".chall_grade_choose:focus");
		$.addChallQst(".chall_grade_choose:focus");
		$("#qst_qst_body").empty();
		$("#qst_qst_body").append("<div id='qst_hint'></div>");
		$("#qst_submit").css("visibility","hidden");
		$.setTop();
	});
	
	$("#qst_submit").click(function(){
		$.showAnswer();
	});
	//alert($("#chall_info").html());
});
</script>
<div id="chall_body">
<% 
User user = null;
if(!session.isNew()){
	user = (User)session.getAttribute("user");
}
int grade = user.getGrade();
%>
<div id="chall_grade"></div>
<div id="chall_qst"></div>
<div id="qst_qst_body">
	<div id="qst_hint"></div>
</div>
<div id="qst_foot">
	<input type="button" value="提交" id="qst_submit"></input>
</div>
<div id="chall_info"><%=grade %></div>
</div>