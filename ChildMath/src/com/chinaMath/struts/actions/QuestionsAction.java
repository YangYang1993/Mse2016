package com.chinaMath.struts.actions;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Random;
import java.util.Set;

import com.chinaMath.hibernate.beans.Fraction;
import com.chinaMath.hibernate.beans.Questions;

public class QuestionsAction {
	
	public Random random = new Random();
	
	String[] sixQuestion = new String[]{"2100 - 21 × 53 + 2255 = " , "(103 - 336 ÷ 21) * 15 = " , "800 - (2000 - 9600 ÷ 8) = " ,
									  "40 * 48 - (1472 + 328) ÷ 5 = " , "(488 + 344) ÷ (202 - 194) = " , "2940 ÷ 28 + 136 * 7 = " , 
									  "605 * (500 - 494) - 1898 = " , "(2886 + 6618) ÷ (400 - 346) = " , "9125 - (182 + 35 * 22) = " , 
									  "(154 - 76) * (38 + 49) = " , "3800 - 136 * 9 - 798 = " , "(104 + 246) * (98 ÷ 7) = " ,
									  "918 ÷ 9 * (108 - 99) = " , "(8645 + 40 * 40) ÷ 5 = " ,  "(2944 + 864) ÷ (113 - 79) = " , 
									  "8080 - 1877 + 1881 ÷ 3 = " , "(5011 - 43 * 85) + 3397 = " , "2300 - 1122 ÷ (21 - 15) = " , 
									  "816 ÷ (4526 - 251 * 18) = " , "(7353 + 927) ÷ (801 - 792) = " , "(28 + 172) ÷ (24 + 16) = " , 
									  "6240 ÷ 48 + 63 * 48 = " , "950 - 28 * 6 + 666 = " , "86 * (35 + 117 ÷ 9) = " , 
									  "2500 + (360 - 160 ÷ 4) = " , "16 * 4 +6 * 3 = " , "39 ÷ 3 + 48 ÷ 6 = " , 
									  "24 * 4 - 42 ÷ 3 = " , "7 * 6 - 12 * 3 = " , "56 ÷ 4 + 72 ÷ 8 = " , 
									  "2940 ÷ 28 * 21 = " , "920 - 1680 ÷ 40 ÷ 7 = " , "690 + 47 * 52 - 398 = " ,
									  "148 + 3328 ÷ 64 - 75 = " , "360 * 24 ÷ 32 + 730 = " , "2100 - 94 + 48 * 54 = " ,
									  "51 + （2304 - 2042） * 23 = " , "4215 + （4361 - 716） ÷ 81 = " , "（247 + 18） * 27 + 25 = " ,
									  "36 - 720 ÷ （360 ÷ 18） = " }; 
	int[] sixResult = new int[]{3242, 1350, 0, 1560, 104, 1057, 1732, 176, 8173, 6786, 1778, 4900, 
									  918, 2049, 112, 6829, 4753, 2113, 102, 920, 5, 9264, 1448, 4128,
									  2820, 82, 21, 82, 6, 23, 2205, 914, 2736, 125, 1000, 4598,
									  6077, 4260, 7180, 20};
	//produce one add questions' function
	public Questions IntAdd(int range) {
		int addOne = 0;
		int addTwo = 0;
		int result = 0;
		String question = new String();
		Questions questions = new Questions();
		addOne = random.nextInt(range+1);
		addTwo = random.nextInt(range+1-addOne);
		result = addOne + addTwo;
		question = addOne + " + " + addTwo + " =";
		questions.questionsList.add(question);
		questions.answers[0] = result;
		return questions;
	}
	
	//produce one minus(-) questions' function
	public Questions IntMinus(int range) {
		int minusOne = 0;
		int minusTwo = 0;
		int result = 0;
		String question = new String();
		Questions questions = new Questions();
		minusOne = random.nextInt(range+1);
		minusTwo = random.nextInt(minusOne+1);
		result = minusOne - minusTwo;
		question = minusOne + " - " + minusTwo + " =";
		questions.questionsList.add(question);
		questions.answers[0] = result;
		return questions;
	}
	
	//produce one add add(x+y+z) questions' function
	@SuppressWarnings("null")
	public Questions IntAddAdd(int range) {
		Questions questions = new Questions();
		questions = null;
		int addOne = 0;
		int addTwo = 0;
		int addThree = 0;
		addOne = random.nextInt(range+1);
		addTwo = random.nextInt(range+1-addOne);
		addThree = random.nextInt(range+1-addTwo-addThree);
		String question = addOne + " + " + addTwo + " + " +addThree + " = ";
		int result = addOne + addTwo + addThree;
		questions.questionsList.add(question);
		questions.answers[0] = result;
		return questions;
	}
	
	//produce one minus minus(x-y-z) questions' function
	@SuppressWarnings("null")
	public 	Questions IntMinusMinus(int range) {
		Questions questions = new Questions();
		questions = null;
		int minusOne = random.nextInt(range+1);
		int minusTwo = random.nextInt(minusOne+1);
		int minusThree = random.nextInt(minusOne-minusTwo+1);
		String question = minusOne + " - " + minusTwo + " - " + minusThree + " =";
		int result = minusOne - minusTwo - minusThree;
		questions.questionsList.add(question);
		questions.answers[0] = result;
		return questions;
	}
	
	//produce one add minus(x+y-z) questions' function
	@SuppressWarnings("null")
	public Questions IntAddMinus(int range) {
		Questions questions = new Questions();
		questions = null;
		int addOne = random.nextInt(range+1);
		int addTwo = random.nextInt(range+1-addOne);
		int minusThree = random.nextInt(addOne+addTwo+1);
		String question = addOne + " + " + addTwo + " - " + minusThree + " = ";
		int result = addOne + addTwo - minusThree;
		questions.questionsList.add(question);
		questions.answers[0] = result;
		return questions;
	}
	
	//produce one minus add(x-y+z) questions' function
	@SuppressWarnings("null")
	public Questions IntMinusAdd(int range) {
		Questions questions = new Questions();
		questions = null;
		int minusOne = random.nextInt(range+1);
		int minusTwo = random.nextInt(minusOne+1);
		int addThree = random.nextInt(range+1-minusOne+minusTwo);
		String question = minusOne + " - " + minusTwo + " + " + addThree + " = ";
		int result = minusOne + minusTwo - addThree;
		questions.questionsList.add(question);
		questions.answers[0] = result;
		return questions;
	}
	
	/* 1 grade
	 * 20 add(+)questions
	 */
	@SuppressWarnings("null")
	public Questions getOneGradeAddQuestion() {
		Questions questions = new Questions();
		questions = null;
		Questions oneQuestions = new Questions();
		int i = 0;
		for(i = 0; i < 20; i++)
		{
			oneQuestions = IntAdd(100);	
			questions.questionsList.add(oneQuestions.questionsList.get(0));
			questions.answers[i] = oneQuestions.answers[0];
		}
		return questions;
		
	}
	
	/* 1 grade
	 * 20 minus(-) question
	 */
	@SuppressWarnings("null")
	public Questions getOneGradeMinusQuestion() {
		Questions questions = new Questions();
		questions = null;
		Questions oneQuestions = new Questions();
		int i = 0;
		for(i = 0; i < 20; i++)
		{
			oneQuestions = IntMinus(100);	
			questions.questionsList.add(oneQuestions.questionsList.get(0));
			questions.answers[i] = oneQuestions.answers[0];
		}
		return questions;
		
	}
	
	/* 1 grade
	 * one grade 4 kinds mix questions
	 */
	@SuppressWarnings("null")
	public Questions getOneGradeMixQuestion() {
		Questions questions = new Questions();
		questions = null;
		Questions oneQuestions = new Questions();
		oneQuestions = null;
		int i = 0;
		for(i = 0; i<5; i++)
		{
			oneQuestions = IntAddAdd(100);	
			questions.questionsList.add(oneQuestions.questionsList.get(0));
			questions.answers[i] = oneQuestions.answers[0];
		}
		for(i = 5; i<10;i++)
		{
			oneQuestions = IntMinusMinus(100);	
			questions.questionsList.add(oneQuestions.questionsList.get(0));
			questions.answers[i] = oneQuestions.answers[0];
		}
		for(i = 10; i<15; i++)
		{
			oneQuestions = IntAddMinus(100);	
			questions.questionsList.add(oneQuestions.questionsList.get(0));
			questions.answers[i] = oneQuestions.answers[0];
		}
		for(i = 15; i<20; i++)
		{
			oneQuestions = IntMinusAdd(100);	
			questions.questionsList.add(oneQuestions.questionsList.get(0));
			questions.answers[i] = oneQuestions.answers[0];
		}
		return questions;
	}
	
	/*
	 * 2 grade
	 */
	//one multiplication question
	@SuppressWarnings("null")
	public Questions IntMultiplication(int range1, int range2) {
		Questions questions = new Questions();
		questions = null;
		int multiOne = random.nextInt(range1+1);
		int multiTwo = random.nextInt(range2+1);
		String question = multiOne + " * " + multiTwo + " = ";
		int result = multiOne * multiTwo;
		questions.questionsList.add(question);
		questions.answers[0] = result;
		return questions;
	}
	
	//one division question
	@SuppressWarnings("null")
	public Questions IntDivision(int range1, int range2) {
		Questions questions = new Questions();
		questions = null;
		int multiOne;
		int multiTwo;
		if(range1 == 2)
			//xx / x range2 = 10
		{
			multiOne = random.nextInt(range2)+1;
			multiTwo = random.nextInt(range2)+1;	
		}
		else
			//xxx / xx range2 = 100
		{
			multiOne = random.nextInt(range2-9) + 10;
			multiTwo = random.nextInt(range2-9) + 10;
		}
		int result = multiOne * multiTwo;
		String question = result + " / " + multiOne + " = ";
		questions.questionsList.add(question);
		questions.answers[0] = multiTwo;
		return questions;
	}
	
	// one division question, has remainder. a/b=c...d
	@SuppressWarnings("null")
	public Questions IntDivisionRemainder(int range) {
		Questions questions = new Questions();
		questions = null;
		int multiOne = random.nextInt(range)+1;
		int multiTwo = random.nextInt(range)+1;
		int remainder = random.nextInt(multiOne-1)+1;	
		int result = multiOne * multiTwo + remainder;
		String question = result + " / " + multiOne + " = ";
		questions.questionsList.add(question);
		questions.answers[0] = multiTwo;
		questions.remainder[0] = remainder;
		return questions;
	}
	
	//one multiplication add (a*b+c) question
	@SuppressWarnings("null")
	public Questions IntMultiplicationAdd(int range) {
		Questions questions = new Questions();
		questions = null;
		int multiOne = random.nextInt(range+1);
		int multiTwo = random.nextInt(range+1);
		int addOne = random.nextInt(101-multiOne*multiTwo);
		int result = multiOne * multiTwo + addOne;
		String question = multiOne + " * " + multiTwo + " + " + addOne + " = ";
		questions.questionsList.add(question);
		questions.answers[0] = result;
		return questions;
	}
	
	//one multiplication minus(a*b-c)question
	@SuppressWarnings("null")
	public Questions IntMultiplicationMinus(int range) {
		Questions questions = new Questions();
		questions = null;
		int multiOne = random.nextInt(range+1);
		int multiTwo = random.nextInt(range+1);
		int divisionOne = random.nextInt(multiOne * multiTwo+1);
		int result = multiOne * multiTwo - divisionOne;
		String question = multiOne + " * " + multiTwo + " - " + divisionOne + " = ";
		questions.questionsList.add(question);
		questions.answers[0] = result;
		return questions;
	}
	
	//one division add(a/b+c)question
	@SuppressWarnings("null")
	public Questions IntDivisionAdd(int range) {
		Questions questions = new Questions();
		questions = null;
		int multiOne = random.nextInt(range)+1;
		int multiTwo = random.nextInt(range)+1;
		int divOne = multiOne * multiTwo;
		int divTwo = multiTwo;
		int addOne = random.nextInt(101-multiOne);
		int result = divOne / divTwo + addOne;
		String question = divOne + " / " + divTwo + " + " + addOne + " = ";
		questions.questionsList.add(question);
		questions.answers[0] = result;
		return questions;
	}
	
	//one division minus(a/b-c)question
	@SuppressWarnings("null")
	public Questions IntDivisionMinus(int range) {
		Questions questions = new Questions();
		questions = null;
		int multiOne = random.nextInt(range)+1;
		int multiTwo = random.nextInt(range)+1;
		int divOne = multiOne * multiTwo;
		int divTwo = multiTwo;
		int minusOne = random.nextInt(multiOne);
		int result = divOne / divTwo - minusOne;
		String question = divOne + " / " + divTwo + " - " + minusOne + " = ";
		questions.questionsList.add(question);
		questions.answers[0] = result;
		return questions;
	}
	
	/*
	 * 2 grade multiplication 20
	 */
	public Questions getTwoGradeAddQuestion = getOneGradeAddQuestion();
	public Questions getTwoGradeMinusQuestion = getOneGradeMinusQuestion();
	
	@SuppressWarnings("null")
	public Questions getTwoGradeMultiQuestion() {
		Questions questions = new Questions();
		questions = null;
		Questions oneQuestions = new Questions();
		int i = 0;
		for(i = 0; i < 20; i++)
		{
			oneQuestions = IntMultiplication(10,10);	
			questions.questionsList.add(oneQuestions.questionsList.get(0));
			questions.answers[i] = oneQuestions.answers[0];
		}
		return questions;
	}
	
	/* 
	 * 2 grade division questions 20
	 */
	@SuppressWarnings("null")
	public Questions getTwoGradeDivQuestion() {
		Questions questions = new Questions();
		questions = null;
		Questions oneQuestions = new Questions();
		int i = 0;
		for(i = 0; i < 20; i++)
		{
			oneQuestions = IntDivision(2,10);	
			questions.questionsList.add(oneQuestions.questionsList.get(0));
			questions.answers[i] = oneQuestions.answers[0];
		}
		return questions;
	}
	
	/*
	 *  2 grade 4 kinds mix questions
	 */
	@SuppressWarnings("null")
	public Questions getTwoGradeMixQuestion() {
		Questions questions = new Questions();
		questions = null;
		Questions oneQuestions = new Questions();
		oneQuestions = null;
		int i = 0;
		for(i = 0; i<5; i++)
		{
			oneQuestions = IntMultiplicationAdd(10);	
			questions.questionsList.add(oneQuestions.questionsList.get(0));
			questions.answers[i] = oneQuestions.answers[0];
		}
		for(i = 5; i<10;i++)
		{
			oneQuestions = IntMultiplicationMinus(10);	
			questions.questionsList.add(oneQuestions.questionsList.get(0));
			questions.answers[i] = oneQuestions.answers[0];
		}
		for(i = 10; i<15; i++)
		{
			oneQuestions = IntDivisionAdd(10);	
			questions.questionsList.add(oneQuestions.questionsList.get(0));
			questions.answers[i] = oneQuestions.answers[0];
		}
		for(i = 15; i<20; i++)
		{
			oneQuestions = IntDivisionMinus(10);	
			questions.questionsList.add(oneQuestions.questionsList.get(0));
			questions.answers[i] = oneQuestions.answers[0];
		}
		return questions;
	}
	
	/* 
	 * 3 grade, include a*b*c, a/b/c, a*b/c and a/b*c
	 * has remainder a/b=c...d, d can be get by questions.getRemainder, is an int[]
	 */
	
	// one question return a*b*c or a*b/c
	@SuppressWarnings("null")
	public Questions IntFirstMultiplication(int range) {
		Questions questions = new Questions();
		questions = null;
		int multiOne = random.nextInt(range+1);
		int multiTwo = random.nextInt(range+1);
		int third = random.nextInt(range)+1;
		int choice = random.nextInt(2);
		int result = 0;
		String question;
		if(choice == 0)
		{
			result = multiOne * multiTwo * third;
			question = multiOne + " * " + multiTwo + " * " + third + " = ";
			questions.questionsList.add(question);
			questions.answers[0] = result;
		}
		else if (choice ==1)
		{
			result = multiOne * multiTwo / third;
			question = multiOne + " * " + multiTwo + " / " + third + " = ";
			questions.questionsList.add(question);
			questions.answers[0] = result;
			questions.remainder[0] = multiOne * multiTwo % third;
		}
		return questions;
	}
	
	// one mix question first division include a/b/c and a/b*c
	@SuppressWarnings("null")
	public Questions IntFirstDivision (int range) {
		Questions questions = new Questions();
		questions = null;
		int divTwo = random.nextInt(range)+1;
		int middleresult = random.nextInt(range+1);
		int divOne = divTwo * middleresult;
		int third = random.nextInt(range)+1;
		int choice = random.nextInt(2);
		int result = 0;
		int remainder = 0;
		String question = "";
		if (choice ==0)
		{
			result = divOne / divTwo * third;
			question = divOne + " / " + divTwo + " * " + third + " = ";
		}
		else if (choice == 1)
		{
			result = divOne / divTwo / third;
			question = divOne + " / " + divTwo + " / " + third + " = ";
			remainder = middleresult % third;
		}
		questions.questionsList.add(question);
		questions.answers[0] = result;
		questions.remainder[0] = remainder;
		return questions;
	}
	
	/*
	 *  3 grade multiplications a*b, 
	 */
	@SuppressWarnings("null")
	public Questions getThreeGradeMultiQuestion() {
		Questions questions = new Questions();
		questions = null;
		Questions oneQuestions = new Questions();
		int i = 0;
		for(i = 0; i < 20; i++)
		{
			oneQuestions = IntMultiplication(100,100);	
			questions.questionsList.add(oneQuestions.questionsList.get(0));
			questions.answers[i] = oneQuestions.answers[0];
		}
		return questions;
	}
	
	/*
	 *  3 grade divisions question a/b =c...d
	 *  return object has questionsList, answer[] and remainder[], 
	 *  if have no remainder, the value is 0
	 */
	@SuppressWarnings("null")
	public Questions getThreeGradeDivQuestion() {
		Questions questions = new Questions();
		questions = null;
		Questions oneQuestions = new Questions();
		int i = 0;
		for(i = 0; i < 20; i++)
		{
			oneQuestions = IntDivisionRemainder(10);	
			questions.questionsList.add(oneQuestions.questionsList.get(0));
			questions.answers[i] = oneQuestions.answers[0];
			questions.remainder[i] = oneQuestions.remainder[0];
		}
		return questions;
	}
	
	/*
	 *  3 grade mix questions, a*b*c, a/b/c, a*b/c and a/b*c
	 *  return object has questionsList, answer[] and remainder[], 
	 *  if have no remainder, the value is 0
	 */
	@SuppressWarnings("null")
	public Questions getThreeGradeMixQuestion() {
		Questions questions = new Questions();
		questions = null;
		Questions oneQuestions = new Questions();
		oneQuestions = null;
		int i = 0;
		for(i = 0; i<10; i++)
		{
			oneQuestions = IntFirstMultiplication(20);	
			questions.questionsList.add(oneQuestions.questionsList.get(0));
			questions.answers[i] = oneQuestions.answers[0];
			questions.remainder[i] = oneQuestions.remainder[0];
			
		}
		for(i = 5; i<20;i++)
		{
			oneQuestions = IntFirstDivision(20);	
			questions.questionsList.add(oneQuestions.questionsList.get(0));
			questions.answers[i] = oneQuestions.answers[0];
			questions.remainder[i] = oneQuestions.remainder[0];
		}
		return questions;
	}
	
	/*
	 *  4 grade add and minus have double type
	 *          xxx *xx and xxx / xx
	 */
	
	//one question, double add
	public Questions DoubleAdd(int range) {
		Questions questions = new Questions();
		double addOne = (double)random.nextInt(range)/10.0;
		double addTwo = (double)random.nextInt(range)/10.0;
		double result = addOne + addTwo;
		String question = addOne + " + " + addTwo + " =";
		questions.questionsList.add(question);
		questions.answers[0] = result;
		return questions;
	}
	
	//one question double minus
	public Questions DoubleMinus(int range) {
		Questions questions = new Questions();
		int nobigthan = random.nextInt(range);
		double minusOne = (double)nobigthan / 10.0;
		double minusTwo = (double)random.nextInt(nobigthan) / 10.0;
		double result = minusOne - minusTwo;
		String question = minusOne + " - " + minusTwo + " = ";
		questions.questionsList.add(question);
		questions.answers[0] = result;
		return questions;
	}
	
	/*
	 * 4 grade double add questions 20
	 */
	
	@SuppressWarnings("null")
	public Questions getFourGradeAddQuestion() {
		Questions questions = new Questions();
		questions = null;
		Questions oneQuestions = new Questions();
		int i = 0;
		for(i = 0; i < 20; i++)
		{
			oneQuestions = DoubleAdd(100);	
			questions.questionsList.add(oneQuestions.questionsList.get(0));
			questions.answers[i] = oneQuestions.answers[0];
		}
		return questions;
	}
	
	/*
	 * 4 grade double minus questions 20
	 */
	@SuppressWarnings("null")
	public Questions getFourGradeMinusQuestion() {
		Questions questions = new Questions();
		questions = null;
		Questions oneQuestions = new Questions();
		int i = 0;
		for(i = 0; i < 20; i++)
		{
			oneQuestions = DoubleMinus(100);	
			questions.questionsList.add(oneQuestions.questionsList.get(0));
			questions.answers[i] = oneQuestions.answers[0];
		}
		return questions;
	}
	
	/*
	 *  4 grade multiplication question 20
	 */
	@SuppressWarnings("null")
	public Questions getFourGradeMultiQuestion() {
		Questions questions = new Questions();
		questions = null;
		Questions oneQuestions = new Questions();
		int i = 0;
		for(i = 0; i < 20; i++)
		{
			oneQuestions = IntMultiplication(1000,100);	
			questions.questionsList.add(oneQuestions.questionsList.get(0));
			questions.answers[i] = oneQuestions.answers[0];
		}
		return questions;
	}
	
	/*
	 *  4 grade division question 20
	 */
	@SuppressWarnings("null")
	public Questions getFourGradeDivQuestion() {
		Questions questions = new Questions();
		questions = null;
		Questions oneQuestions = new Questions();
		int i = 0;
		for(i = 0; i < 20; i++)
		{
			oneQuestions = IntDivision(3,100);	
			questions.questionsList.add(oneQuestions.questionsList.get(0));
			questions.answers[i] = oneQuestions.answers[0];
		}
		return questions;
	}
	
	/*
	 *  4 grade mix question 20
	 */
	@SuppressWarnings("null")
	public Questions getFourGradeMixQuestion () {
		Questions questions = new Questions();
		questions = null;
		Questions oneQuestions = new Questions();
		oneQuestions = null;
		int i = 0;
		for(i = 0; i<10; i++)
		{
			oneQuestions = IntFirstMultiplication(50);	
			questions.questionsList.add(oneQuestions.questionsList.get(0));
			questions.answers[i] = oneQuestions.answers[0];
			questions.remainder[i] = oneQuestions.remainder[0];
			
		}
		for(i = 5; i<20;i++)
		{
			oneQuestions = IntFirstDivision(50);	
			questions.questionsList.add(oneQuestions.questionsList.get(0));
			questions.answers[i] = oneQuestions.answers[0];
			questions.remainder[i] = oneQuestions.remainder[0];
		}
		return questions;
	}
	
	/*
	 * 5 grade fraction 
	 */
	
	//最大公约数
	public static int getLCD(int num1, int num2)
	{
		int max = Math.max(num1, num2);
		int min = Math.min(num1, num2);

		while(max % min != 0)
		{
			int temp = max;
			max = min;
			min = temp % min;
		}

		return min;
	 }

	//最小公倍数
	public static int getGCM(int num1, int num2)
	{
		return num1 * num2 /getLCD(num1, num2);
	}
	//约分
	public Fraction getFraction(int numerator, int denominator)
	{
		int lcd = getLCD(numerator, denominator);
		if(lcd != 1){
			numerator = numerator / lcd;
			denominator = denominator / lcd;
		}
		Fraction result = new Fraction();
		result.denominator = denominator;
		result.numerator = numerator;
		return result;
	}
	
	public Fraction getNewFraction(int range) {
		Random random = new Random();
		int numerator = random.nextInt(range)+1;
		int denominator = random.nextInt(range)+1;
		int lcd = getLCD(numerator, denominator);
		if(lcd != 1){
			numerator = numerator / lcd;
			denominator = denominator / lcd;
		}
		Fraction result = new Fraction();
		result.numerator = numerator;
		result.denominator = denominator;
		return result;
	}
	public Fraction FractionAdd(Fraction fract1,Fraction fract2){
		int gcm = getGCM(fract1.denominator, fract2.denominator);//最小公倍数作为分母
		int numerator = 0;
		int denominator = 0;
		numerator = fract1.numerator * ( gcm / fract1.denominator) + fract2.numerator * (gcm / fract2.denominator);
		denominator = gcm;//分母为最小公倍数
		int lcd = getLCD(numerator, denominator);
			numerator = numerator / lcd;
			denominator = denominator / lcd;
		Fraction result = new Fraction();
		result.setDenominator(denominator);
		result.setNumerator(numerator);
		return result;
	}
	
	public Fraction FractionMultiplication(Fraction fract1,Fraction fract2){//分数相乘
		int numerator,denominator;  
        numerator = fract1.numerator * fract2.numerator;  
        denominator = fract1.denominator * fract2.denominator;  
		//结果约分
		int lcd = getLCD(numerator, denominator);//最大公约数
		numerator = numerator / lcd;
		denominator = denominator /lcd;
		Fraction result = new Fraction();
		result.setDenominator(denominator);
		result.setNumerator(numerator);
		return result;
	}
	
	public Fraction FractionDivision(Fraction fract1,Fraction fract2){   
		 int numerator,denominator;  
	        numerator = fract1.numerator * fract2.denominator;  
	        denominator = fract1.denominator * fract2.numerator;  
        int lcd = getLCD(numerator,denominator);  
        numerator = numerator / lcd;  
        denominator = denominator / lcd;  
        Fraction result = new Fraction();
		result.setDenominator(denominator);
		result.setNumerator(numerator);
		return result;
    }  
	
	public Fraction FractionMinus(Fraction fract1,Fraction fract2) {
		int a = getGCM(fract1.denominator,fract2.denominator);  
        int numerator,denominator;  
        numerator = fract1.numerator * ( a / fract1.denominator) - fract2.numerator * (a / fract2.denominator);  
        denominator = a;  
	    int b = getLCD(numerator,denominator);  
	    numerator = numerator / b;  
	    denominator = denominator / b;  
	    Fraction result = new Fraction();
		result.setDenominator(denominator);
		result.setNumerator(numerator);
		return result;
	}

	/*
	 *  5 grade fraction add question 20
	 */
	@SuppressWarnings("null")
	public Questions getFiveGradeAddQuestion() {
		Questions questions = new Questions();
		questions = null;
		int i = 0;
		for(i = 0; i < 20; i++)
		{
			Fraction frac1 = getNewFraction(10);
			Fraction frac2 = getNewFraction(10);
			String result = FractionAdd(frac1,frac2).toString();
			String question = frac1.toString()+" + " + frac2.toString() + " = ";	
			questions.questionsList.add(question);
			questions.fractionResult[i] = result;
		}
		return questions;
	}
	
	@SuppressWarnings("null")
	public Questions getFiveGradeMinusQuestion() {
		Questions questions = new Questions();
		questions = null;
		int i = 0;
		for(i = 0; i < 20; i++)
		{
			Fraction frac1 = getNewFraction(10);
			Fraction frac2 = getNewFraction(10);
			String result = FractionMinus(frac1,frac2).toString();
			String question = frac1.toString()+" + " + frac2.toString() + " = ";	
			questions.questionsList.add(question);
			questions.fractionResult[i] = result;
		}
		return questions;
	}
	
	@SuppressWarnings("null")
	public Questions getFiveGradeMultiQuestion() {
		Questions questions = new Questions();
		questions = null;
		int i = 0;
		for(i = 0; i < 20; i++)
		{
			Fraction frac1 = getNewFraction(10);
			Fraction frac2 = getNewFraction(10);
			String result = FractionMultiplication(frac1,frac2).toString();
			String question = frac1.toString()+" + " + frac2.toString() + " = ";	
			questions.questionsList.add(question);
			questions.fractionResult[i] = result;
		}
		return questions;
	}
	
	@SuppressWarnings("null")
	public Questions getFiveGradeDivQuestion() {
		Questions questions = new Questions();
		questions = null;
		int i = 0;
		for(i = 0; i < 20; i++)
		{
			Fraction frac1 = getNewFraction(10);
			Fraction frac2 = getNewFraction(10);
			String result = FractionDivision(frac1,frac2).toString();
			String question = frac1.toString()+" + " + frac2.toString() + " = ";	
			questions.questionsList.add(question);
			questions.fractionResult[i] = result;
		}
		return questions;
	}
	
	public Questions getFiveGradeMixQuestion = getFourGradeMixQuestion();
	
	/*
	 * 6 grade () 3 operators
	 */
	
	@SuppressWarnings("null")
	public Questions getSixGradeAddQuestion() {
		Questions questions = new Questions();
		questions = null;
		Questions oneQuestions = new Questions();
		int i = 0;
		for(i = 0; i < 20; i++)
		{
			oneQuestions = IntAdd(1000);	
			questions.questionsList.add(oneQuestions.questionsList.get(0));
			questions.answers[i] = oneQuestions.answers[0];
		}
		return questions;
		
	}
	

	@SuppressWarnings("null")
	public Questions getSixGradeMinusQuestion() {
		Questions questions = new Questions();
		questions = null;
		Questions oneQuestions = new Questions();
		int i = 0;
		for(i = 0; i < 20; i++)
		{
			oneQuestions = IntMinus(1000);	
			questions.questionsList.add(oneQuestions.questionsList.get(0));
			questions.answers[i] = oneQuestions.answers[0];
		}
		return questions;
		
	}
	
	@SuppressWarnings("null")
	public Questions getSixGradeMultiQuestion() {
		Questions questions = new Questions();
		questions = null;
		Questions oneQuestions = new Questions();
		int i = 0;
		for(i = 0; i < 20; i++)
		{
			oneQuestions = IntMultiplication(1000,1000);	
			questions.questionsList.add(oneQuestions.questionsList.get(0));
			questions.answers[i] = oneQuestions.answers[0];
		}
		return questions;
	}
	
	@SuppressWarnings("null")
	public Questions getSixGradeDivQuestion() {
		Questions questions = new Questions();
		questions = null;
		Questions oneQuestions = new Questions();
		int i = 0;
		for(i = 0; i < 20; i++)
		{
			oneQuestions = IntDivision(3,1000);	
			questions.questionsList.add(oneQuestions.questionsList.get(0));
			questions.answers[i] = oneQuestions.answers[0];
		}
		return questions;
	}
	
	@SuppressWarnings("null")
	public Questions getSixGradeMixQuestion() {
		Questions questions = new Questions();
		questions = null;
		HashSet set = new HashSet();
		int index = 0;
		while(set.size()<20)
		{
			index = random.nextInt(40);
			set.add(index);
		}
		Iterator it=set.iterator();
		int i = 0;
		while(it.hasNext())
		{
			Object o = it.next();
			index = (Integer) o;
			questions.questionsList.add(sixQuestion[index]);
			questions.answers[i] = sixResult[index];
			i++;
		}
		return questions;
	}
	
}
