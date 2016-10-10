<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>➕➖✖️➗我会算 首页</title>
	
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="this is my page">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    
    <!--<link rel="stylesheet" type="text/css" href="./styles.css">-->
    <script src="js/jquery-1.11.3.js"></script>
    <script src="js/jquery.mousewheel.js"></script>
    
    <script type="text/javascript">
    /*
      var nowIndex = 0;//当前页
      var pageArray = new Array(6); //存储六个页面的数组
      pageArray[0] = "#welcome";
      pageArray[1] = "#first";
      pageArray[2] = "#second";
      pageArray[3] = "#third";
      pageArray[4] = "#fourth";
      pageArray[5] = "#fifth";

      var textArray = new Array(10); //五个介绍页的文字
      textArray[0] = "#xq1_img1"
      textArray[1] = "#xq1_img2"
      textArray[2] = "#xq2_img1"
      textArray[3] = "#xq2_img2"
      textArray[4] = "#xq3_img1"
      textArray[5] = "#xq3_img2"
      textArray[6] = "#xq4_img1"
      textArray[7] = "#xq4_img2"
      textArray[8] = "#xq5_img1"
      textArray[9] = "#xq5_img2"

      var imgArray = new Array(6); //六个小点
      imgArray[0] = "#label0";
      imgArray[1] = "#label1";
      imgArray[2] = "#label2";
      imgArray[3] = "#label3";
      imgArray[4] = "#label4";
      imgArray[5] = "#label5";
      $.initImag = function(){
        for(var i=0;i<6;i++){
          $(imgArray[i]).attr("src","picResources/label2.png");
        }
      }
      

      var mousewheel = document.all?"mousewheel":"DOMMouseScroll";
    */
      $(document).ready(function(){
        $("#welcome").click(function(){
          location.href="page/welcome.html";
        });
      
        /*
        //展示第二行文字
        $.showText = function(index){
          $(textArray[index*2+1]).delay(1000).fadeIn(3000);
        };
        //展示第一行文字
        $.showAllText = function(index){
          $(textArray[index*2]).fadeIn(3000);
          //$.delay(3000);
          $.showText(index);
        };
        //隐藏第二行文字
        $.hideText = function(index){
          $(textArray[(index-1)*2+1]).delay(1000).fadeOut(1000);
        };
        //隐藏第一行文字
        $.hideAllText = function(index){
          $(textArray[(index-1)*2]).fadeOut(1000);
          $.hideText(index);
        };

        //向下按纽的点击事件
        $("a").click(function(){
          $(pageArray[nowIndex]).animate({top: "-" + $(".page").css("height")},"slow",$.showAllText(nowIndex));
          if(nowIndex !=0){
            $.hideAllText(nowIndex);
          }
          nowIndex++;
          if(nowIndex == 5){
            $("#next_button_box").css("visibility","hidden");
          }

          if(nowIndex != 0){//其他页显示小按纽
            $("#little_button").css("visibility","visible");
          }

          //更改圆点
          $.initImag();
          $(imgArray[nowIndex]).attr("src","picResources/label1.png");
        });

        //下一页
        $.nextPage = function(){
          if(nowIndex == 5){
            return;
          }
          $(pageArray[nowIndex]).animate({top:"-" + $(".page").css("height")},"slow",$.showAllText(nowIndex));
          if(nowIndex !=0){
            $.hideAllText(nowIndex);
          }
          nowIndex++;

          if(nowIndex == 5){
            $("#next_button_box").css("visibility","hidden");
          }

          if(nowIndex != 0){//其他页显示小按纽
            $("#little_button").css("visibility","visible");
          }

          //更改圆点
          $.initImag();
          $(imgArray[nowIndex]).attr("src","picResources/label1.png");
        }

        //上一页
        $.lastPage = function(){
          if(nowIndex == 5){
            $("#next_button_box").css("visibility","visible");
          }
          if(nowIndex == 0){
            //
          }else if(nowIndex == 1){
            $(pageArray[nowIndex-1]).animate({top:'0%'},"slow");
            $.hideAllText(nowIndex);
            nowIndex --;
          }else{
            $(pageArray[nowIndex-1]).animate({top:'0%'},"slow",$.showAllText(nowIndex-2));
            $.hideAllText(nowIndex);
            nowIndex --;
          }

          if(nowIndex == 0){ //滑到最顶，隐藏小按纽
            $("#little_button").css("visibility","hidden");
          }

          //更改圆点
          $.initImag();
          $(imgArray[nowIndex]).attr("src","picResources/label1.png");
        }
        */
        var totalDelta = 0;
        //鼠标滚动事件
        $("body").bind('mousewheel',function(event, delta) { 
          totalDelta = totalDelta + delta;   
          if(totalDelta > 5){
            $.lastPage();
            totalDelta = 0;
          }else if(totalDelta < -5){
            $.nextPage();
            totalDelta = 0;
          }
        });
        /*
        //保证下一页按纽在下面
        $("#next_button_box").css("margin-top",($(window).height() - 65)+"px");
        //保证圆点靠右剧中
        $("#label").css("left", $(window).width()-35);
        var top = $(window).height()-100;
        $("#label").css("top", top/2);

        $(window).resize(function () {          //当浏览器大小变化时
          //保证下一页按纽在下面
          $("#next_button_box").css("margin-top",($(window).height() - 65)+"px");

          //保证圆点靠右剧中
          $("#label").css("left", $(window).width()-35);
          top = $(window).height()-100;
          $("#label").css("top", top/2);
        })
      */
      });
      
    </script>
    <style type="text/css">
      /*所有页面
      .page{
        position: absolute;
        left: 0;
        top: 0;
        min-width:1200px; 
        min-height: 560px;
        width: 100%;
        height: 100%;
        z-index: 0;
        margin:0;
      }
      */
      /*首页*/
      #welcome{
        width: 90px;
        height: 50px;
        background-image: url(picResources/come_in.png);
        background-size: 100% 100%;
        float: right;
        margin-right: 240px;
        margin-top: 4px;
        cursor: pointer;
        /*
        z-index: 5;
        background-color: #eeeeee;
        background-image: url(picResources/first_page_back.png);
        */
      }
      /*
      #content0, #content1,#content2, #content3, #content4, #content5{
        height: 560px;
        width: 1200px;
        margin: 0 auto;
        margin-top: 30px;
      }
      #content0{
        background-image: url(picResources/welcome_back.jpg);
        background-size: 100% 100%;
      }
      #blackBoard{
        width: 650px;
        height: 250px;
        background-image: url(picResources/blackboard.png);
        background-size: 100% 100%;
        float: left;
        margin-left: 275px;
        margin-top: 65px;
      }
      #chalk{
        width: 250px;
        height:65px;
        background-image: url(picResources/chalk1.png);
        background-size: 100% 100%;
        float: left;
        margin-left: 200px;
        margin-top: 65px;
      }
      #chalk2{
        width: 200px;
        height:25px;
        background-image: url(picResources/chalk2.png);
        background-size: 100% 100%;
        float: left;
        margin-left: 225px;
        margin-top: 6px;
      }
      #children{
        width: 800px;
        height: 250px;
        background-image: url(picResources/children.png);
        background-size: 100% 100%;
        float: left;
        margin-left: 200px;
        margin-top: -30px;
      }
      #blackboard_button{
        width: 300px;
        height: 30px;
        float: left;
        margin-left: 175px;
        margin-top: 28px;
      }
      */
      .anniu{
        width: 135px;
        height: 25px;
        margin-left: 10px;
        outline: none;
        border: solid 2px;
        color: white;
        font-family: 黑体;
        font-size: 1em;
      }
      .anniu:hover{
        cursor: pointer;
      }
      #page{ 
        
        width: 100%;
        height: 1400px;
        background-size: 100% 100%;
        position: relative;
        margin: 0 auto;
        margin-top: 55px;
      }
      .index_page{
        z-index: 1;
        background-image:url(picResources/first_page0.jpg); 
        width: 100%;
        height: 1400px;
        background-size: 100% 100%;
        margin: 0 auto;
      }
      /*
      //第一个介绍页
      #first{
        z-index: 4;
        background-image: url(picResources/xiangqing-1-bg.png);
        background-size: 100% 100%;
      }
      #content1{
        
        background-image: url(picResources/xiangqing_1.png);
        background-size: 100% 100%;
      }
      #xq1_img1{
        width: 600px;
        margin-left: 10%;
        margin-top: 160px;
        display: none;
      }
      #xq1_img2{
        width: 600px;
        margin-left: 10%;
        margin-top: 25px;
        display: none;
      }
      //第二个介绍页
      #second{
        z-index: 3;
        background-image: url(picResources/xiangqing-2-bg.png);
        background-size: 100% 100%;
      }
      #content2{
        
        background-image: url(picResources/xiangqing_2.png);
        background-size: 100% 100%;
      }
      #xq2_img1{
        width: 600px;
        margin-left: 10%;
        margin-top: 160px;
        display: none;
      }
      #xq2_img2{
        width: 700px;
        margin-left: 10%;
        margin-top: 25px;
        display: none;
      }
      //第三个介绍页
      #third{
        z-index: 2;
        background-image: url(picResources/xiangqing-3-bg.png);
        background-size: 100% 100%;
      }
      #content3{
        
        background-image: url(picResources/xiangqing_3.png);
        background-size: 100% 100%;
      }
      #xq3_img1{
        width: 600px;
        margin-left: 10%;
        margin-top: 160px;
        display: none;
      }
      #xq3_img2{
        width:650px;
        margin-left: 10%;
        margin-top: 25px;
        display: none;
      }
      //第四个页面的介绍
      #fourth{
        z-index: 1;
        background-image: url(picResources/xiangqing-4-bg.png);
        background-size: 100% 100%;
      }
      #content4{
        
        background-image: url(picResources/xiangqing_4.png);
        background-size: 100% 100%;
      }
      #xq4_img1{
        width: 600px;
        margin-left: 10%;
        margin-top: 160px;
        display: none;
      }
      #xq4_img2{
        width: 650px;
        margin-left: 10%;
        margin-top: 25px;
        display: none;
      }
      //第五个介绍页
      #fifth{
        z-index: 0;
        background-image: url(picResources/xiangqing-5-bg.png);
        background-size: 100% 100%;
      }
      #content5{
        
        background-image: url(picResources/xiangqing_5.png);
        background-size: 100% 100%;
      }
      #xq5_img1{
        width: 600px;
        margin-left: 10%;
        margin-top: 160px;
        display: none;
      }
      #xq5_img2{
        width: 650px;
        margin-left: 10%;
        margin-top: 25px;
        display: none;
      }
      //向下按纽
      #next_button_box{
        width: 100%;
        height: 65px;
        position: fixed;
        margin:0 auto;
        margin-top: 50%;
        z-index: 6;
        text-align: center;
        line-height: 65px;
      }
      #next_button_img{
        border: none;
        width: 40px;
        height: 25px;
      }
      */
      /*头部*/
      #header{
        width: 100%;
        height: 55px;
        position: fixed;
        z-index: 1;
        top: 0;
        left: 0;
        text-align: center;
        background-color: #eeeeee;
      }
      #logo{
        width: 40px;
        height: 40px;
        float: left;
        background-image: url(picResources/logo.png);
        background-size: 100% 100%;
        margin-top: 10px;
        margin-left: 200px;
      }
      /*
      .xiao{
        width: 80px;
        height: 20px;
        margin-top: 10px;
        outline: none;
        border-radius: 5px;
        font-family: 黑体;
        font-size: 1em;
      }
      .xiao:hover{
        cursor: pointer;
      }
      //小圆点
      #label{
        position: fixed;
        width: 14px;
        height: 154px;
        z-index: 6;
      }
      .point{
        display: block;
        margin-top: 10px;
        width: 14px;
        height: 14px;
      }
      */
    </style>
  </head>
  
  <body>
    <div id="header">
        <div id="logo"></div>
        <div id="welcome"></div>
    </div>
    <div id="page">
      <div class="index_page">
      </div>
    </div>
    <!--
    <div id="welcome" class="page">
      <div id="content0">
        <div id="blackBoard">
          <div id="chalk"></div>
          <div id="chalk2"></div>
          <div id="blackboard_button">
            <input type="button" id="login_button" class="anniu" value="登录"></input>
            <input type="button" id="regist_button" class="anniu" value="立即注册"></input>
          </div>
        </div>
        <div id="children"></div>
      </div>
    </div>
    <div id="first" class="page">
      <div id="content1">
        <img id="xq1_img1" src="picResources/xiangqing_1_text1.png">
        <img id="xq1_img2" src="picResources/xiangqing_1_text2.png">
      </div>
    </div>
    <div id="second" class="page">
      <div id="content2">
        <img id="xq2_img1" src="picResources/xiangqing_2_text1.png">
        <img id="xq2_img2" src="picResources/xiangqing_2_text2.png">
      </div>
    </div>
    <div id="third" class="page">
      <div id="content3">
        <img id="xq3_img1" src="picResources/xiangqing_3_text1.png">
        <img id="xq3_img2" src="picResources/xiangqing_3_text2.png">
      </div>
    </div>
    <div id="fourth" class="page">
      <div id="content4">
        <img id="xq4_img1" src="picResources/xiangqing_4_text1.png">
        <img id="xq4_img2" src="picResources/xiangqing_4_text2.png">
      </div>
    </div>
    <div id="fifth" class="page">
      <div id="content5">
        <img id="xq5_img1" src="picResources/xiangqing_5_text2.png">
        <img id="xq5_img2" src="picResources/xiangqing_5_text1.png">
      </div>
    </div>
    -->
  </body>
</html>

