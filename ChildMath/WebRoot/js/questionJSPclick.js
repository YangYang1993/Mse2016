$.setQstTypeCss = function(qst){
	$(".qst_qst_type").css({"border-color":"#708069","background-color":"transparent","color":"#708069"});
	$(qst).css({"border-color":"#01aaef","background-color":"#01aaef","color":"white"});
};
$removeQstTypeCss = function(qst){
	$(qst).css({"border-color":"#708069","background-color":"transparent","color":"#708069"});
	$(".qst_qst_type").css({"border-color":"#01aaef","background-color":"#01aaef","color":"white"});
}
$(document).ready(function(){

	$.setTop();
	
	//计时用的
	var totalSec = 0;
	var totalMin = 0;
	var nowSec = 0;
	var timer;
	$.startTime = function(){
		timer = $.timer(1000, function() {
			totalSec++;
			totalMin = Math.floor(totalSec/60);
			nowSec = totalSec - totalMin*60;
			$("#qst_min").empty(); $("#qst_sec").empty();
			$("#qst_min").append(totalMin); $("#qst_sec").append(nowSec);
		});
		//$("#qst_start_button").css("visibility","hidden");
	};
	
	//点击提交按钮后
	$("#qst_submit").click(function(){
		var needTime = totalSec;
		timer.stop();
		totalSec = 0;
		totalMin = 0;
		nowSec = 0;
		
		$(".qst_qst_type").removeAttr("disabled");
		$(".qst_ans").attr("disabled","disabled");
		$("#qst_submit").css("visibility","hidden");
		$("#qst_wrong").css("visibility","visible");
		$("#qst_again").css("visibility","visible");
		var wrongArray = new Array();
		for(var i=0;i<answer.length;i++){
			if($("#qst_ans" + i).val() != "" && $("#qst_ans" + i).val() == answer[i]){
				$("#qst_mark" + i).css("background-image", 
				"url(../picResources/p_0001_5.png)");
			}else{
				$("#qst_mark" + i).css("background-image", 
				"url(../picResources/p_0000_6.png)");
				var wrongQuestion = {qst:question[i]+""+answer[i]};
				wrongArray.push(wrongQuestion);
			}
		}
		var wrongInfo = JSON.stringify(wrongArray);
		
		$.post("/ChildMath/page/addFaults.do?method=addFaults",
				{wrong: wrongInfo,time: needTime, 
			userId: parseInt($("#qst_userId").html())});
	});
	//点击再来一套按钮后
	$("#qst_again").click(function(){
		$("#qst_start_button").css("visibility","visible");
	});
	//点击查看错题按钮后	
/***************一年级******************/
	$("#qst_1_0").click(function(){
		//$("#qst_start_button").css("visibility","visible");
		$.setQstTypeCss("#qst_1_0");
		$('#qst_start_button').unbind("click"); //移除click
		$("#qst_start_button").click(function(){
			$("#qst_time").css("visibility","visible");
			$("#qst_qst_body").empty();
			$.initFormula();
			$.plus(20, 0, 21);
			$.setTop();
			$.startTime();
			$(".qst_qst_type").attr("disabled","disabled");
			$("#qst_submit").css("visibility","visible");
			$("#qst_again").css("visibility","hidden");
			$("#qst_wrong").css("visibility","hidden");
			$("#qst_start_button").css("visibility","hidden");
			$.removeQstTypeCss("#qst_1_0");
		});
	});
	$("#qst_1_1").click(function(){
		//$("#qst_start_button").css("visibility","visible");
		$.setQstTypeCss("#qst_1_1");
		$('#qst_start_button').unbind("click");
		$("#qst_start_button").click(function(){
			$("#qst_time").css("visibility","visible");
			$("#qst_qst_body").empty();
			$.initFormula();
			$.minus(20, 0, 21);
			$.setTop();
			$.startTime();
			$(".qst_qst_type").attr("disabled","disabled");
			$("#qst_submit").css("visibility","visible");
			$("#qst_again").css("visibility","hidden");
			$("#qst_wrong").css("visibility","hidden");
			$("#qst_start_button").css("visibility","hidden");
		});
	});
	$("#qst_1_2").click(function(){
		//$("#qst_start_button").css("visibility","visible");
		$.setQstTypeCss("#qst_1_2");
		$('#qst_start_button').unbind("click");
		$("#qst_start_button").click(function(){
			$("#qst_time").css("visibility","visible");
			$("#qst_qst_body").empty();
			$.initFormula();
			$.intAddAdd(20, 20);
			$.setTop();
			$.startTime();
			$(".qst_qst_type").attr("disabled","disabled");
			$("#qst_again").css("visibility","hidden");
			$("#qst_wrong").css("visibility","hidden");
			$("#qst_submit").css("visibility","visible");
		});
	});
	$("#qst_1_3").click(function(){
		//$("#qst_start_button").css("visibility","visible");
		$.setQstTypeCss("#qst_1_3");
		$('#qst_start_button').unbind("click");
		$("#qst_start_button").click(function(){
			$("#qst_time").css("visibility","visible");
			$("#qst_qst_body").empty();
			$.initFormula();
			$.intMinusMinus(20, 20);
			$.setTop();
			$.startTime();
			$(".qst_qst_type").attr("disabled","disabled");
			$("#qst_submit").css("visibility","visible");
			$("#qst_again").css("visibility","hidden");
			$("#qst_wrong").css("visibility","hidden");
			$("#qst_start_button").css("visibility","hidden");
		});
	});
	$("#qst_1_4").click(function(){
		//$("#qst_start_button").css("visibility","visible");
		$.setQstTypeCss("#qst_1_4");
		$('#qst_start_button').unbind("click");
		$("#qst_start_button").click(function(){
			$("#qst_time").css("visibility","visible");
			$("#qst_qst_body").empty();
			$.initFormula();
			$.intAddMinus(10, 20);
			$.intMinusAdd(10, 20);
			$.setTop();
			$.startTime();
			$(".qst_qst_type").attr("disabled","disabled");
			$("#qst_submit").css("visibility","visible");
			$("#qst_again").css("visibility","hidden");
			$("#qst_wrong").css("visibility","hidden");
			$("#qst_start_button").css("visibility","hidden");
		});
	});
	$("#qst_1_5").click(function(){
		//$("#qst_start_button").css("visibility","visible");
		$.setQstTypeCss("#qst_1_5");
		$('#qst_start_button').unbind("click");
		$("#qst_start_button").click(function(){
			$("#qst_time").css("visibility","visible");
			$("#qst_qst_body").empty();
			$.initFormula();
			$.intAddTen(10, 100);
			$.intMinusTen(10, 100);
			$.setTop();
			$.startTime();
			$(".qst_qst_type").attr("disabled","disabled");
			$("#qst_submit").css("visibility","visible");
			$("#qst_again").css("visibility","hidden");
			$("#qst_wrong").css("visibility","hidden");
			$("#qst_start_button").css("visibility","hidden");
		});
	});
	$("#qst_1_6").click(function(){
		//$("#qst_start_button").css("visibility","visible");
		$.setQstTypeCss("#qst_1_6");
		$('#qst_start_button').unbind("click");
		$("#qst_start_button").click(function(){
			$("#qst_time").css("visibility","visible");
			$("#qst_qst_body").empty();
			$.initFormula();
			$.intAddOne(10, 100);
			$.intMinusOne(10, 100);
			$.setTop();
			$.startTime();
			$(".qst_qst_type").attr("disabled","disabled");
			$("#qst_submit").css("visibility","visible");
			$("#qst_again").css("visibility","hidden");
			$("#qst_wrong").css("visibility","hidden");
			$("#qst_start_button").css("visibility","hidden");
		});
	});
//********grade 2***************
	$("#qst_2_0").click(function(){
		//$("#qst_start_button").css("visibility","visible");
		$.setQstTypeCss("#qst_2_0");
		$('#qst_start_button').unbind("click");
		$("#qst_start_button").click(function(){
			$("#qst_time").css("visibility","visible");
			$("#qst_qst_body").empty();
			$.initFormula();
			$.intTwoAdd(20);
			$.setTop();
			$.startTime();
			$(".qst_qst_type").attr("disabled","disabled");
			$("#qst_submit").css("visibility","visible");
			$("#qst_again").css("visibility","hidden");
			$("#qst_wrong").css("visibility","hidden");
			$("#qst_start_button").css("visibility","hidden");
			$.removeQstTypeCss("#qst_2_0");
		});
	});
	$("#qst_2_1").click(function(){
		//$("#qst_start_button").css("visibility","visible");
		$.setQstTypeCss("#qst_2_1");
		$('#qst_start_button').unbind("click");
		$("#qst_start_button").click(function(){
			$("#qst_time").css("visibility","visible");
			$("#qst_qst_body").empty();
			$.initFormula();
			$.intTwoMinus(20);
			$.setTop();
			$.startTime();
			$(".qst_qst_type").attr("disabled","disabled");
			$("#qst_submit").css("visibility","visible");
			$("#qst_again").css("visibility","hidden");
			$("#qst_wrong").css("visibility","hidden");
			$("#qst_start_button").css("visibility","hidden");
		});
	});
	$("#qst_2_2").click(function(){
		//$("#qst_start_button").css("visibility","visible");
		$.setQstTypeCss("#qst_2_2");
		$('#qst_start_button').unbind("click");
		$("#qst_start_button").click(function(){
			$("#qst_time").css("visibility","visible");
			$("#qst_qst_body").empty();
			$.initFormula();
			$.intOneMulti(20);
			$.setTop();
			$.startTime();
			$(".qst_qst_type").attr("disabled","disabled");
			$("#qst_submit").css("visibility","visible");
			$("#qst_again").css("visibility","hidden");
			$("#qst_wrong").css("visibility","hidden");
			$("#qst_start_button").css("visibility","hidden");
		});
	});
	$("#qst_2_3").click(function(){
		//$("#qst_start_button").css("visibility","visible");
		$.setQstTypeCss("#qst_2_3");
		$('#qst_start_button').unbind("click");
		$("#qst_start_button").click(function(){
			$("#qst_time").css("visibility","visible");
			$("#qst_qst_body").empty();
			$.initFormula();
			$.intOneDivi(20);
			$.setTop();
			$.startTime();
			$(".qst_qst_type").attr("disabled","disabled");
			$("#qst_submit").css("visibility","visible");
			$("#qst_again").css("visibility","hidden");
			$("#qst_wrong").css("visibility","hidden");
			$("#qst_start_button").css("visibility","hidden");
		});
	});
	$("#qst_2_4").click(function(){
		//$("#qst_start_button").css("visibility","visible");
		$.setQstTypeCss("#qst_2_4");
		$('#qst_start_button').unbind("click");
		$("#qst_start_button").click(function(){
			$("#qst_time").css("visibility","visible");
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
			$.startTime();
			$(".qst_qst_type").attr("disabled","disabled");
			$("#qst_submit").css("visibility","visible");
			$("#qst_again").css("visibility","hidden");
			$("#qst_wrong").css("visibility","hidden");
			$("#qst_start_button").css("visibility","hidden");
		});
	});
	$("#qst_2_5").click(function(){
		//$("#qst_start_button").css("visibility","visible");
		$.setQstTypeCss("#qst_2_5");
		$('#qst_start_button').unbind("click");
		$("#qst_start_button").click(function(){
			$("#qst_time").css("visibility","visible");
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
			$.startTime();
			$(".qst_qst_type").attr("disabled","disabled");
			$("#qst_submit").css("visibility","visible");
			$("#qst_again").css("visibility","hidden");
			$("#qst_wrong").css("visibility","hidden");
			$("#qst_start_button").css("visibility","hidden");
		});
	});
/****************三年级********************/	
	$("#qst_3_0").click(function(){
		//$("#qst_start_button").css("visibility","visible");
		$.setQstTypeCss("#qst_3_0");
		$('#qst_start_button').unbind("click");
		$("#qst_start_button").click(function(){
			$("#qst_time").css("visibility","visible");
			$("#qst_qst_body").empty();
			$.initFormula();
			$.multiDiviThird(10, 0);
			$.multiDiviThird(10, 1);
			$.setTop();
			$.startTime();
			$(".qst_qst_type").attr("disabled","disabled");
			$("#qst_submit").css("visibility","visible");
			$("#qst_again").css("visibility","hidden");
			$("#qst_wrong").css("visibility","hidden");
			$("#qst_start_button").css("visibility","hidden");
		});
	});
	$("#qst_3_1").click(function(){
		//$("#qst_start_button").css("visibility","visible");
		$.setQstTypeCss("#qst_3_1");
		$('#qst_start_button').unbind("click");
		$("#qst_start_button").click(function(){
			$("#qst_time").css("visibility","visible");
			$("#qst_qst_body").empty();
			$.initFormula();
			$.twoMultiDiviThird(10, 0);
			$.twoMultiDiviThird(10, 1);
			$.setTop();
			$.startTime();
			$(".qst_qst_type").attr("disabled","disabled");
			$("#qst_submit").css("visibility","visible");
			$("#qst_again").css("visibility","hidden");
			$("#qst_wrong").css("visibility","hidden");
			$("#qst_start_button").css("visibility","hidden");
		});
	});
	/*****************四年级****************/
	$("#qst_4_0").click(function(){
		//$("#qst_start_button").css("visibility","visible");
		$.setQstTypeCss("#qst_4_0");
		$('#qst_start_button').unbind("click");
		$("#qst_start_button").click(function(){
			$("#qst_time").css("visibility","visible");
			$("#qst_qst_body").empty();
			$.initFormula();
			$.simpleAddFourth(8, 0);
			$.simpleAddFourth(6, 1);
			$.simpleAddFourth(6, 2);
			$.setTop();
			$.startTime();
			$(".qst_qst_type").attr("disabled","disabled");
			$("#qst_submit").css("visibility","visible");
			$("#qst_again").css("visibility","hidden");
			$("#qst_wrong").css("visibility","hidden");
			$("#qst_start_button").css("visibility","hidden");
		});
	});
	$("#qst_4_1").click(function(){
		//$("#qst_start_button").css("visibility","visible");
		$.setQstTypeCss("#qst_4_1");
		$('#qst_start_button').unbind("click");
		$("#qst_start_button").click(function(){
			$("#qst_time").css("visibility","visible");
			$("#qst_qst_body").empty();
			$.initFormula();
			$.simpleMultiFourth(20);
			$.setTop();
			$.startTime();
			$(".qst_qst_type").attr("disabled","disabled");
			$("#qst_submit").css("visibility","visible");
			$("#qst_again").css("visibility","hidden");
			$("#qst_wrong").css("visibility","hidden");
			$("#qst_start_button").css("visibility","hidden");
		});
	});
	/****************五年级**************/
	$("#qst_5_0").click(function(){
		//$("#qst_start_button").css("visibility","visible");
		$.setQstTypeCss("#qst_5_0");
		$('#qst_start_button').unbind("click");
		$("#qst_start_button").click(function(){
			$("#qst_time").css("visibility","visible");
			$("#qst_qst_body").empty();
			$.initFormula();
			$.multiFifth(20);
			$.setTop();
			$.startTime();
			$(".qst_qst_type").attr("disabled","disabled");
			$("#qst_submit").css("visibility","visible");
			$("#qst_again").css("visibility","hidden");
			$("#qst_wrong").css("visibility","hidden");
			$("#qst_start_button").css("visibility","hidden");
		});
	});
	$("#qst_5_1").click(function(){
		//$("#qst_start_button").css("visibility","visible");
		$.setQstTypeCss("#qst_5_1");
		$('#qst_start_button').unbind("click");
		$("#qst_start_button").click(function(){
			$("#qst_time").css("visibility","visible");
			$("#qst_qst_body").empty();
			$.initFormula();
			$.diviFifth(20);
			$.setTop();
			$.startTime();
			$(".qst_qst_type").attr("disabled","disabled");
			$("#qst_submit").css("visibility","visible");
			$("#qst_again").css("visibility","hidden");
			$("#qst_wrong").css("visibility","hidden");
			$("#qst_start_button").css("visibility","hidden");
		});
	});
	/**************六年级**************/
	$("#qst_6_0").click(function(){
		//$("#qst_start_button").css("visibility","visible");
		$.setQstTypeCss("#qst_6_0");
		$('#qst_start_button').unbind("click");
		$("#qst_start_button").click(function(){
			$("#qst_time").css("visibility","visible");
			$("#qst_qst_body").empty();
			$.initFormula();
			$.biggestSixth(20);
			$.setTop();
			$.startTime();
			$(".qst_qst_type").attr("disabled","disabled");
			$("#qst_submit").css("visibility","visible");
			$("#qst_again").css("visibility","hidden");
			$("#qst_wrong").css("visibility","hidden");
			$("#qst_start_button").css("visibility","hidden");
		});
	});
	$("#qst_6_1").click(function(){
		//$("#qst_start_button").css("visibility","visible");
		$.setQstTypeCss("#qst_6_1");
		$('#qst_start_button').unbind("click");
		$("#qst_start_button").click(function(){
			$("#qst_time").css("visibility","visible");
			$("#qst_qst_body").empty();
			$.initFormula();
			$.smallestSixth(20);
			$.setTop();
			$.startTime();
			$(".qst_qst_type").attr("disabled","disabled");
			$("#qst_submit").css("visibility","visible");
			$("#qst_again").css("visibility","hidden");
			$("#qst_wrong").css("visibility","hidden");
			$("#qst_start_button").css("visibility","hidden");
		});
	});
});
