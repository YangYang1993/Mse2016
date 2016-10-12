<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import = "com.chinaMath.hibernate.beans.User" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>➕➖✖️➗我会算 主页</title>
<style type="text/css">
	body{
		margin-top: 0px;
		background-color: #efefef;
	}
	/*最外层大块*/
	#biggest_box{
		/*position: absolute;*/
		width:800px;
		height:auto;
		background-color:#efefef;
		margin:0 auto;
		margin-top: 0;
	}
	/*头部*/
	#head_box{
		background-color: #f07575;
		width: 800px;
		height: 20px;
	}
	#logo{
		background-image:url(../picResources/.png); 
		background-size: 100% 100%;
		width: 120px;
		height: 18px;
		float: left;
		margin-top: 2px;
		margin-left: 6px;

	}
	#user_box{
		height: 20px;
		width: auto;
		float:right;
		text-align: center;
		line-height: 20px;
	}
	#user_box a{
		text-decoration: none;
		outline: none;
		margin: 0;
		padding: 0;
		margin-left: 6px;
		margin-right: 6px;
		float: left;
		font-family: 黑体;
		color: white;
		cursor: pointer;
	}

	/*功能模块*/
	#function_box{
		height: 80px;
		width: 800px;
		background-color: #d44;
		margin-bottom: 15px;
	}
	#function_box a:hover{
		cursor: pointer;
	}
	.learn_box{ /*两边的功能*/
		width: 60px;
		height:60px;
		float: left;
		background-size: 100% 100%;
		margin-left: 34px;
		margin-right: 34px;
		text-decoration: none;
		outline: none;
	}
	.learn_box img{
		width: 60px;
		height: 55px;
		border: 0;
		margin-right: 50px;
	}
	#practice_box{
		margin-left: 100px;
	}
	#self_box{
		margin-left: 90px;
	}
	#head_pic_box{ /*头像部分*/
		width: 100px;
		height: 100px;
		background-image: url(../picResources/login_0038_head-bottom.png);
		background-size: 100% 100%;
		float: left;
		margin-left: 90px;
	}
	#head_pic_box a{
		display: block;
		width: 90px;
		height: 90px;
		margin-top: 5px;
		margin-left: 5px;
		outline: none;
		text-decoration: none;
	}
	#head_pic_box a img{
		width: 90px;
		height: 90px;
		border: 0;
	}
	/*功能被点击后的指示条*/
	#mark_box{
		width:800px;
		height: 5px;
	}
	#practice_mark{
		width: 160px;
		height: 5px;
		float: left;
		margin-left: -350px;
	}
	#self_mark{
		width: 160px;
		height: 5px;
		background-color: #007fb2;
		float: left;
		margin-left: 90px;
	}

	/*背景大长条*/
	#back_head_box{
		position: absolute;
		top: 0;
		left: 0;
		background-color: #f07575;
		width: 100%;
		height: 20px; 
		z-index: -1;
	}
	#back_function_box{
		position: absolute;
		top:20px;
		left: 0;
		height: 80px;
		width: 100%;
		background-color: #d44;
		z-index: -1;
	}
	/*页末*/
	#footer_box{
		/*
		width: 800px;
		height: 120px;
		background-color: #eeeeee;
		margin-top: 20px;
		border-top: solid 1px #C0C0C0;*/
	}
	#group_info{
		width: 800px;
		height: 90px;
	}
	.group_info_item{
		width: 200px;
		height: 90px;
		float: left;
		color: #c0c0c0;
		font-family: 黑体;
		text-align: center;
	}
	/*页脚的背景大长条*/
	#back_footer1_box{
		position: absolute;
		left: 0;
		top: 0;
		z-index: -1;
		width: 100%;
		height: 90px;
	}
	#back_footer2_box{
		position: absolute;
		left: 0;
		top: 0;
		z-index: -1;
		width: 100%;
		height: 26px;
	}
	#content_box{
		width: 800px;
		height: auto;
	}
	.footer_line{
		width:800px;
		height:1px;
		margin:0px auto;
		padding:0px;
		background-color:#D5D5D5;
		overflow:hidden;
		float: left;
		margin-top: 15px;
	}
	/*底部链接*/
	table{
		border: none;
		width: 100%;
		height: 100%;
		font-family: 黑体;
	}
	table td{
		width: 200px;
		text-align: center;
		color: #708069;
	}
	table td a{
		outline: none;
		text-decoration: none;
		cursor: pointer;
		color: #c0c0c0;
		font-size: 0.8em;
	}
	table td img{
		width: 60px;
		height: 60px;
		border: none;
	}
	#my_practice{
		background-image:url(../picResources/self_practice_logo.png); 
        width: 65px;
        height: 62px;
        background-size: 100% 100%;
        cursor: pointer;
	}
	#fault_book{
		background-image:url(../picResources/fault_book_logo.png); 
        width: 65px;
        height: 62px;
        background-size: 100% 100%;
        cursor: pointer;
	}
	#my_honor{
		background-image:url(../picResources/honor_logo.png); 
        width: 65px;
        height: 62px;
        background-size: 100% 100%;
        cursor: pointer;
	}
	#challenge_self{
		background-image:url(../picResources/challenge_logo.png); 
        width: 65px;
        height: 62px;
        background-size: 100% 100%;
        cursor: pointer;
	}
	#self_learn{
		background-image:url(../picResources/self_learn_logo.png); 
        width: 65px;
        height: 62px;
        background-size: 100% 100%;
        cursor: pointer;
	}
	#self_info{
		background-image:url(../picResources/personal_info_logo.png); 
        width: 65px;
        height: 62px;
        background-size: 100% 100%;
        cursor: pointer;
	}
	.function_font{
		color: white;
		position: relative;
		top: 60px;
	}
</style>

<script src="../js/jquery-1.11.3.js"></script>
<script src="../js/highcharts.js"></script>
<script src="../js/exporting.js"></script>
<script type="text/javascript">
	$.setTop = function(){
		var content_box_height = $("#content_box").css("height");
		content_box_height = content_box_height.substring(0, content_box_height.indexOf("px"));
		$("#back_footer1_box").css("top", 125 + parseInt(content_box_height));
		$("#back_footer2_box").css("top", 216 + parseInt(content_box_height));
	};
	
	$.loadPage = function(index){
		switch (index){
			case 0: //加载我的徽章页
				/*
				$("#practice_mark").css("background-color","transparent");
				$("#self_mark").css("background-color","transparent");
				$("#head_pic_box").css("background-image","url(../picResources/login_0038_head_bottom2.png)");
				*/
				$("#content_box").load("honor.jsp");
			break;
			case 1: //加载快乐自学页
				/*
				$("#practice_mark").css("background-color","transparent");
				$("#head_pic_box").css("background-image","url(../picResources/login_0038_head-bottom.png)");
				$("#self_mark").css("background-color","#007fb2");
				*/
				$("#content_box").load("self_learn.jsp");
			break;
			case 2: //加载我的练习页
				/*
				$("#head_pic_box").css("background-image","url(../picResources/login_0038_head-bottom.png)");
				$("#self_mark").css("background-color","transparent");
				$("#practice_mark").css("background-color","#007fb2");
				*/
				$("#content_box").load("self_practice.jsp");
			break;
			case 3: //加载个人信息页
				/*
				$("#head_pic_box").css("background-image","url(../picResources/login_0038_head-bottom.png)");
				$("#self_mark").css("background-color","transparent");
				$("#practice_mark").css("background-color","transparent");
				*/
				$("#content_box").load("personal_info.jsp");
			break;
			
			case 4:  //加载每日练习页
				$("#content_box").load("question.jsp");
			break;
			case 5:  //加载自我挑战页
				$("#content_box").load("challenge.jsp");
			break;
			case 6:  //加载错题本页
				$("#content_box").load("fault_book.jsp");
			/*
			case -1:  //加载视频页
				$("#content_box").load("video.jsp");
			break;
			*/
		}
	};

	$(document).ready(function(){
		$.loadPage(4);
		/*
		$("#personal_info").click(function(){
			$.loadPage(0);
		});

		$("#self_box").click(function(){
			$.loadPage(1);
		});

		$("#practice_box").click(function(){
			$.loadPage(2);
		});	
		*/
	});
</script>
</head>
<body>
<%
 User user = null;
 //if(!session.isNew()){
    user = (User)session.getAttribute("user");
    //} 
%>

<div id="back_head_box"></div>
<div id="back_function_box"></div>

<div id="back_footer1_box"></div>
<div id="back_footer2_box"></div>


<div id="biggest_box">
	<div id="head_box">
		<div id="logo">➕➖✖️➗我会算</div>
		<div id="user_box">
			<a onclick="$.loadPage(3)">你好,&nbsp
				<%= user.getUserName()%>&nbsp;&nbsp;&nbsp;&nbsp;小朋友
			</a>
			<a href="logout.do?user=<%=user.getUserName() %>" >退出</a>
		</div>
	</div>
	<div id="function_box">
		<div class="learn_box" id="my_practice" onclick="$.loadPage(4)">
			<div class="function_font">每日练习</div>
		</div>
		<div class="learn_box" id="fault_book" onclick="$.loadPage(6)">
			<div class="function_font">&nbsp;&nbsp;错题本</div>
		</div>
		<div class="learn_box" id="my_honor" onclick="$.loadPage(0)">
			<div class="function_font">我的徽章</div>
		</div>
		<div class="learn_box" id="challenge_self" onclick="$.loadPage(5)">
			<div class="function_font">挑战自我</div>
		</div>
		<div class="learn_box" id="self_learn" onclick="$.loadPage(1)">
			<div class="function_font">快乐自学</div>
		</div>
		<div class="learn_box" id="self_info" onclick="$.loadPage(3)">
			<div class="function_font">个人信息</div>
		</div>
			<!--
			<a class="learn_box" id="practice_box"><img src="../picResources/my_practice.png"></a>
			<div id="head_pic_box">
				<a id="personal_info"><img src="../picResources/login_0038_head.png"></a>
			</div>
			<a class="learn_box" id="self_box"><img src="../picResources/self_taught.png"></a>
			-->
	</div>
	<!--
	<div id="mark_box">
		<div id="practice_mark"></div>
		<div id="self_mark"></div>
	</div>
	-->
	<div id="content_box">
		
	</div>
	<div id="footer_box">
		<div class="footer_line" ></div>
		<div id="group_info">
			<table>
				<tr>
					<td>教育资讯</td>
					<td>友情链接</td>
					<td>团队介绍</td>
					<td>联系我们</td>
					<td rowspan="2">
						<img alt="二维码" src="../picResources/twoD.png">
					</td>
				</tr>
				<tr>
					<td><a href="http://www.chinaedu.edu.cn/">中国教育网</a></td>
					<td><a href="http://xiaobao.shuren100.com/">小学生学习报</a><br>
						<a href="http://web.52xuexi.net/Default.aspx">我爱学习网</a>
					</td>
					<td><a href="#">关于我们</a><br>
						<a href="#">成员介绍</a>
					</td>
					<td><a href="#">联系电话</a><br>
						<a href="#">电子邮件</a>
					</td>
				</tr>
			</table>
		</div>

	</div>
</div>
</body>
</html>