
$.setQstTypeCss = function(qst){
	$(".qst_qst_type").css({"border-color":"#c0c0c0","background-color":"transparent","color":"#708069"});
	$(qst).css({"border-color":"#DB5A5A","background-color":"#DB5A5A","color":"white"});
};
$.removeQstTypeCss = function(qst){
	$(qst).css({"border-color":"#c0c0c0","background-color":"transparent","color":"#708069"});
};
$(document).ready(function(){

	$.setTop();
	
	//计时用的
	var totalSec = 0;
	var totalMin = 0;
	var nowSec = 0;
	var timer;
	var wrongQuestion = new Array();
	var wrongAnswer = new Array();
	var rightAnswer = new Array();
	var wrongInfo = new Array();
	var totalFaultNum = 0;

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
		//var wrongArray = new Array();
		for(var i=0;i<answer.length;i++){
			if($("#qst_ans" + i).val() != "" && $("#qst_ans" + i).val() == answer[i]){
				$("#qst_mark" + i).css("background-image", 
				"url(../picResources/right.png)");
			}else{
				$("#qst_mark" + i).css("background-image", 
				"url(../picResources/wrong.png)");
				var wrongArray = {qst:question[i]+""+$("#qst_ans" + i).val()+""+answer[i]};
				var wrongQ = {qst:question[i]};
				var wrongA = {wans:$("#qst_ans" + i).val()};
				var rightA = {rans:answer[i]};
				wrongQuestion.push(wrongQ);
				wrongAnswer.push(wrongA);
				rightAnswer.push(rightA);
				wrongInfo.push(wrongArray);
			}
		}

		/*
		var wrongArray = JSON.stringify(wrongInfo);
		//var w = JSON.stringify(wrongQuestion);
		//var r = JSON.stringify(wrongAnswer);
		//var a = JSON.stringify(rightAnswer);
		//输出错题内容
		//console.log("wrongQuestion",w);
		//console.log("wrongAnswer",r);
		//console.log("rightAnswer",a);
		//console.log("wrongArray",wrongArray);

		$.post("/ChildMath/page/addFaults.do?method=addFaults",
				{wrong: wrongArray,time: needTime, 
			userId: parseInt($("#qst_userId").html())});
		*/
	});
	
	//添加错题
	$.addFault = function(){
		totalFaultNum = wrongQuestion.length;
		var thisFaultNum = 0;
		
		while(thisFaultNum < totalFaultNum){
			var factor = wrongQuestion[thisFaultNum].qst;
			var result = wrongAnswer[thisFaultNum].wans;
			var answer = rightAnswer[thisFaultNum].rans;

			$("#qst_qst_body").append(
			"<div class='fault_qst'><div class='qst_qst_qst'>"+ factor + 
			"</div><div><input type='text' id='qst_ans" + thisFaultNum 
			+"' class='qst_ans' value="+result+"></input></div><div class='show_ans'><span id='right_ans"
			+ thisFaultNum + "'>正确答案: "+ answer + "</span></div></div>");
			/*<div><input type='button' value='查看答案' id='check_ans" 
			+ thisFaultNum + "' class='check_ans' ></input></div>
			<div><input type='button' value='删除错题' id='remove_qst"
			+ thisFaultNum + "' class='remove_qst'></input></div>*/	
			thisFaultNum ++;

		};
		
	};
	/*
	$(document).click(function (e) {
		var v_id = $(e.target).attr('id');
	};*/
	//点击再来一套按钮后
	$("#qst_again").click(function(){
		$("#qst_start_button").css("visibility","visible");
		$("#qst_wrong").css("visibility","hidden");
		$("#qst_again").css("visibility","hidden");

	});
	//点击查看错题按钮后
	$("#qst_wrong").click(function(){
		//$.loadPage(6);
		$("#qst_qst_body").empty();
		$("#qst_wrong").css("visibility","hidden");
		$("#qst_again").css("visibility","hidden");
		$("#qst_time").css("visibility","hidden");
		$("#add_fault").css("visibility","visible");
		$.addFault();
		
	});

	//点击保存错题按钮	
	$("#add_fault").click(function(){
		var wrongArray = JSON.stringify(wrongInfo);
		$.post("/ChildMath/page/addFaults.do?method=addFaults",
				{wrongInfo: wrongArray,
			userId: parseInt($("#qst_userId").html())});
		console.log("wrong",wrongInfo);
		alert("本次错题已保存至错题本～");
	});
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
			$.removeQstTypeCss("#qst_1_1");
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
			$.removeQstTypeCss("#qst_1_2");
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
			$.removeQstTypeCss("#qst_1_3");
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
			$.removeQstTypeCss("#qst_1_4");
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
			$.removeQstTypeCss("#qst_1_5");
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
			$.removeQstTypeCss("#qst_1_6");
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
			$.removeQstTypeCss("#qst_2_1");
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
			$.removeQstTypeCss("#qst_2_2");
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
			$.removeQstTypeCss("#qst_2_3");
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
			$.removeQstTypeCss("#qst_2_4");
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
			$.removeQstTypeCss("#qst_2_5");
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
			$.removeQstTypeCss("#qst_3_0");
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
			$.removeQstTypeCss("#qst_3_1");
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
			$.removeQstTypeCss("#qst_4_0");
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
			$.removeQstTypeCss("#qst_4_1");
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
			$.removeQstTypeCss("#qst_5_0");
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
			$.removeQstTypeCss("#qst_5_1");
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
			$.removeQstTypeCss("#qst_6_0");
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
			$.removeQstTypeCss("#qst_6_1");
		});
	});
});
