package com.chinaMath.hibernate.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import com.chinaMath.hibernate.beans.Record;


public class RecordDAO extends HibernateDaoSupport implements IRecordDAO{
	
	public void insertRecord(Record record) {
		// TODO Auto-generated method stub
		getHibernateTemplate().save(record);
	}
	public List<Record> getRecord(int userID,int month) {
		// TODO Auto-generated method stub
		String sql = "from Record where userID=? and month(datetime)=?";
       // String month1=String.valueOf(month);
		 Object[] value={userID,month};
		List<Record> record =(List<Record>)getHibernateTemplate().find(sql,value);
		return record;
		}
	public List<Record> getRecordByUserID(int userID){
		List<Record> temp = (List<Record>)getHibernateTemplate().find("from Record " + 
				"where userID=?", userID);
		return (temp.size()==0?null:temp);
	}
}
