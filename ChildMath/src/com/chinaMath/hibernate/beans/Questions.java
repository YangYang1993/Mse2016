package com.chinaMath.hibernate.beans;

import java.util.ArrayList;
import java.util.List;

public class Questions {

	public List<String> questionsList = new ArrayList<String>();
	public double[] answers = new double[20];
	public int[] remainder = null;
	public String[] fractionResult = null;
	
	public List<String> getQuestionsList() {
		return questionsList;
	}
	
	public void setQuestionsList (List<String> questionsList) {
		this.questionsList = questionsList;
	}
	
	public double[] getAnswers() {
		return answers;
	}
	
	public void setAnswers(double[] answers) {
		this.answers = answers;
	}
	
	public int[] getRemainder() {
		return remainder;
	}
	
	public void setRemainder(int[] remainder) {
		this.remainder = remainder;
	}
	public String[] getFractionResult() {
		return fractionResult;
	}
	
	public void setFractionResult(String[] fractionResult) {
		this.fractionResult = fractionResult;
	}
}
