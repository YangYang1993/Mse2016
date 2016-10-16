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

/*盛放题目的块*/
#qst_qst_body{
	clear: both;
	overflow: auto;
	width: 800px;
	float: left;
	padding-bottom: 10px;
}
.chall_qst{
	color: black;
	font-family: 黑体;
	font-size: 1.2em;
	border: none;
	outline: none;
	margin-left: 55px;
	cursor: pointer;
	margin-top: 10px;
}
.chall_qst div{
	display: inline-block;
}
.download_btn{
	width: 50px;
	height: 25px;
	float: right;
	margin-right: 40px;
	color: #ffffff;
	font-family: 黑体;
	outline: none;
	background-color: #48b937;
	border-radius: 10px;
	border: solid 1px #416c4e;
}
</style>
<script src="../js/createMathMethods.js"></script>
<script src="../js/challenge.js"></script>
<script type="text/javascript">

</script>
<div id="chall_body">
<% 
User user = null;
if(!session.isNew()){
	user = (User)session.getAttribute("user");
}
int grade = user.getGrade();
%>

<div id="qst_qst_body">
	
	<div class="chall_qst">
		<div >一年级奥数习题</div>
		
			<a href="../challengeFile/一年级奥数.txt"><button class="download_btn">下载</button></a>
		
	</div>
	<div class="chall_qst">
		<div>二年级奥数习题</div>
		
			<a href="../challengeFile/二年级奥数.txt"><button class="download_btn">下载</button></a>
		
	</div>
	<div class="chall_qst">
		<div>三年级奥数习题</div>
		
			<a href="../challengeFile/三年级奥数.txt"><button class="download_btn">下载</button></a>
		
	</div>
	<div class="chall_qst">
		<div>四年级奥数习题</div>
		
			<a href="../challengeFile/四年级奥数.txt"><button class="download_btn">下载</button></a>
		
	</div>
	<div class="chall_qst">
		<div>五年级奥数习题</div>
		
			<a href="../challengeFile/五年级奥数.txt"><button class="download_btn">下载</button></a>
	
	</div>
	<div class="chall_qst">
		<div>六年级奥数习题</div>
		
			<a href="../challengeFile/六年级奥数.txt"><button class="download_btn">下载</button></a>
		
	</div>
	<div class="chall_qst">
		<div>小学奥数专题</div>
		<a href="../challengeFile/小学奥数专题.txt"><button class="download_btn">下载</button></a>
	</div>
	<div class="chall_qst">
		<div>小升初奥数知识点</div>
		<a href="../challengeFile/小升初奥数知识点.txt"><button class="download_btn">下载</button></a>
	</div>
	<div class="chall_qst">
		<div>小升初数习模拟练习</div>
		<a href="../challengeFile/小升初数学模拟试卷及答案.txt"><button class="download_btn">下载</button></a>
	</div>
</div>

</div>