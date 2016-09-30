package com.chinaMath.hibernate.beans;

public class Fraction {
	
	public int numerator;
	public int denominator;
	
	public int getNumerator() {
		return numerator;
	}
	public void setNumerator(int numerator) {
		this.numerator = numerator;
	}
	public int getDenominator() {
		return denominator;
	}
	public void setDenominator(int denominator) {
		this.denominator = denominator;
	}
	
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
	
	public String toString() {
		return numerator+"/"+denominator;
	}

	
	

}
