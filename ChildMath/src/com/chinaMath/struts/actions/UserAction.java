package com.chinaMath.struts.actions;

import com.chinaMath.hibernate.beans.User;
import com.chinaMath.hibernate.dao.UserDAO;
import com.chinaMath.struts.forms.UserForm;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.crypto.password.StandardPasswordEncoder;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class UserAction extends DispatchAction{
	
	UserDAO userDAO;
	JavaMailSender mailSender;
	public UserDAO getUserDAO() {
		return userDAO;
	}
	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	public JavaMailSender getMailSender() {
		return mailSender;
	}
	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}
	
	public ActionForward insertUser(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response)throws Exception{
		UserForm userForm = (UserForm)form;
		User user = new User();
		user.setUserName(userForm.getUserName());
		user.setPassword(userForm.getPassword());
		user.setEmail(userForm.getEmail());
		user.setGrade(userForm.getGrade());
		user.setSex(0);
		userDAO.insertUser(user);
		ActionForward forward = new ActionForward();
		forward = mapping.findForward("insert");
		return forward;
	}
	
	public ActionForward getUserList(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response)throws Exception{
		HttpSession session = request.getSession();
		UserForm userForm = (UserForm)form;
		User user1 = userDAO.getUserByEmail(userForm.getEmail());
		User user2 = userDAO.getUserByUserName(userForm.getEmail());
		ActionForward forward = new ActionForward();
		forward = mapping.findForward("Fail");
		if(user1!=null){
			if(user1.getPassword().equals(userForm.getPassword())){
				forward = mapping.findForward("Success");
				session.setAttribute("user", user1);
				
				return forward;
			}
		}
		if(user2!=null){
			if(user2.getPassword().equals(userForm.getPassword())){
				forward = mapping.findForward("Success");
				session.setAttribute("user", user2);
				
				return forward;
			}
		}
		return forward;
	}
	public ActionForward checkUsername(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward = null;
		String username = new String(request.getParameter("username").getBytes("ISO-8859-1"),"UTF-8");
		User user = userDAO.getUserByUserName(username);
		if(!username.equals("")&&user==null){
			response.getWriter().write("0");
		}else{
			response.getWriter().write("1");
		}
		return forward;
	}
	
	//��������
	public ActionForward checkEmail(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward = null;
		
		String email = new String(request.getParameter("email").getBytes("ISO-8859-1"),"UTF-8");
		User user = userDAO.getUserByEmail(email);
		if(user==null&&!email.equals("")){
			response.getWriter().write("0");
		}else{
			response.getWriter().write("1");
		}
		return forward;
	}
	public ActionForward checkPassword(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward = null;
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		String password = new String(request.getParameter("password").getBytes("ISO-8859-1"),"UTF-8");
		if(user.getPassword().equals(password)){
			response.getWriter().write("0");
		}else{
			response.getWriter().write("1");
		}
		return forward;
	}
	public ActionForward changeInfo(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response)throws Exception{
       
		ActionForward forward = mapping.findForward("Fail");
		HttpSession session = request.getSession();
		if(!session.isNew()){
			User user = (User)session.getAttribute("user");
			UserForm userForm = (UserForm)form;
			user.setUserName(userForm.getUserName());
			user.setGrade(userForm.getGrade());
			user.setSex(userForm.getSex());
			if(!userForm.getPassword().equals("")){
				user.setPassword(userForm.getPassword());
			}
			userDAO.updateUser(user);
			session.setAttribute("user", user);
			forward = mapping.findForward("Success");
			
		}
		return forward;
	}
	
	public static String encryptString(String source)
	{
		String SITE_WIDE_SECRET = "TJU";
	    PasswordEncoder encoder = new StandardPasswordEncoder(
            SITE_WIDE_SECRET);
	    return encoder.encode(source);
	}	
	
	public static boolean testMatch(String str1, String str2)
	{
		String SITE_WIDE_SECRET = "TJU";
	    PasswordEncoder encoder = new StandardPasswordEncoder(
            SITE_WIDE_SECRET);
	    return encoder.matches(str1, str2);
	}	
	
	
	public static char changeChar(char charIn)
	{
		char charOut = 'a';
		int difference = 5;
		char[] charArray = {'1','2','3','4','5','6','7','8','9','0',
		                  'a','A','b','B','c','C','d','D','e','E','f','F','g','G',
							'h','H','i','I','j','J','k','K','l','L','m','M','n','N',
							'o','O','p','P','q','Q','r','R','s','S','t','T',
							'u','U','v','V','w','W','x','X','y','Y','z','Z','@','.'};
		for(int i = 0; i < charArray.length; i++)
		{
			if(charIn == charArray[i])
			{
				charOut = charArray[(i + difference) % charArray.length];
			}
		}
		
		return charOut;
	}
	
	public static char revertChar(char charIn)  //javaʹ��unicode����   ���� byte 8λ   char 16λ   
	{
		char charOut = 'a';
		int difference = 5;
		char[] charArray = {'1','2','3','4','5','6','7','8','9','0',
		                  'a','A','b','B','c','C','d','D','e','E','f','F','g','G',
							'h','H','i','I','j','J','k','K','l','L','m','M','n','N',
							'o','O','p','P','q','Q','r','R','s','S','t','T',
							'u','U','v','V','w','W','x','X','y','Y','z','Z','@','.'};
		
		for(int i = 0; i < charArray.length; i++)
		{
			if(charIn == charArray[i])
			{
				charOut = charArray[(i - difference +  charArray.length) % charArray.length];
			}
		}
		
		
		return charOut;
	}
	
	public static String MyEncryptString(String source)
	{
		String result = "";
		StringBuilder stringBuilder =  new StringBuilder(source);
		for(int i = 0; i < stringBuilder.length(); i++ )
		{
			stringBuilder.setCharAt(i, changeChar(stringBuilder.charAt(i)));
		}
		result = stringBuilder.toString();
		return result;
	}
	
	public static String MyDecryptString(String source)
	{
		String result = "";
		StringBuilder stringBuilder =  new StringBuilder(source);
		for(int i = 0; i < stringBuilder.length(); i++ )
		{
			stringBuilder.setCharAt(i, revertChar(stringBuilder.charAt(i)));
		}
		result = stringBuilder.toString();
		return result;
	}
	
	
	public ActionForward findPwd(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ActionForward forward = mapping.findForward("Fail");
		
			String email = request.getParameter("email");
			User user = userDAO.getUserByEmail(email);
			String password=null;
			if(user != null)
			{
			    password = user.getPassword();
			}

			password = encryptString(password); 
			
			MimeMessage mailMessage = mailSender.createMimeMessage();
	        try {
	            String content = email + "ABCDEFGHIJKLMNOPQRSTUVWXYZ" + password ;
	            content = MyEncryptString(content);

	            MimeMessageHelper messageHelper = new MimeMessageHelper(mailMessage,true,"utf-8");
	             messageHelper.setTo(email);
	              messageHelper.setFrom("18722066025@163.com");
	            messageHelper.setSubject("Use this to get your password back");
	            mailMessage.setContent("<a href=\"http://localhost:8080/ChildMath/page/find.do?method=changePassword1&target="
	       +  content + "\"/>click this url to get your password back </a>", "text/html");   //  /login?method=b&target=d
	            mailSender.send(mailMessage);
	             } catch (Exception e) {	
	                e.printStackTrace();
	            }

		
		return forward;
	}
	
	
	public ActionForward changePassword1(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ActionForward forward = mapping.findForward("changePassword1");
		
			
		String target = request.getParameter("target");
		target = MyDecryptString(target);
		String email = target.split("ABCDEFGHIJKLMNOPQRSTUVWXYZ")[0];
		String passwordGot = target.split("ABCDEFGHIJKLMNOPQRSTUVWXYZ")[1];
		
		User user = userDAO.getUserByEmail(email);
		String password=null;
		if(user != null)
		{
		    password = user.getPassword();
		}
		
		//System.out.println(testMatch(password,passwordGot));
		
		
		if(testMatch(password,passwordGot))  // simple encrypted
		{
			request.getSession().setAttribute("userToChangePassword",email);
		}
		else
		{
			// error : no reaction
		}
		return forward;		
	}
	
	
	public ActionForward changePassword2(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		//System.out.println("somethingToPrint first " );
		
		
		ActionForward forward = mapping.findForward("Fail");
		
		String formPassword = ((UserForm)form).getPassword();	
		//System.out.println("somethingToPrint "  + formPassword);
		
		String email = request.getSession().getAttribute("userToChangePassword").toString();
		User user = userDAO.getUserByEmail(email);
		if(user != null)
		{
				user.setPassword(formPassword);
				userDAO.updateUser(user);
		}	
		return forward;
		
	}

}
