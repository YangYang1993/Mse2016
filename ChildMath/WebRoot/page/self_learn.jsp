<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import = "com.chinaMath.hibernate.beans.User" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style type="text/css">
	#learn_body{
		width: 800px;
		height: auto;
		padding-top: 20px;
	}
	.learn_level{
		color: black;
		font-family: 黑体;
		font-size: 1.2em;
		float: left;
		border: none;
		outline: none;
		margin-left: 55px;
		cursor: pointer;
		margin-top: 10px;
	}
	.learn_level a{
		text-decoration:none;
		color: black;
	}
	/*视频*/
	#learn_video_box{
		clear: both;
		overflow: auto;
		width: 800px;
		padding-top: 20px;
	}
	.learn_video{
		width: 200px;
		height: 220px;
		float: left;
		margin-left: 33px;
		margin-right: 33px;
		margin-bottom: 20px;
	}

</style>

<div id="learn_body">
<% 
User user = null;
if(!session.isNew()){
	user = (User)session.getAttribute("user");
}
int grade = user.getGrade();
%>
<div id="learn_video_box">
	
		<div class="learn_video" >
			<img src="../picResources/jia.jpg" width="190px" height="150px">
			<div class="learn_level">
				<a href="video.jsp">加法运算</a>
			</div>
		</div>
		
		<div class="learn_video">
			<img src="../picResources/jian.jpg" width="190px" height="150px">
			<div class="learn_level">
				<a href="video.jsp">减法运算</a>
			</div>
		</div>
			
		<div class="learn_video">
			<img src="../picResources/cheng.jpg" width="190px" height="150px">
			<div class="learn_level">
				<a href="video.jsp">乘法运算</a>
			</div>
		</div>
			
		<div class="learn_video">
			<img src="../picResources/chu.jpg" width="190px" height="150px">
			<div class="learn_level">
				<a href="video.jsp">除法运算</a>
			</div>
		</div>
			
		<div class="learn_video">
			<img src="../picResources/fenshu.jpg" width="190px" height="150px">
			<div class="learn_level">
				<a href="video.jsp">分数运算</a>
			</div>
		</div>
			
		<div class="learn_video">
			<img src="../picResources/hunhe.jpg" width="190px" height="150px">
			<div class="learn_level">
				<a href="video.jsp">混合运算</a>
			</div>
		</div>		
	
</div>