<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import = "com.chinaMath.hibernate.beans.User" %>
<%@ page import= "java.util.List"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
 <% 
List<Integer> listObja = (List<Integer>)request.getAttribute("num");
List<Integer> listObjb = (List<Integer>)request.getAttribute("error");
List<Integer> listObjc = (List<Integer>)request.getAttribute("min");
System.out.print(listObja);
%>
  <head>
<style type="text/css">
	#honor_body{
		clear: both;
		overflow: auto;
		width: 800px;
		padding-top: 80px;
	}
	.honor_temp{
		width: 800px;
		height: 200px;
		float: center;
		margin-bottom: 10px;
		background-color: #00fff0;
	}
	#honor_model{
		clear: both;
		overflow: auto;
		width: 800px;
		padding-top: 20px;
	}
</style>
    
    <script src="../js/jquery-1.11.3.js"></script>
     <script type="text/javascript" src="http://cdn.hcharts.cn/highcharts/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/data.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
   <script>
	$(function () {
    $('#container').highcharts({
        title: {
            text: '每月的做题数量和错题数量',
            x: -20 //center
        },
        
        xAxis: {
            categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
        },
        yAxis: {
            title: {
                text: '题数(道)'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        tooltip: {
            valueSuffix: '道'
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
        series: [{
            name: '总题数',
            data: <%=listObja %>
        }, {
            name: '错题数',
            data: <%=listObjb %>
        }]
    });
     $('#container1').highcharts({
        chart: {
            type: 'column'
        },
        title: {
            text: 'Monthly Average Rainfall'
        },
        subtitle: {
            text: 'Source: WorldClimate.com'
        },
        xAxis: {
            categories: [
                'Jan',
                'Feb',
                'Mar',
                'Apr',
                'May',
                'Jun',
                'Jul',
                'Aug',
                'Sep',
                'Oct',
                'Nov',
                'Dec'
            ]
        },
        yAxis: {
            min: 0,
            title: {
                text: 'Rainfall (mm)'
            }
        },
        tooltip: {
            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                '<td style="padding:0"><b>{point.y:.1f} mm</b></td></tr>',
            footerFormat: '</table>',
            shared: true,
            useHTML: true
        },
        plotOptions: {
            column: {
                pointPadding: 0.2,
                borderWidth: 0
            }
        },
        series: [{
            name: 'Tokyo',
            data: <%=listObjc %>
        }]
    });
});				

   </script>
</head>
	
<body>
<div id="honor_model">
<logic:present name="honour">
       <logic:iterate id="honour" name="honour">
          <logic:equal name="honour" property="honourType" value="1">
                             <img src="../picResources/honour1.png">
          </logic:equal>
          <logic:equal name="honour" property="honourType" value="2">
                              <img src="../picResources/honour2.png">
          </logic:equal>
          <logic:equal name="honour" property="honourType" value="3">
                              <img src="../picResources/honour3.png">
          </logic:equal>
          <logic:equal name="honour" property="honourType" value="4">
                              <img src="../picResources/honour4.png">
          </logic:equal>
          <logic:equal name="honour" property="honourType" value="5">
                              <img src="../picResources/honour5.png">
          </logic:equal>
          </logic:iterate>
          </logic:present>
</div>
 <div>      
<div id="container" style="width: 500px; height: 300px; margin: 0 auto"></div>
<div id="container1" style="width: 500px; height: 300px; margin: 0 auto"></div>
</div>
</div>
</body>
</html>
