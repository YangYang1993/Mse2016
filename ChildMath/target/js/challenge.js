
var gradeArray = new Array();
gradeArray[0] = "一";
gradeArray[1] = "二";
gradeArray[2] = "三";
gradeArray[3] = "四";
gradeArray[4] = "五";
gradeArray[5] = "六";

//根据当前年级添加可挑战年级
$.addChooseGrade = function(grade){
	$("#chall_grade").empty();
	if(grade<6){
		for(var i=(grade+1);i<7;i++){
			$("#chall_grade").append("<input id='chall_grade_"+i+
					"' type='button' value='挑战"+gradeArray[i-1]+
					"年级' class='chall_grade_choose'></input>");
		}
	}else{
		$("#chall_grade").append("你太牛逼了，已经六年级了");
	}
	$.setTop();
};

//设置选择年级按钮被点后的css
$.setChallGradeCss = function(qst){
	$(".chall_grade_choose").css({"border-color":"#708069","background-color":"transparent","color":"#708069"});
	$(qst).css({"border-color":"#01aaef","background-color":"#01aaef","color":"white"});
};
//题型按钮被点击后css
$.setQstTypeCss = function(qst){
	$(".qst_qst_type").css({"border-color":"#708069","background-color":"transparent","color":"#708069"});
	$(qst).css({"border-color":"#01aaef","background-color":"#01aaef","color":"white"});
};
//提交答案后
$.showAnswer = function(){
	var wrongArray = new Array();
	for(var i=0;i<answer.length;i++){
		if($("#qst_ans" + i).val() != "" && $("#qst_ans" + i).val() == answer[i]){
			$("#qst_mark" + i).css("background-image", 
			"url(../picResources/p_0001_5.png)");
		}else{
			$("#qst_mark" + i).css("background-image", 
			"url(../picResources/p_0000_6.png)");
			wrongArray.push(question[i]+""+answer[i]);
		}
	}
};

//添加题目
$.addChallQst = function(qst){
	$("#chall_qst").empty();
	var id = $(qst).attr("id");
	id = parseInt(id.substring(id.length-1, id.length));
	//alert(id);
	switch(id){
	case 2:
		$("#chall_qst").append(
				"<input class='qst_qst_type' type='button' value='两位数加法' id='qst_2_0'></input>"+
				"<input class='qst_qst_type' type='button' value='两位数减法' id='qst_2_1'></input>"+
				"<input class='qst_qst_type' type='button' value='表内乘法' id='qst_2_2'></input>"+
				"<input class='qst_qst_type' type='button' value='表内除法' id='qst_2_3'></input>"+
				"<input class='qst_qst_type' type='button' value='加减乘除混合' id='qst_2_4'></input>"+
				"<input class='qst_qst_type' type='button' value='带括号' id='qst_2_5'></input>"
		);
	break;
	case 3:
		$("#chall_qst").append(
				"<input class='qst_qst_type' type='button' value='一位数乘除法' id='qst_3_0'></input>"+
				"<input class='qst_qst_type' type='button' value='两位数乘除法' id='qst_3_1'></input>"
		);
	break;
	case 4:
		$("#chall_qst").append(
				"<input class='qst_qst_type' type='button' value='接近整十整百加减' id='qst_4_0'></input>"+				
				"<input class='qst_qst_type' type='button' value='接近整十整百乘法' id='qst_4_1'></input>"
		);
	break;
	case 5:
		$("#chall_qst").append(
				"<input class='qst_qst_type' type='button' value='小数乘法' id='qst_5_0'></input>"+
				"<input class='qst_qst_type' type='button' value='小数除法' id='qst_5_1'></input>"
		);
	break;
	case 6:
		$("#chall_qst").append(
				"<input class='qst_qst_type' type='button' value='最大公约数' id='qst_6_0'></input>"+
				"<input class='qst_qst_type' type='button' value='最小公倍数' id='qst_6_1'></input>"
		);
	break;
	}
	$.setTop();
	$(".qst_qst_type").click(function(){
		$.setQstTypeCss(".qst_qst_type:focus");
	});
	//********grade 2***************
	$("#qst_2_0").click(function(){
		$("#qst_submit").css("visibility","visible");
			$("#qst_qst_body").empty();
			$.initFormula();
			$.intTwoAdd(20);
			$.setTop();
	});
	$("#qst_2_1").click(function(){
		$("#qst_submit").css("visibility","visible");
			$("#qst_qst_body").empty();
			$.initFormula();
			$.intTwoMinus(20);
			$.setTop();
	});
	$("#qst_2_2").click(function(){
		$("#qst_submit").css("visibility","visible");
			$("#qst_qst_body").empty();
			$.initFormula();
			$.intOneMulti(20);
			$.setTop();
	});
	$("#qst_2_3").click(function(){
		$("#qst_submit").css("visibility","visible");
			$("#qst_qst_body").empty();
			$.initFormula();
			$.intOneDivi(20);
			$.setTop();
	});
	$("#qst_2_4").click(function(){	
		$("#qst_submit").css("visibility","visible");
			$("#qst_qst_body").empty();
			$.initFormula();
			$.addMultiSecond(3);
			$.minusMultiSecond(3);
			$.addDiviSecond(3);
			$.minusDiviSecond(3);
			$.diviAddSecond(3);
			$.diviMinusSecond(3);
			$.multiAddSecond(3);
			$.multiMinusSecond(3);
			$.setTop();
	});
	$("#qst_2_5").click(function(){
		$("#qst_submit").css("visibility","visible");
			$("#qst_qst_body").empty();
			$.initFormula();
			$.bracketSecond(2, 0);
			$.bracketSecond(2, 1);
			$.bracketSecond(2, 2);
			$.bracketSecond(2, 3);
			$.bracketSecond(2, 4);
			$.bracketSecond(2, 5);
			$.bracketSecond(2, 6);
			$.bracketSecond(2, 7);
			$.bracketSecond(2, 8);
			$.bracketSecond(2, 9);
			$.setTop();
	});
	/****************三年级********************/	
	$("#qst_3_0").click(function(){
		$("#qst_submit").css("visibility","visible");
			$("#qst_qst_body").empty();
			$.initFormula();
			$.multiDiviThird(10, 0);
			$.multiDiviThird(10, 1);
			$.setTop();
	});
	$("#qst_3_1").click(function(){
		$("#qst_submit").css("visibility","visible");
			$("#qst_qst_body").empty();
			$.initFormula();
			$.twoMultiDiviThird(10, 0);
			$.twoMultiDiviThird(10, 1);
			$.setTop();
	});
	/*****************四年级****************/
	$("#qst_4_0").click(function(){
		$("#qst_submit").css("visibility","visible");
			$("#qst_qst_body").empty();
			$.initFormula();
			$.simpleAddFourth(8, 0);
			$.simpleAddFourth(6, 1);
			$.simpleAddFourth(6, 2);
			$.setTop();
	});
	$("#qst_4_1").click(function(){
		$("#qst_submit").css("visibility","visible");
			$("#qst_qst_body").empty();
			$.initFormula();
			$.simpleMultiFourth(20);
			$.setTop();
	});
	/****************五年级**************/
	$("#qst_5_0").click(function(){
		$("#qst_submit").css("visibility","visible");
			$("#qst_qst_body").empty();
			$.initFormula();
			$.multiFifth(20);
			$.setTop();
	});
	$("#qst_5_1").click(function(){
		$("#qst_submit").css("visibility","visible");
			$("#qst_qst_body").empty();
			$.initFormula();
			$.diviFifth(20);
			$.setTop();
	});
	/**************六年级**************/
	$("#qst_6_0").click(function(){
		$("#qst_submit").css("visibility","visible");
			$("#qst_qst_body").empty();
			$.initFormula();
			$.biggestSixth(20);
			$.setTop();
	});
	$("#qst_6_1").click(function(){
		$("#qst_submit").css("visibility","visible");
			$("#qst_qst_body").empty();
			$.initFormula();
			$.smallestSixth(20);
			$.setTop();
	});
};