<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% 
	HttpSession s = request.getSession(); 
	List<String> re = new ArrayList<String> ();
	re = (List) s.getAttribute("results");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'test.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <%
    
   %>
  <body>
  <div id = "dv"></div>
  <script type="text/javascript">
	$(document).ready(function(){		
		$.setTop();
		
		//按钮的点击事件
		$("#fault_function_read").click(function(){
			//$.post("/ChildMath/page/getFaultFile.do?method=getFaultFile&currentPage=1&userID=");
			$("#result").value = re.get(0);
		});
		
	});
	function testp(i){   //按钮点击事件传递不同参数
		var data = i;
    	//alert(data);
    	//var list = document.getElementsByTagName("td");
    	window.location.href="/ChildMath/page/deleteAFault.do?method=deleteAFault&currentPage=1&userID=23&deletedNum="+data;
	}
	/*function read(obj, i){
		//alert(i);
		//alert(obj.parentNode.childNodes.length);
		//alert(document.getElementByTagName("td").length);
		var tb = document.getElementById("questions");
		alert(tb.childNodes.length);
	}*/
</script>

    totalPage is: <%=s.getAttribute("totalPage") %><br/>
    
    <%
    	int totalPage = (Integer) s.getAttribute("totalPage");
    	List<String> op = new ArrayList<String> ();
    	op = (List) s.getAttribute("operand");
     %>
     <%
     	for (int i=0 ;i< op.size();i ++){
     %>
     <div id="questions">
     		<%=op.get(i) %>=  <input type="text" class="fault_funtion"  name="result" id=<%=i %>></input>
     		<input type="button" class="result_function" id="result_function_read<%=i%>" value="显示答案" onclick="read(this,<%=i%>)"></input>
			<input type="button" class="fault_function" id="fault_function<%=i%>" value="删除错题" onclick="testp(<%=i%>)"></input>
			
	</div>
	<br>
      <%
      	}
       %>
  </body>
</html>
