package com.chinaMath.hibernate.dao;



import java.util.List;

import com.chinaMath.hibernate.beans.Honour;

public interface IHonourDAO {
	public void insertHonour(Honour honour);
	public void updateHonour(Honour honour);
	public Honour getHonourByHonourID(Integer honourID);
	public List<Honour> getHonourByUserID(Integer userID);
	public Honour getHonourByHonourTypeAndUserID(Integer userID, Integer honourType);
	public void deleteHonourByHonourID(Integer honourID);
	public void deleteHonour(Honour honour);

}
