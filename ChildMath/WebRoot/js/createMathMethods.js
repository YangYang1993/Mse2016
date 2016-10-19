
var question = new Array();
var answer = new Array();
var totalFormulaNum = 0;

$.addFormula = function(formula, result){
	question[question.length] = formula;
	answer[answer.length] = result;
	$("#qst_qst_body").append(
		"<div class='qst_qst'><div class='qst_qst_qst'>"+ formula + 
		"</div><div><input type='text' id='qst_ans" + totalFormulaNum 
		+"' class='qst_ans'></input></div><div class='qst_mark' id='qst_mark"+
		totalFormulaNum + "'></div></div>");
};

//Çó×î´ó¹«Ô¼ÊýµÄËã·¨£¬num1>=num2
$.biggest = function(num1, num2){
	var p = num2;
	while(num1-Math.floor(num1/num2)*num2 != 0){
		p = num1-Math.floor(num1/num2)*num2;
		num1 = num2;
		num2 = p;
	}
	return p;
};

//Çó×îÐ¡¹«±¶Êý
$.smallest = function(num1, num2){
	var q;
	if(num1>=num2){
		q = $.biggest(num1,num2);
	}else{
		q = $.biggest(num2,num1);
	}
	return num1*num2/q;
};

$.initFormula = function(){
	question = [];
	answer = [];
	totalFormulaNum = 0;
};

//Á½ÊýÏà¼Ó
$.plus = function(formulaNum, min, max){
	var thisFormulaNum = 0;
	while(thisFormulaNum < formulaNum){
		var result = Math.floor(Math.random()*(max - min)) + min;
		var factor2 = Math.floor(Math.random()*Math.floor(result/2)) + Math.floor(result/4);
		var factor1 = result - factor2;
		
		var formula = factor1 + " + " + factor2 + " = ";
		if($.inArray(formula, question) == -1){
			$.addFormula(formula, result);
			thisFormulaNum ++;
			totalFormulaNum ++;
		}
	}		
};

//Á½ÊýÏà¼õ
$.minus = function(formulaNum, min, max){
	var thisFormulaNum = 0;
	while(thisFormulaNum < formulaNum){		
		var factor1 = Math.floor(Math.random()*(max - min)) + min;
		var factor2 = Math.floor(Math.random()*Math.floor(factor1/2)) + Math.floor(factor1/4);
		var result = factor1 - factor2;
		var formula = factor1 + " - " + factor2 + " = ";
		if($.inArray(formula, question) == -1){
			$.addFormula(formula, result);
			thisFormulaNum ++;
			totalFormulaNum ++;
		}
	}		
};

//Á¬¼Ó
$.intAddAdd = function(formulaNum, range){
	var thisFormulaNum = 0;
	while(thisFormulaNum < formulaNum){
		var addOne = 0;
		var addTwo = 0;
		var addThree = 0;
		addOne = Math.floor(Math.random() * (range + 1));
		addTwo = Math.floor(Math.random() * (range + 1 - addOne));
		addThree = Math.floor(Math.random() * (range + 1 - addOne - addTwo));
		var result = addOne + addTwo + addThree;
		var formula = addOne + " + " + addTwo + " + " +addThree + " = ";
		if($.inArray(formula, question) == -1){
			$.addFormula(formula, result);
			thisFormulaNum ++;
			totalFormulaNum ++;
		}
	}
};

//Á¬¼õ
$.intMinusMinus = function(formulaNum, range){
	var thisFormulaNum = 0;
	while(thisFormulaNum < formulaNum){
		var minusOne = Math.floor(Math.random() * Math.floor(range / 4)) + Math.floor(range / 4 * 3);
		var minusTwo = Math.floor(Math.random() * Math.floor(minusOne / 2)) + Math.floor(minusOne / 4);
		var minusThree = Math.floor(Math.random() * (minusOne - minusTwo));
		var result = minusOne - minusTwo - minusThree;
		var formula = minusOne + " - " + minusTwo + " - " + minusThree + " =";
		if($.inArray(formula, question) == -1){
			$.addFormula(formula, result);
			thisFormulaNum ++;
			totalFormulaNum ++;
		}
	}
};

//¼Ó¼õ
$.intAddMinus = function(formulaNum, range){
	var thisFormulaNum = 0;
	while(thisFormulaNum < formulaNum){
		var addOne = Math.floor(Math.random() * (range + 1));
		var addTwo = Math.floor(Math.random() * (range + 1 - addOne));
		var minusThree = Math.floor(Math.random() * (addOne + addTwo + 1));
		var formula = addOne + " + " + addTwo + " - " + minusThree + " = ";
		var result = addOne + addTwo - minusThree;
		if($.inArray(formula, question) == -1){
			$.addFormula(formula, result);
			thisFormulaNum ++;
			totalFormulaNum ++;
		}
	}
};
//¼õ¼Ó
$.intMinusAdd = function(formulaNum, range){
	var thisFormulaNum = 0;
	while(thisFormulaNum < formulaNum){
		var minusOne = Math.floor(Math.random() * (range + 1));
		var minusTwo = Math.floor(Math.random() * (range + 1 - minusOne));
		var addThree = Math.floor(Math.random() * (range +1 - minusOne + minusTwo));
		var formula = minusOne + " - " + minusTwo + " + " + addThree + " = ";
		var result = minusOne - minusTwo + addThree;
		if($.inArray(formula, question) == -1){
			$.addFormula(formula, result);
			thisFormulaNum ++;
			totalFormulaNum ++;
		}
	}
};
//100ÒÔÄÚ¼ÓÕûÊ®
$.intAddTen = function(formulaNum, range){
	var thisFormulaNum = 0;
	while(thisFormulaNum < formulaNum){
		var result = Math.floor(Math.random() * (range -10 + 1)) + 10;
		var addTwo = Math.floor(Math.floor(Math.random() * (result + 1))/10) * 10;
		var addOne = result - addTwo;
		var formula = addOne + " + " + addTwo + " = ";
		if($.inArray(formula, question) == -1){
			$.addFormula(formula, result);
			thisFormulaNum ++;
			totalFormulaNum ++;
		}
	}
};
//100ÒÔÄÚ¼õÕýÊ½
$.intMinusTen = function(formulaNum, range){
	var thisFormulaNum = 0;
	while(thisFormulaNum < formulaNum){
		var minusOne = Math.floor(Math.random() * (range - 10 + 1)) + 10;
		var minusTwo = Math.floor(Math.floor(Math.random() * (minusOne + 1))/10) * 10;
		var result = minusOne - minusTwo;
		var formula = minusOne + " - " + minusTwo + " = ";
		if($.inArray(formula, question) == -1){
			$.addFormula(formula, result);
			thisFormulaNum ++;
			totalFormulaNum ++;
		}
	}
};
//Á½Î»Êý¼ÓÒ»Î»Êý
$.intAddOne = function(formulaNum, range){
	var thisFormulaNum = 0;
	while(thisFormulaNum < formulaNum){
		var result = Math.floor(Math.random() * (range -10 + 1)) + 10;
		var addTwo = Math.floor(Math.random() * 10);
		var addOne = result - addTwo;
		var formula = addOne + " + " + addTwo + " = ";
		if($.inArray(formula, question) == -1){
			$.addFormula(formula, result);
			thisFormulaNum ++;
			totalFormulaNum ++;
		}
	}
};
//Á½Î»Êý¼õÒ»Î»Êý
$.intMinusOne = function(formulaNum, range){
	var thisFormulaNum = 0;
	while(thisFormulaNum < formulaNum){
		var minusOne = Math.floor(Math.random() * (range -10 + 1)) + 10;
		var minusTwo = Math.floor(Math.random() * 10);
		var result = minusOne - minusTwo;
		var formula = minusOne + " - " + minusTwo + " = ";
		if($.inArray(formula, question) == -1){
			$.addFormula(formula, result);
			thisFormulaNum ++;
			totalFormulaNum ++;
		}
	}
};
/************Ð¡Ñ§¶þÄê¼¶************/
//ab+cd
$.intTwoAdd = function(formulaNum){
	var thisFormulaNum = 0;
	while(thisFormulaNum < formulaNum){
		var addOne = Math.floor(Math.random() * 91) + 10;
		var addTwo = Math.floor(Math.random() * 91) + 10;
		var result = addOne + addTwo;
		var formula = addOne + " + " + addTwo + " = ";
		if($.inArray(formula, question) == -1){
			$.addFormula(formula, result);
			thisFormulaNum ++;
			totalFormulaNum ++;
		}
	}
};
//ab-cd
$.intTwoMinus = function(formulaNum){
	var thisFormulaNum = 0;
	while(thisFormulaNum < formulaNum){
		var minusOne = Math.floor(Math.random() * 91) + 10;
		var minusTwo = Math.floor(Math.random() * (minusOne - 10 + 1)) + 10;
		var result = minusOne - minusTwo;
		var formula = minusOne + " - " + minusTwo + " = ";
		if($.inArray(formula, question) == -1){
			$.addFormula(formula, result);
			thisFormulaNum ++;
			totalFormulaNum ++;
		}
	}
};
//a*b 
$.intOneMulti = function(formulaNum){
	var thisFormulaNum = 0;
	while(thisFormulaNum < formulaNum){
		var multiOne = Math.floor(Math.random() * 9) + 1;
		var multiTwo = Math.floor(Math.random() * 9) + 1;
		var result = multiOne * multiTwo;
		var formula = multiOne + " &times; " + multiTwo + " = ";
		if($.inArray(formula, question) == -1){
			$.addFormula(formula, result);
			thisFormulaNum ++;
			totalFormulaNum ++;
		}
	}
};
//a(ab)/c
$.intOneDivi = function(formulaNum){
	var thisFormulaNum = 0;
	while(thisFormulaNum < formulaNum){
		var diviTwo = Math.floor(Math.random() * 9) + 1;
		var result = Math.floor(Math.random() * 9) + 1;
		var diviOne = diviTwo * result;
		var formula = diviOne + " &divide; " + diviTwo + " = ";
		if($.inArray(formula, question) == -1){
			$.addFormula(formula, result);
			thisFormulaNum ++;
			totalFormulaNum ++;
		}
	}
};
//a+b*c
$.addMultiSecond = function(formulaNum){
	var thisFormulaNum = 0;
	while(thisFormulaNum < formulaNum){
		var b = Math.floor(Math.random() * 9) + 1;
		var c = Math.floor(Math.random() * 9) + 1;
		var a = Math.floor(Math.random() * 91) + 10;
		var result = a+b*c;
		var formula = a + " + " + b + " &times; " + c + " = ";
		if($.inArray(formula, question) == -1){
			$.addFormula(formula, result);
			thisFormulaNum ++;
			totalFormulaNum ++;
		}
	}
};
//a-b*c 
$.minusMultiSecond = function(formulaNum){
	var thisFormulaNum = 0;
	while(thisFormulaNum < formulaNum){
		var b = Math.floor(Math.random() * 9) + 1;
		var c = Math.floor(Math.random() * 9) + 1;
		var a = Math.floor(Math.random() * (101-b*c)) + b*c;
		var result = a-b*c;
		var formula = a+" - "+b+" &times; "+c+" = ";
		if($.inArray(formula, question) == -1){
			$.addFormula(formula, result);
			thisFormulaNum ++;
			totalFormulaNum ++;
		}
	}
};
//a+b/c 
$.addDiviSecond = function(formulaNum){
	var thisFormulaNum = 0;
	while(thisFormulaNum < formulaNum){
		var a = Math.floor(Math.random()*90)+10;
		var temp = Math.floor(Math.random() * 9) + 1;
		var c = Math.floor(Math.random() * 9) + 1;
		var b = temp*c;
		var formula = a+" + "+b+" &divide; "+c+" = ";
		var result = a+b/c;
		if($.inArray(formula, question) == -1){
			$.addFormula(formula, result);
			thisFormulaNum ++;
			totalFormulaNum ++;
		}
	}
};
//a-b/c 
$.minusDiviSecond = function(formulaNum){
	var thisFormulaNum = 0;
	while(thisFormulaNum < formulaNum){
		var temp = Math.floor(Math.random() * 9) + 1;
		var c = Math.floor(Math.random() * 9) + 1;
		var b = temp*c;
		var a = Math.floor(Math.random()*(100-temp))+temp;
		var result = a-b/c;
		var formula = a+" - "+b+" &divide "+c+" = ";
		if($.inArray(formula, question) == -1){
			$.addFormula(formula, result);
			thisFormulaNum ++;
			totalFormulaNum ++;
		}
	}
};
//a/b+c 
$.diviAddSecond = function(formulaNum){
	var thisFormulaNum = 0;
	while(thisFormulaNum < formulaNum){
		var temp = Math.floor(Math.random() * 9) + 1;
		var b = Math.floor(Math.random() * 9) + 1;
		var a = temp*b;
		var c = Math.floor(Math.random()*90)+10;
		var result = a/b+c;
		var formula = a+" &divide; "+b+" + "+c+" = ";
		if($.inArray(formula, question) == -1){
			$.addFormula(formula, result);
			thisFormulaNum ++;
			totalFormulaNum ++;
		}
	}
};
//a/b-c 
$.diviMinusSecond = function(formulaNum){
	var thisFormulaNum = 0;
	while(thisFormulaNum < formulaNum){
		var temp = Math.floor(Math.random() * 9) + 1;
		var b = Math.floor(Math.random() * 9) + 1;
		var a = temp*b;
		var c = Math.floor(Math.random()*(temp+1));
		var result = a/b-c;
		var formula = a+" &divide; "+b+" - "+c+" = ";
		if($.inArray(formula, question) == -1){
			$.addFormula(formula, result);
			thisFormulaNum ++;
			totalFormulaNum ++;
		}
	}
};
//a*b-c
$.multiMinusSecond = function(formulaNum){
	var thisFormulaNum = 0;
	while(thisFormulaNum < formulaNum){
		var a = Math.floor(Math.random() * 9) + 1;
		var b = Math.floor(Math.random() * 9) + 1;
		var c = Math.floor(Math.random()*(a*b+1));
		var result = a*b-c;
		var formula = a+" &times; "+b+" - "+c+" = ";
		if($.inArray(formula, question) == -1){
			$.addFormula(formula, result);
			thisFormulaNum ++;
			totalFormulaNum ++;
		}
	}
};
//a*b+c
$.multiAddSecond = function(formulaNum){
	var thisFormulaNum = 0;
	while(thisFormulaNum < formulaNum){
		var a = Math.floor(Math.random() * 9) + 1;
		var b = Math.floor(Math.random() * 9) + 1;
		var c = Math.floor(Math.random()*91)+10;
		var result = a*b+c;
		var formula = a+" &times; "+b+" + "+c+" = ";
		if($.inArray(formula, question) == -1){
			$.addFormula(formula, result);
			thisFormulaNum ++;
			totalFormulaNum ++;
		}
	}
};
//a b c ´øÀ¨ºÅ
$.bracketSecond = function(formulaNum, type){
	var thisFormulaNum = 0;
	while(thisFormulaNum < formulaNum){
		switch(type){
		case 0://(a+b)*c
			var c = Math.floor(Math.random()*9)+1;
			var temp = Math.floor(Math.random()*9)+1;
			var b = Math.floor(Math.random()*(temp+1));
			var a = temp-b;
			var result = (a+b)*c;
			var formula = " ( "+a+" + "+b+" ) "+" &times; "+c+" = ";
		break;
		case 1://(a+b)/c
			var result = Math.floor(Math.random()*9)+1;
			var c = Math.floor(Math.random()*9)+1;
			var temp = result*c;
			var b = Math.floor(Math.random()*(temp+1));
			var a = temp-b;
			var formula = " ( "+a+" + "+b+" ) "+" &divide; "+c+" = ";
		break;
		case 2://a*(b+c)
			var a = Math.floor(Math.random()*9)+1;
			var temp = Math.floor(Math.random()*9)+1;
			var c = Math.floor(Math.random()*(temp+1));
			var b = temp-c;
			var result = a*(b+c);
			var formula = a+" &times; "+" ( "+b+" + "+c+" ) = ";
		break;
		case 3://a*(b-c);
			var a = Math.floor(Math.random()*9)+1;
			var temp = Math.floor(Math.random()*9)+1;
			var c = Math.floor(Math.random()*91)+10;
			var b = temp+c;
			var result = a*(b-c);
			var formula = a+" &times; "+" ( "+b+" - "+c+" ) = ";
		break;
		case 4://a-(b+c)
			var a = Math.floor(Math.random()*91)+10;
			var temp = Math.floor(Math.random()*a);
			var c = Math.floor(Math.random()*temp);
			var b = temp-c;
			var result = a-(b+c);
			var formula = a+" - "+" ( "+b+" + "+c+" ) = ";
		break;
		case 5://a-(b-c)
			var a = Math.floor(Math.random()*91)+10;
			var b = Math.floor(Math.random()*91)+10;
			var c = Math.floor(Math.random()*(b+1-10))+10;
			var result = Math.floor(Math.random()*91)+10;
			var a = b-c+result;
			var formula = a+" - "+" ( "+b+" - "+c+" ) = ";
		break;
		case 6://(a-b)*c
			var c = Math.floor(Math.random()*9)+1;
			var temp = Math.floor(Math.random()*9)+1;
			var a = Math.floor(Math.random()*91)+10;
			var b = a-temp;
			var result = (a-b)*c;
			var formula = " ( "+a+" - "+b+" ) "+" &times; "+c+" = ";
		break;
		case 7://(a-b)/c
			var c = Math.floor(Math.random()*9)+1;
			var result = Math.floor(Math.random()*9)+1;
			var temp = c*result;
			var a = Math.floor(Math.random()*(101-temp))+temp;
			var b = a-temp;
			var formula = " ( "+a+" - "+b+" ) "+" &divide; "+c+" = ";
		break;
		case 8://a/(b-c)
			var result = Math.floor(Math.random()*9)+1;
			var temp = Math.floor(Math.random()*9)+1;
			var a = result*temp;
			var b = Math.floor(Math.random()*(101-temp))+temp;
			var c = b-temp;
			var formula = a+" &divide; ( "+b+" - "+c+" ) = ";
		break;
		case 9://a/(b/c)
			var result = Math.floor(Math.random()*9)+1;
			var temp = Math.floor(Math.random()*9)+1;
			var a = result*temp;
			var c = Math.floor(Math.random()*9)+1;
			var b = c*temp;
			var formula = a+" &divide; ( "+b+" &divide; "+c+" ) = ";
		break;
		}
		if($.inArray(formula, question) == -1){
			$.addFormula(formula, result);
			thisFormulaNum ++;
			totalFormulaNum ++;
		}
	}
};
/************Ð¡Ñ§ÈýÄê¼¶************/
//Ò»Î»Êý³Ë³ý
$.multiDiviThird = function(formulaNum, type){
	var thisFormulaNum = 0;
	while(thisFormulaNum < formulaNum){
		switch(type){
		case 0://aaa*b
			var b = Math.floor(Math.random()*9)+1;
			var a = Math.floor(Math.random()*899)+100;
			var result = a*b;
			var formula = a+" &times; "+b+" = ";
		break;
		case 1://aaa/b
			var b = Math.floor(Math.random()*9)+1;
			var a = Math.floor(Math.random()*899)+100;
			var result = Math.floor(a/b);
			a = result*b;
			var formula = a+" &divide; "+b+" = ";
		break;
		}
		if($.inArray(formula, question) == -1){
			$.addFormula(formula, result);
			thisFormulaNum ++;
			totalFormulaNum ++;
		}
	}
};
//Á½Î»Êý³Ë³ý
$.twoMultiDiviThird = function(formulaNum, type){
	var thisFormulaNum = 0;
	while(thisFormulaNum < formulaNum){
		switch(type){
		case 0://aaa*b
			var b = Math.floor(Math.random()*90)+10;
			var a = Math.floor(Math.random()*899)+100;
			var result = a*b;
			var formula = a+" &times; "+b+" = ";
		break;
		case 1://aaa/b
			var b = Math.floor(Math.random()*90)+10;
			var a = Math.floor(Math.random()*899)+100;
			var result = Math.floor(a/b);
			a = result*b;
			var formula = a+" &divide; "+b+" = ";
		break;
		}
		if($.inArray(formula, question) == -1){
			$.addFormula(formula, result);
			thisFormulaNum ++;
			totalFormulaNum ++;
		}
	}
};
/************ËÄÄê¼¶***********/
//a+-b¼ò±ãÔËËã 
$.simpleAddFourth = function(formulaNum,type){
	var thisFormulaNum = 0;
	while(thisFormulaNum < formulaNum){
		switch (type){
		case 0://a+b
			var key = Math.random();
			var a = 0;
			if(key >= 0.5){
				a = (Math.floor(Math.random()*9)+1)*10;
			}else{
				a = (Math.floor(Math.random()*9)+1)*100;
			}
			var temp = Math.floor(Math.random()*9)+1;
			a = a+temp;
			var b = Math.floor(Math.random()*990)+10;
			var result = a+b;
			var formula = a+" + "+b+" = ";
			break;
		case 1://a-b
			var key = Math.random();
			var a = 0;
			if(key >= 0.5){
				a = (Math.floor(Math.random()*9)+1)*10;
			}else{
				a = (Math.floor(Math.random()*9)+1)*100;
			}
			var temp = Math.floor(Math.random()*9)+1;
			a = a+temp;
			var result = Math.floor(Math.random()*(a+1-10))+10;
			var b = a-result;
			var formula = a+" - "+b+" = ";
			break;
		case 2://a-b
			var key = Math.random();
			var b = 0;
			if(key >= 0.5){
				b = (Math.floor(Math.random()*9)+1)*10;
			}else{
				b = (Math.floor(Math.random()*9)+1)*100;
			}
			var temp = Math.floor(Math.random()*9)+1;
			b = b+temp;
			var result = Math.floor(Math.random()*990)+10;
			var a = result+b;
			var formula = a+" - "+b+" = ";
			break;
		}
		if($.inArray(formula, question) == -1){
			$.addFormula(formula, result);
			thisFormulaNum ++;
			totalFormulaNum ++;
		}
	}
};
//a*b 
$.simpleMultiFourth = function(formulaNum){
	var thisFormulaNum = 0;
	while(thisFormulaNum < formulaNum){
		var a = 0;
		var key = Math.random();
		if(key>=0.5){
			a = (Math.floor(Math.random()*9)+1)*10;
		}else{
			a = (Math.floor(Math.random()*9)+1)*100;
		}
		var temp = Math.floor(Math.random()*9)+1;
		a = a+temp;
		var b = Math.floor(Math.random()*490)+10;
		var result = a*b;
		var formula = a+" &times; "+b+" = ";
		if($.inArray(formula, question) == -1){
			$.addFormula(formula, result);
			thisFormulaNum ++;
			totalFormulaNum ++;
		}
	}
};
/*******************ÎåÄê¼¶******************/
//a.b*c.d 
$.multiFifth = function(formulaNum){
	var thisFormulaNum = 0;
	while(thisFormulaNum < formulaNum){
		var a = Math.floor(Math.random()*990)+10;
		var b = Math.floor(Math.random()*990)+10;
		var result = a*b;
		var key = Math.random();
		if(key>=0.5){
			a=a/10;
			result = result/10;
		}else{
			a=a/100;
			result = result/100;
		}
		key = Math.random();
		if(key>=0.5){
			b=b/10;
			result = result/10;
		}else{
			b=b/100;
			result = result/100;
		}
		result = result.toFixed(4)-0.0000;
		var formula = a+" &times; "+b+" = ";
		if($.inArray(formula, question) == -1){
			$.addFormula(formula, result);
			thisFormulaNum ++;
			totalFormulaNum ++;
		}
	}
};
//a.b/c.d 
$.diviFifth = function(formulaNum){
	var thisFormulaNum = 0;
	while(thisFormulaNum < formulaNum){
		var a = Math.floor(Math.random()*990)+10;
		var b = Math.floor(Math.random()*990)+10;
		var result = a*b;
		var key = Math.random();
		if(key>=0.5){
			a=a/10;
			result = result/10;
		}else{
			a=a/100;
			result = result/100;
		}
		key = Math.random();
		if(key>=0.5){
			b=b/10;
			result = result/10;
		}else{
			b=b/100;
			result = result/100;
		}
		result = result.toFixed(4)-0.0000;
		var formula = result+" &divide; "+a+" = ";
		result = b;
		if($.inArray(formula, question) == -1){
			$.addFormula(formula, result);
			thisFormulaNum ++;
			totalFormulaNum ++;
		}
	}
};
/**********ÁùÄê¼¶************/
//×î´ó¹«Ô¼Êý
$.biggestSixth = function(formulaNum){
	var thisFormulaNum = 0;
	while(thisFormulaNum < formulaNum){
		var temp = Math.floor(Math.random()*90)+10;
		var a = temp*(Math.floor(Math.random()*100)+1);
		var b = temp*(Math.floor(Math.random()*100)+1);
		var result;
		if(a>=b){
			result = $.biggest(a,b);
		}else{
			result = $.biggest(b,a);
		}
		var formula = a+" , "+b+" ×î´ó¹«Ô¼Êý ";
		if($.inArray(formula, question) == -1){
			$.addFormula(formula, result);
			thisFormulaNum ++;
			totalFormulaNum ++;
		}
	}
};
//×îÐ¡¹«±¶Êý
$.smallestSixth = function(formulaNum){
	var thisFormulaNum = 0;
	while(thisFormulaNum < formulaNum){
		var a = (Math.floor(Math.random()*100)+1);
		var b = (Math.floor(Math.random()*100)+1);
		var result = $.smallest(a , b);
		var formula = a+" , "+b+" ×îÐ¡¹«±¶Êý ";
		if($.inArray(formula, question) == -1){
			$.addFormula(formula, result);
			thisFormulaNum ++;
			totalFormulaNum ++;
		}
	}
};
