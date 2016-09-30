package com.chinaMath.hibernate.dao;

import java.util.List;
import com.chinaMath.hibernate.beans.Record;

public interface IRecordDAO {
	
	public void insertRecord(Record record);
	public List<Record> getRecord(int userID,int month);
	public List<Record> getRecordByUserID(int userID);
}
