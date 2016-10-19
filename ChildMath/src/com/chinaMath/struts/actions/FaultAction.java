package com.chinaMath.struts.actions;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Scanner;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.chinaMath.hibernate.beans.Fault;
import com.chinaMath.hibernate.beans.Honour;
import com.chinaMath.hibernate.beans.Record;
import com.chinaMath.hibernate.beans.User;
import com.chinaMath.hibernate.dao.FaultDAO;
import com.chinaMath.hibernate.dao.HonourDAO;
import com.chinaMath.hibernate.dao.RecordDAO;
import com.chinaMath.struts.forms.FaultForm;
import com.chinaMath.struts.forms.UserForm;
import com.chinaMath.hibernate.dao.UserDAO;

//锟斤拷取锟斤拷前时锟斤拷
//import java.util.Date;
//import java.text.SimpleDateFormat;



public class FaultAction extends DispatchAction{
	FaultDAO faultDAO;
	RecordDAO recordDAO;
	HonourDAO honourDAO;
	//锟斤拷录锟斤拷锟斤拷txt锟侥硷拷锟斤拷锟
	int fid = 0;
	//UserDAO userDAO;
	public FaultDAO getFaultDAO() {
		return faultDAO;
	}
	
	public void setFaultDAO (FaultDAO faultDAO) {
		this.faultDAO = faultDAO;
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
	//锟斤拷锟斤拷锟斤拷锟斤拷獗撅拷锟斤拷锟脚ワ拷锟斤拷锟阶拷锟斤拷锟斤拷锟揭筹拷锟斤拷锟绞撅拷锟斤拷锟
	public ActionForward getFaultFile(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response)throws Exception{
		/*UserForm userForm = (UserForm)form;
		User user = userDAO.getUserByUserName(userForm.getUserName());
		int userID = user.getUserID(); */
		HttpSession session = request.getSession();
		int totalPage = 0;
		int userID = Integer.parseInt(request.getParameter("userID"));
		
		//锟斤拷前页锟斤拷锟斤拷前台锟斤拷取
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		//锟芥储锟斤拷前页锟斤拷锟斤拷目
		List<String> operand = new ArrayList<String>();
		//锟芥储锟斤拷前页锟侥达拷
		List<String> results = new ArrayList<String>();
		Fault fault =  faultDAO.getFaultByUserID(userID);
		String fileAddr = fault.getFileAddr();
		//fileAddr = request.getContextPath() + fileAddr;
		File file = new File(fileAddr );
		//String filePath = Thread.currentThread().getContextClassLoader().getResource("").toURI().getPath();
		//String filePath = System.getProperty("user.dir").toURI().getPath();
		totalPage = readFaultByPage(currentPage, file, operand, results);
		
		session.setAttribute("totalPage", totalPage);
		session.setAttribute("currentPage", currentPage);
		session.setAttribute("operand", operand);
		session.setAttribute("results", results);
		//session.setAttribute("filePath", filePath);
		ActionForward forward = new ActionForward();
		forward = mapping.findForward("getFault");
		return forward;
	}
	//when user click the "delete fault" btn, a fault will be deleted from the fault file and the page will be refreshed automatically
	public ActionForward deleteAFault(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response)throws Exception{
		HttpSession session = request.getSession();
		int totalPage = 0;
		int userID = Integer.parseInt(request.getParameter("userID"));
		//锟斤拷前页锟斤拷锟斤拷前台锟斤拷取
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		//删锟斤拷锟斤拷锟斤拷牛锟斤拷锟角疤拷锟饺
		int deleteNum = Integer.parseInt(request.getParameter("deletedNum"));
		deleteNum = (currentPage - 1) * 12 + deleteNum +1 ;
		//锟芥储锟斤拷前页锟斤拷锟斤拷目
		List<String> operand = new ArrayList<String>();
		//锟芥储锟斤拷前页锟侥达拷
		List<String> results = new ArrayList<String>();
		Fault fault = new Fault();
		fault = (Fault) faultDAO.getFaultByUserID(userID);
		String fileAddr = fault.getFileAddr();
		File file = new File(fileAddr);
		deleteALine(file, deleteNum);
		currentPage = 1;
		totalPage = readFaultByPage(currentPage, file, operand, results);
		
		session.setAttribute("totalPage", totalPage);
		session.setAttribute("currentPage", currentPage);
		session.setAttribute("operand", operand);
		session.setAttribute("results", results);
		//删锟斤拷锟斤拷刷锟铰碉拷前页
		ActionForward forward = new ActionForward();
		forward = mapping.findForward("successDeletedFault");
		return forward;
	}
	
	public ActionForward addFaults(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response)throws Exception{
		HttpSession session = request.getSession();
		ActionForward forward = null;

		String userIDStr = request.getParameter("userId");
        
		//锟斤拷锟缴达拷锟斤拷锟侥硷拷锟斤拷锟斤拷锟斤拷锟侥硷拷锟斤拷锟斤拷
		String fileAddr = "fault-" + userIDStr + "-" + fid + ".txt";
		System.out.println(fileAddr);
		File file = new File("/Users/yangyang/Mse2016/ChildMath/WebRoot/faultFile/"+fileAddr);
		createFile(file);
		
		java.io.FileOutputStream out = new java.io.FileOutputStream(file);
		//锟斤拷锟解，锟斤拷前台锟斤拷锟
		String info = request.getParameter("wrongInfo");
		//info = new String(info.getBytes("ISO-8859-1"),"utf-8");
		JSONArray jsonArray = JSONArray.fromObject(info);
		String[] stringArray = new String[jsonArray.size()];
        for( int i = 0 ; i<jsonArray.size() ; i++ ){
        	JSONObject jObject = (JSONObject)jsonArray.getJSONObject(i);
            stringArray[i] = jObject.get("qst").toString();

            System.out.println(stringArray[i]);
            out.write((stringArray[i]+"\n").getBytes("gbk"));

        }
        int userID = Integer.parseInt(userIDStr);
		int numOfFaults = jsonArray.size();
		int numOfCorrects = 20-numOfFaults;

		//int timeForPractice = Integer.parseInt(request.getParameter("time"));
		
		/*
		String lujing = "/Mse2016/ChildMath/WebRoot/faultFile";
		File folder = new File(lujing);
		if (!folder.getParentFile().exists()) {
			System.out.println("000001");
			folder.getParentFile().mkdirs();
		}
		*/
			

			Fault fault = new Fault();
			fault.setUserID(userID);
			fault.setFileAddr(fileAddr);
			faultDAO.insertFault(fault);

			out.flush();
			out.close();
			fid++;
			System.out.println(fid);
		
		
		/*
        //锟斤拷锟斤拷募锟斤拷胁锟斤拷锟斤拷冢锟斤拷陆锟斤拷募锟斤拷锟
		File folder = new File("/Mse2016/ChildMath/WebRoot/faultFile");
		if (!(folder.exists() && folder.isDirectory())){
			System.out.println("000001");
			folder.mkdirs();
		}
		File file = null;
		//锟斤拷锟斤拷没锟矫伙拷写锟斤拷锟斤拷募锟斤拷锟斤拷陆锟斤拷锟斤拷锟斤拷募锟
		if(faultDAO.getFaultByUserID(userID) == null){
			
			System.out.println("000002");
			String fileAddr = "/Mse2016/ChildMath/WebRoot/faultFile/fault-" + userIDStr + ".txt";
			file = new File(fileAddr);
			createFile(file);
			Fault fault = new Fault();
			fault.setUserID(userID);
			fault.setFileAddr(fileAddr);
			faultDAO.insertFault(fault);
		}
		//锟斤拷锟斤拷取锟斤拷锟矫伙拷锟侥达拷锟斤拷锟侥硷拷锟斤拷址
		else {
			System.out.println("000003");
			Fault fault = faultDAO.getFaultByUserID(userID);
			String fileAddr = fault.getFileAddr();
			file = new File(fileAddr);
		}
		//锟斤拷锟矫伙拷锟侥达拷锟斤拷锟侥硷拷锟叫诧拷锟斤拷锟斤拷锟
		for (String str: stringArray){
			addToTxt(str, file);
		}
		*/
		/*
		//锟斤拷锟斤拷锟斤拷锟斤拷
		int honourOf90Right = 1;
		int honourOf100Right = 2;
		int honourOf12sPerQ = 3;
		int honourOf6sPerQ = 4;
		int honourOfLt120s = 5;
		int honourOfLt300s = 6;
		Calendar calendar = Calendar.getInstance();
		Date date = calendar.getTime();
		Record record = new Record();
		record.setDatetime(date);
		record.setErrorNum(numOfFaults);
		record.setMinutes(timeForPractice);
		record.setType(1);
		record.setUserID(userID);
		recordDAO.insertRecord(record);
		Honour honour = new Honour();
		honour.setUserID(userID);
		//锟斤拷锟斤拷1
		if (numOfFaults > 0 && numOfFaults < 3 ){
			if (honourDAO.getHonourByHonourTypeAndUserID(userID, honourOf90Right) == null){
				honour.setHonourType(honourOf90Right);
				honourDAO.insertHonour(honour);
			}
		}
		//锟斤拷锟斤拷2
		else if (numOfFaults == 0 ){
			if (honourDAO.getHonourByHonourTypeAndUserID(userID, honourOf100Right) == null){
				honour.setHonourType(honourOf100Right);
				honourDAO.insertHonour(honour);
			}
		}
		if (numOfCorrects != 0){
			//锟斤拷锟斤拷3
			if (timeForPractice/numOfCorrects <= 12 && timeForPractice/numOfCorrects >6 ){
				if (honourDAO.getHonourByHonourTypeAndUserID(userID, honourOf12sPerQ) == null){
					honour.setHonourType(honourOf12sPerQ);
					honourDAO.insertHonour(honour);
				}
			}
			//锟斤拷锟斤拷4
			else if (timeForPractice/numOfCorrects <= 6 ){
				if (honourDAO.getHonourByHonourTypeAndUserID(userID, honourOf6sPerQ) == null){
					honour.setHonourType(honourOf6sPerQ);
					honourDAO.insertHonour(honour);
				}
			}
		}
		//锟斤拷锟斤拷5
		if (timeForPractice >0 && timeForPractice <= 120 ){
			if (honourDAO.getHonourByHonourTypeAndUserID(userID, honourOfLt120s) == null){
				honour.setHonourType(honourOfLt120s);
				honourDAO.insertHonour(honour);
			}
		}
		//锟斤拷锟斤拷6
		else if (timeForPractice <= 300 ){
			if (honourDAO.getHonourByHonourTypeAndUserID(userID, honourOfLt300s) == null){
				honour.setHonourType(honourOfLt300s);
				honourDAO.insertHonour(honour);
			}
		}
		*/
		return forward;
	}
	
	//锟斤拷页锟斤拷示锟斤拷锟斤拷
	public static int readFaultByPage(int currentPage, File file, List<String> operand, List<String> results){
		int totalPage = 0;
		//每页锟斤拷示锟斤拷锟斤拷锟斤拷
		int pageSize = 12;
		//锟斤拷锟斤拷锟斤拷锟斤拷
		int totalFileLine = 0;
		//锟斤拷页锟斤拷
		
		FileReader fileReader = null;
		
		//锟矫碉拷锟斤拷锟斤拷锟斤拷锟斤拷
		if (file.exists()){
			
			try {
				fileReader = new FileReader(file);
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			BufferedReader buffer=new BufferedReader(fileReader); 
			String tempString = null;
			try {
				while ((tempString = buffer.readLine()) != null){
					totalFileLine ++;
				}
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			try {
				buffer.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				fileReader.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			//锟矫碉拷锟侥硷拷锟斤拷页锟斤拷
			if (totalFileLine % pageSize == 0){
				totalPage = totalFileLine / pageSize;
			}
			else{
				totalPage = totalFileLine / pageSize + 1;
			}
			//锟斤拷始锟斤拷取
			try {
				fileReader = new FileReader(file);
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			buffer=new BufferedReader(fileReader); 
			tempString = null;
			//锟斤拷取锟斤拷前页前一页锟斤拷锟斤拷锟捷ｏ拷锟斤拷锟斤拷锟斤拷取锟斤拷锟斤拷锟斤拷buffer指锟斤拷前页锟斤拷
			for (int i = 0; i < (currentPage - 1) * pageSize; i ++){
				try {
					buffer.readLine();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			//锟斤拷取锟斤拷前页锟斤拷锟斤拷锟斤拷
			try {
				for (int k = 0; k < pageSize&&(tempString=buffer.readLine())!=null; k++){
					splitt (tempString, k, operand, results);
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				buffer.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				fileReader.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else {
			System.out.println("the child don't have any faults");
		}
		return totalPage ;
	}
	
	public static String[] splitt(String str, int k, List operand, List results){
        String strr = str.trim();
        String[] abc = strr.split("=");
        operand.add(abc[0]);
        results.add(abc[1]);
        //System.out.println(str2);
        return abc;
    }
	
	public static void deleteALine(File file, int deletedLine) {
		BufferedWriter bufferWriter = null;
		List<String> lists = new ArrayList<String>();
		int i = 0;
		//deletedLine += 1;
		//锟斤拷锟侥硷拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷list锟斤拷锟斤拷锟斤拷锟芥被删锟斤拷一锟斤拷
		try {
            Scanner in = new Scanner(file);
  
            while (in.hasNextLine()) {
            	i ++;
                String str = in.nextLine();
                lists.add(str);
                if (i == deletedLine){
                	lists.remove(str);
                }
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
		try {
			bufferWriter =new BufferedWriter(new FileWriter(file));
		} catch (IOException e) {
			System.out.println(e);
			e.printStackTrace();
		}
		for(String strr : lists){
			try {
				bufferWriter.write(strr + "\r\n");
			} catch (IOException e) {
				System.out.println(e);
				e.printStackTrace();
			} //然锟斤拷锟侥硷拷写锟斤拷
		}
		try {
			bufferWriter.flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} //flush
		//System.out.println("deleted line: "+ deletedLine);
	}//del	
	
	public static void createFile(File fileName)throws Exception{  
	    try{  
	    	if(!fileName.exists()){  
	    		fileName.createNewFile();  
	    	}  
	    }catch(Exception e){  
	    	e.printStackTrace();  
	    }  
	}
	
public static void addToTxt(String str, File file) throws IOException{
		
		FileWriter fileWriter = null;
		try {
			fileWriter = new FileWriter(file, true);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		BufferedWriter writer = new BufferedWriter(fileWriter);
		try {
			if (!isInFile(file, str)){
				writer.write(str + "\r\n");
				//System.out.println("writed");
				writer.close();
			}
			else {
				System.out.println("not write");
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		deleteEmptyLines(file);
	}
	
	public static boolean isInFile (File file, String str){
		boolean flag = false;
		try {
            Scanner in = new Scanner(file);
  
            while (in.hasNextLine()) {
                String newStr = in.nextLine();
                if (newStr.equals(str)){
                	return true;
                }
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
		return flag;
	}
	
	public static void deleteEmptyLines(File file) throws IOException{
		FileReader fileReader = null;
		BufferedWriter bufferWriter = null;
		List<String> tempList = new ArrayList<String> ();
		try {
			fileReader = new FileReader(file);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		BufferedReader read = new BufferedReader(fileReader);
        String line = "";
        try {
			while((line=read.readLine())!=null){
			    if(!line.equals("")){
			        tempList.add(line);
			    }
			    
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		read.close();
		try {
			bufferWriter =new BufferedWriter(new FileWriter(file));
		} catch (IOException e) {
			System.out.println(e);
			e.printStackTrace();
		}
		for(String strr : tempList){
			try {
				bufferWriter.write(strr + "\r\n");
			} catch (IOException e) {
				e.printStackTrace();
			} //然锟斤拷锟侥硷拷写锟斤拷
		}
		try {
			bufferWriter.flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
    }
}
