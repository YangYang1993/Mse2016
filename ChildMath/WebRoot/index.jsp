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
        margin-right: 90px;
        margin-top: 60px;
        cursor: pointer;
      }
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
        height: 2000px;
        background-size: 100% 100%;
        margin: 0 auto;
      }
      .index_page{
        z-index: 1;
        background-image:url(picResources/first_page0.png); 
        width: 100%;
        height: 2000px;
        background-size: 100% 100%;
        margin: 0 auto;
      }
      #logo{
        width: 40px;
        height: 40px;
        float: left;
        background-image: url(picResources/logo.png);
        background-size: 100% 100%;
        margin-top: 30px;
        margin-left: 200px;
      }
      .logo_font{
        width: 120px;
        height: 40px;
        float: left;
        background-image: url(picResources/logo_font.png);
        background-size: 100% 100%;
        margin-top: 40px;
        margin-left: 10px;
      }
      /*加号*/
      #plus{
        width: 40px;
        height: 40px;
        float: left;
        background-image: url(picResources/plus.png);
        background-size: 100% 100%;
        margin-top: 315px;
        margin-left: 5px;
      }
      /*减号*/
      #subtract{
        width: 40px;
        height: 10px;
        float: left;
        background-image: url(picResources/subtract.png);
        background-size: 100% 100%;
        margin-top: 330px;
        margin-left: 30px;
      }
      /*乘号*/
      #multiply{
        width: 38px;
        height: 38px;
        float: left;
        background-image: url(picResources/multiply.png);
        background-size: 100% 100%;
        margin-top: 315px;
        margin-left: 25px;
      }
      /*除号*/
      #divide{
        width: 40px;
        height: 40px;
        float: left;
        background-image: url(picResources/divide.png);
        background-size: 100% 100%;
        margin-top: 315px;
        margin-left: 25px;
      }
      #main_logo_font{
        width: 130px;
        height: 45px;
        float: left;
        background-image: url(picResources/main_logo_font.png);
        background-size: 100% 100%;
        margin-top: 315px;
        margin-left: 40px;
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
    <div>
        <div id="logo"></div>
        <div class="logo_font"></div>
        <div id="welcome"></div>
    </div>
    <div id="page">
      <div class="index_page">
        <div id="plus"></div>
        <div id="subtract"></div>
        <div id="multiply"></div>
        <div id="divide"></div>
        <div id="main_logo_font"></div>
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

