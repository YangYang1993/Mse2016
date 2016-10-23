<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import = "com.chinaMath.hibernate.beans.User" %>
<%@page import="java.io.BufferedReader"%>  
<%@page import="java.io.FileReader"%>  
<%@page import="java.io.File"%>  

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
	#show_fault{
		font-size: 1.2em;
		width: 600px;
		margin: 20px auto;
		/*
		height:	410px;
		*/
	}
	#put_out{
		width: 70px;
		height: 25px;
		position: relative;
		left: 700px;
		color: #ffffff;
		font-family: 黑体;
		outline: none;
		background-color: #48b937;
		border-radius: 10px;
		border: solid 1px #416c4e;
	}
</style>
<script src="../js/createMathMethods.js"></script>
<script src="../js/challenge.js"></script>
<script type="text/javascript"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
	
	<%  
 		User user = null;
		if(!session.isNew()){
			user = (User)session.getAttribute("user");
		}
		int userId = user.getUserID();

        File file = new File("/Users/yangyang/Mse2016/ChildMath/WebRoot/faultFile/fault-" + userId +".txt");  
        FileReader fr = new FileReader(file);  //字符输入流  
        BufferedReader br = new BufferedReader(fr);  //使文件可按行读取并具有缓冲功能  
        StringBuffer strB = new StringBuffer();   //strB用来存储jsp.txt文件里的内容  
        String str = br.readLine();  
        while(str!=null){       	
            strB.append(str).append("<br>");   //将读取的内容放入strB  
            str = br.readLine();  
        }  
        br.close();    //关闭输入流  
    %>  
    <div >
    	<!--
    	<a href="../faultFile/fault-" + userId + ".txt"><button id="put_out">导出错题</button></a>
		-->
    	<div id="show_fault"> 
        	<%=strB%>
        </div> 
    </div>  
</body>
</html>