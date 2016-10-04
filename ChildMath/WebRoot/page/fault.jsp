<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import = "com.chinaMath.hibernate.beans.User" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style type="text/css">
/*盛放题目的块*/
	#fault_qst_body{
		clear: both;
		overflow: auto;
		width: 800px;
		float: left;
		padding-left: 100px;
		padding-bottom: 10px;
		/*border-top: solid 1px #c0c0c0;*/
		margin-top: 15px;
	}
	/*题行*/
	.fault_qst{
		width: 350px;
		height: 35px;
		margin: 0 auto;
		margin-top: 5px;
		padding-left: 50px;
		padding-right: 0;
		border-bottom: solid 1px #c0c0c0;
		text-align: left;
		float: left;

	}
	.fault_qst_qst{
		margin: 0;
		padding: 0;
		height: 35px;
		line-height: 40px;
		float: left;
		text-align: left;
		font-family: 黑体;
		font-size: 1.2em;
		
	}	
	.fault_ans{
		width: 60px;
		height: 35px;
		/*margin: 0;		
		margin-top: -35px;*/
		margin-left: 8px;
		padding: 0 10px;
		float: left;
		outline: none;
		border: solid 1px #c0c0c0;
		border-radius: 15px;
		font-family: 黑体;
		font-size: 1.2em;
		
	}
	/*提交按钮*/
	#qst_foot{
		width: 600px;
		height: 40px;
		float: left;
		margin-left: 100px;
	}
	#add_fault{
		padding-left: 10px;
		padding-right: 10px;
		height: 25px;
		border: none;
		outline: none;
		border-radius: 10px;
		background-color: #ff0000;
		color: white;
		font-family: 黑体;
		position: absolute;
		right: 380px;
		cursor: pointer;
		
	}
	.remove_qst{
		padding-left: 10px;
		padding-right: 10px;
		height: 25px;
		border: none;
		outline: none;
		border-radius: 10px;
		background-color: #ff0000;
		color: white;
		font-family: 黑体;
		position: absolute;
		right: 380px;
		cursor: pointer;
		
	}	
	.check_ans{
		padding-left: 10px;
		padding-right: 10px;
		height: 25px;
		border: none;
		outline: none;
		border-radius: 10px;
		background-color: #48b937;
		color: white;
		font-family: 黑体;
		position: absolute;
		right: 300px;
		cursor: pointer;
			
	}
</style>
<script src="../js/jquery.timer.js"></script>
<script src="../js/createMathMethods.js"></script>
<script src="../js/questionJSPclick.js"></script>
<% 
User user = null;
if(!session.isNew()){
	user = (User)session.getAttribute("user");
}
int grade = user.getGrade();
int userId = user.getUserID();
%>
<div id="fault_qst_body">
	
</div>
<div>
	<input type="button" value="保存错题" id="add_fault"></input>
</div>