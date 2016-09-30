package com.chinaMath.struts.actions;



import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.chinaMath.hibernate.beans.Honour;
import com.chinaMath.hibernate.beans.Record;
import com.chinaMath.hibernate.beans.User;
import com.chinaMath.hibernate.dao.HonourDAO;
import com.chinaMath.hibernate.dao.RecordDAO;
import com.chinaMath.hibernate.dao.UserDAO;

public class UserInfoAction extends DispatchAction{
	
	UserDAO userDAO;
	HonourDAO honourDAO;
	RecordDAO recordDAO;
	public UserDAO getUserDAO() {
		return userDAO;
	}
	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	public void setHonourDAO(HonourDAO honourDAO) {
		this.honourDAO = honourDAO;
	}
	public HonourDAO getHonourDAO() {
		return honourDAO;
	}
	public void setRecordDAO(RecordDAO recordDAO) {
		this.recordDAO = recordDAO;
	}
	public RecordDAO getRecordDAO() {
		return recordDAO;
	}
	
	
	public ActionForward viewInfo(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response)throws Exception{
		ActionForward forward = mapping.findForward("Fail");
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		List<Honour> honour = honourDAO.getHonourByUserID(user.getUserID());
		session.setAttribute("honour", honour);
		List<Integer> obja = new ArrayList<Integer>();
		List<Integer> objb = new ArrayList<Integer>();
		List<Integer> objc = new ArrayList<Integer>();
		for(int i=1;i<=12;i++){
			List<Record> list1 = recordDAO.getRecord(user.getUserID(), i);
			int error=0;
			int min=0;
			if(list1.equals("")){
				obja.add(0);
				objb.add(error);
				objc.add(min);
			}
			else{
				for(int a=0;a<list1.size();a++){
					 error=error+list1.get(a).getErrorNum();
					 min = min+list1.get(a).getMinutes();
					
				}
				 obja.add(list1.size()*20);
				 objb.add(error);
				 objc.add(min);
			}
			
		}
		session.setAttribute("error",objb);
		session.setAttribute("min",objc);
		session.setAttribute("num",obja);
		forward = mapping.findForward("success");
		return forward;
	}

}
