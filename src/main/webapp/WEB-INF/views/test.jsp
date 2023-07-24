<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS -->
<link  href="${CP}/resources/css/default.css" rel="stylesheet">
<link  href="${CP}/resources/css/bootstrap/bootstrap.min.css" rel="stylesheet"  crossorigin="anonymous">
<script src="${CP}/resources/js/bootstrap/bootstrap.bundle.min.js"  crossorigin="anonymous"></script>
<script src="${CP}/resources/js/jquery-3.7.0.js"></script>
<title>test</title>
</head>
<body>
	<div style="width: 800px; margin: auto; margin-top:50px; display: flex; height: 300px"  >
	    <div style="width: 400px; height: 300px; background-color: red;">
	       <input value="fgdkfjgdf;kgj;lsdkag;lkf;lgklfdh" ><p/>
	       <button type="button" id="change" name="change">화면 전환</button>
	    </div>
	    
	    <div style="width: 400px; overflow-y: scroll; height: 300px; background-color: blue;" >
	       <input value="fgdkfjgdf;kgj;lsdkag;lkf;lgklfdh"><p/>
	       <input style="margin-top: 900px" value="dfsgsdfgdfhdfhfghf">
	    </div>
	</div>
</body>
<script>
$(document).ready(function(){ 
    console.log("$document.ready");
    $(document).on("click","#change",function(){
	      console.log("change");
	 }); //change
});

</script>
</html>