
var gradeArray = new Array();
gradeArray[0] = "һ";
gradeArray[1] = "��";
gradeArray[2] = "��";
gradeArray[3] = "��";
gradeArray[4] = "��";
gradeArray[5] = "��";

//���ݵ�ǰ�꼶��ӿ���ս�꼶
$.addChooseGrade = function(grade){
	$("#chall_grade").empty();
	if(grade<6){
		for(var i=(grade+1);i<7;i++){
			$("#chall_grade").append("<input id='chall_grade_"+i+
					"' type='button' value='��ս"+gradeArray[i-1]+
					"�꼶' class='chall_grade_choose'></input>");
		}
	}else{
		$("#chall_grade").append("��̫ţ���ˣ��Ѿ����꼶��");
	}
	$.setTop();
};

//����ѡ���꼶��ť������css
$.setChallGradeCss = function(qst){
	$(".chall_grade_choose").css({"border-color":"#708069","background-color":"transparent","color":"#708069"});
	$(qst).css({"border-color":"#01aaef","background-color":"#01aaef","color":"white"});
};
//���Ͱ�ť�������css
$.setQstTypeCss = function(qst){
	$(".qst_qst_type").css({"border-color":"#708069","background-color":"transparent","color":"#708069"});
	$(qst).css({"border-color":"#01aaef","background-color":"#01aaef","color":"white"});
};
//�ύ�𰸺�
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

//�����Ŀ
$.addChallQst = function(qst){
	$("#chall_qst").empty();
	var id = $(qst).attr("id");
	id = parseInt(id.substring(id.length-1, id.length));
	//alert(id);
	switch(id){
	case 2:
		$("#chall_qst").append(
				"<input class='qst_qst_type' type='button' value='��λ���ӷ�' id='qst_2_0'></input>"+
				"<input class='qst_qst_type' type='button' value='��λ������' id='qst_2_1'></input>"+
				"<input class='qst_qst_type' type='button' value='���ڳ˷�' id='qst_2_2'></input>"+
				"<input class='qst_qst_type' type='button' value='���ڳ���' id='qst_2_3'></input>"+
				"<input class='qst_qst_type' type='button' value='�Ӽ��˳����' id='qst_2_4'></input>"+
				"<input class='qst_qst_type' type='button' value='������' id='qst_2_5'></input>"
		);
	break;
	case 3:
		$("#chall_qst").append(
				"<input class='qst_qst_type' type='button' value='һλ���˳���' id='qst_3_0'></input>"+
				"<input class='qst_qst_type' type='button' value='��λ���˳���' id='qst_3_1'></input>"
		);
	break;
	case 4:
		$("#chall_qst").append(
				"<input class='qst_qst_type' type='button' value='�ӽ���ʮ���ټӼ�' id='qst_4_0'></input>"+				
				"<input class='qst_qst_type' type='button' value='�ӽ���ʮ���ٳ˷�' id='qst_4_1'></input>"
		);
	break;
	case 5:
		$("#chall_qst").append(
				"<input class='qst_qst_type' type='button' value='С���˷�' id='qst_5_0'></input>"+
				"<input class='qst_qst_type' type='button' value='С������' id='qst_5_1'></input>"
		);
	break;
	case 6:
		$("#chall_qst").append(
				"<input class='qst_qst_type' type='button' value='���Լ��' id='qst_6_0'></input>"+
				"<input class='qst_qst_type' type='button' value='��С������' id='qst_6_1'></input>"
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
	/****************���꼶********************/	
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
	/*****************���꼶****************/
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
	/****************���꼶**************/
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
	/**************���꼶**************/
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