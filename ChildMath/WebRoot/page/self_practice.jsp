<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style type="text/css">
	#prac_body{
		clear: both;
		overflow: auto;
		width: 800px;
		padding-top: 20px;
	}
	/*三幅图片*/
	.prac_pic{
		width: 200px;
		height: 250px;
		float: left;
		background-size: 100% 100%;
	}
	#prac_pic_daily{
		background-image: url(../picResources/pp_0012_7.png);
	}
	#prac_pic_wrong{
		background-image: url(../picResources/pp_0013_8.png);
		margin-left: 100px;
	}
	#prac_pic_challenge{
		background-image: url(../picResources/pp_0014_5.png);
		margin-left: 100px;
	}
	/*三个按钮*/
	.prac_function{
		width: 110px;
		height: 30px;
		float: left;
		border: solid 1px #708069;
		outline: none;
		font-family: 黑体;
		font-size: 1.2em;
		color: #708069;
		background-color: transparent;
		border-radius: 15px;
		margin-top: 20px;
		cursor: pointer;
	}
	.prac_function:focus{
		border-color: #3d9140;
		background-color: #3d9140;
		color: white;
	}
	#prac_function_daily{
		margin-left: 45px;
	}
	#prac_function_wrong{
		margin-left: 190px;
	}
	#prac_function_challenge{
		margin-left: 190px;
	}
	/*三根条*/
	.prac_bar{
		width: 50px;
		height: 3px;
		background-image: url(../picResources/pp_0005_9.png);
		background-size: 100% 100%;
		float: left;
		margin-top: 50px;
	}
	.prac_bar.left{
		margin-left: 75px;
	}
	.prac_bar.middle, .prac_bar.right{
		margin-left: 250px;
	}
	/*三段文字介绍*/
	.prac_brief{
		height: 50px;
		width: 200px;
		border: none;
		float: left;
		margin-top: 10px;
	}
	.prac_brief.middle, .prac_brief.right{
		margin-left: 100px;
	}
</style>
<script type="text/javascript">
	$(document).ready(function(){				
		
		//三个按钮的点击事件
		$("#prac_function_daily").click(function(){
			$.loadPage(4);
			//alert("h");
		});
		$("#prac_function_wrong").click(function(){
			$.loadPage(6);
		});
		$("#prac_function_challenge").click(function(){
			$.loadPage(5);
		});
		
		$.setTop();
	});
</script>
<div id="prac_body">
	<div class="prac_pic" id="prac_pic_daily"></div>
	<div class="prac_pic" id="prac_pic_wrong"></div>
	<div class="prac_pic" id="prac_pic_challenge"></div>
	<input type="button" class="prac_function" id="prac_function_daily" value="每日练习"></input>
	<input type="button" class="prac_function" id="prac_function_wrong" value="错题本"></input>
	<input type="button" class="prac_function" id="prac_function_challenge" value="挑战自我"></input>
	<div class="prac_bar left"></div>
	<div class="prac_bar middle"></div>
	<div class="prac_bar right"></div>
	<img class="prac_brief left" alt="每日练习" src="../picResources/pp_0002.png">
	<img class="prac_brief middle" alt="错题本" src="../picResources/pp_0001.png">
	<img class="prac_brief right" alt="挑战自我" src="../picResources/pp_0000.png">
</div>