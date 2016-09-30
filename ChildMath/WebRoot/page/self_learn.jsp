<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import = "com.chinaMath.hibernate.beans.User" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style type="text/css">
	#learn_body{
		width: 800px;
		height: auto;
		padding-top: 20px;
	}
	/*按钮*/
	#learn_button_box{
		height:30px;
		width: 800px;
	}
	.learn_level{
		width: 100px;
		height: 30px;
		border-radius: 15px;
		background-color: #01aaef;
		color: white;
		font-family: 黑体;
		font-size: 1.2em;
		float: left;
		border: none;
		outline: none;
		margin-left: 40px;
		cursor: pointer;
	}
	#learn_level1{
		margin-left: 0px;
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
		height: 190px;
		float: left;
		margin-left: 33px;
		margin-right: 33px;
		margin-bottom: 20px;
	}
	.learn_video a{
		outline: none;
		text-decoration: none;
	}
	.learn_video_pic{
		width: 200px;
		height: 150px;
		border: none;
		background-color: #ff0000;
	}
	.learn_video_name{
		width: 200px;
		height: 40px;
		background-color: transparent;
		color: #5d6160;
		font-family: 黑体;
		text-align: center;
		line-height: 40px;
	}
	/*隐藏的值*/
	#learn_grade{
		visibility: hidden;
	}
</style>
<script type="text/javascript">
	var picSrc = new Array();
	for(var i=0;i<6;i++){//每个年级的视频缩略图
		picSrc[i] = "../picResources/temp"+i+".png";
	}
	
	$.addVideo = function(grade){//加载相应年级的视频
		$("#learn_level"+grade).css("background-color","#3d9140");
		$("#learn_video_box").empty();
		for(var i=0;i<10;i++){
			$("#learn_video_box").append("<div class='learn_video'>"+
			"<a onclick='$.loadPage(-1)'><img class='learn_video_pic' src='"+ picSrc[grade-1] +"'>"+
			"</a><div class='learn_video_name'>工程数学</div></div>");
		}
	};
	
	$(document).ready(function(){	
		//获取当前年级
		var grade = parseInt($("#learn_grade").html());
		//设置相应年级的视频
		switch(grade){
		case 1:
			$.addVideo(1);
		break;
		case 2:
			$.addVideo(2);
		break;
		case 3:
			$.addVideo(3);
		break;
		case 4:
			$.addVideo(4);
		break;
		case 5:
			$.addVideo(5);
		break;
		case 6:
			$.addVideo(6);
		break;
		}
		//点击选择按钮时
		$(".learn_level").click(function(){
			$(".learn_level").css("background-color","#01aaef");
			var id = $(".learn_level:focus").attr("id");
			id = id.substring(id.length-1, id.length);
			id = parseInt(id);
			$.addVideo(id);
		});
		
		$.setTop();
	});
</script>
<div id="learn_body">
<% 
User user = null;
if(!session.isNew()){
	user = (User)session.getAttribute("user");
}
int grade = user.getGrade();
%>
	<div id="learn_button_box">
		<input id="learn_level1" class="learn_level" type="button" value="一年级"></input>
		<input id="learn_level2" class="learn_level" type="button" value="二年级"></input>
		<input id="learn_level3" class="learn_level" type="button" value="三年级"></input>
		<input id="learn_level4" class="learn_level" type="button" value="四年级"></input>
		<input id="learn_level5" class="learn_level" type="button" value="五年级"></input>
		<input id="learn_level6" class="learn_level" type="button" value="六年级"></input>
	</div>
	<div id="learn_video_box">
	</div>
	<div id="learn_grade"><%=grade %></div>
</div>