<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style type="text/css">
	#video_body{
		width: 700px;
		height: 500px;
		margin: 0 auto;
	}
	video{
		width: 700px;
		height: 500px;
		margin: 0 auto;
	}
</style>
<script type="text/javascript">
	$(document).ready(function(){		
		$.setTop();
	});
</script>
<div id="video_body">
	<video controls>
	  <source src="../video/cctv.mp4" type="video/mp4">
	  <!--<source src="movie.ogg" type="video/ogg">
	  <source src="movie.webm" type="video/webm">-->
	  <object data="../video/cctv.mp4" width="700" height="500">
	    <!--<embed src="movie.swf" width="320" height="240">-->
	  </object> 
	</video>
</div>