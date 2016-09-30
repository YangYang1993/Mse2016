package com.chinaMath.hibernate.beans;

import java.util.Date;


public class Record extends AbstractRecord{
	
    public Record(){
		
	}
	public Record(Integer recordID,Integer type,Date datetime,Integer minutes, Integer errorNum,Integer userID) {
		super(recordID,type,datetime,minutes,errorNum,userID);
	}

}
