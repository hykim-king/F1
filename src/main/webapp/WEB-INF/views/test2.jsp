<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="CP" value="${pageContext.request.contextPath }"/>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS -->

<link  href="../resources/css/default.css" rel="stylesheet" type="text/css">
<link  href="../resources/css/bootstrap/bootstrap.min.css" rel="stylesheet"  crossorigin="anonymous">
<script src="../resources/js/bootstrap/bootstrap.bundle.min.js"  crossorigin="anonymous"></script>
<script src="../resources/js/jquery-3.7.0.js"></script>
<title>test</title>
</head>
<body>
	<div style="width: 900px; margin: auto; margin-top:50px; display: flex; height: 300px"  >
	    <div id="no1" style="width: 450px; height: 300px; background-color: red;">
	       <input value="안녕못해요" ><p/>
	       <button type="button" id="change" name="change">화면 전환</button>
	    </div>
	    <div id="no2" style="width: 450px; height: 300px; background-color: green; display: none">
           <input value="안녕하세요" ><p/>
           <button type="button" id="change" name="change">화면 전환</button>
        </div>   
	    
	    <div style="width: 450px; overflow-y: scroll; height: 300px; background-color: blue;" >  
	       <input value="녕안하세요"><p/>
	       <div>
	           <img alt="faile" src="../resources/img/wbx.PNG" height="400" width="80">
	       </div><p/>
	       <input style="margin-top:50px" value="dfsgsdfgdfhdfhfghf">
	    </div><p/>
	    
	</div>
	
	<div class="container">
	   <label for ="test">
           <img alt="faile" src="../resources/img/wbx.PNG" height="50" width="50">
       </label>
	   <input type="text" id = "test" name = "test" >
	</div>
	<div>
		<label for="lang">Language</label>
		  <select name="languages" id="lang">
		    <option value="javascript">JavaScript</option>
		    <option value="php">PHP</option>
		    <option value="java">Java</option>
		    <option value="golang">Golang</option>
		    <option value="python">Python</option>
		    <option value="c#">C#</option>
		    <option value="C++">C++</option>
		    <option value="erlang">Erlang</option>
			</div>
    </body>
<script>
jQuery(document).ready(function(){
	   
    var select = $("select#data");
   
    select.change(function(){
        var select_name = $(this).children("option:selected").text();
        $(this).siblings("label").text(select_name);
    });
});
</script>
<script>
	$(document).ready(function(){ 
	    console.log("$document.ready");
	    $(document).on("click","#change",function(){
		      console.log("change");
		      
		      if ($('#no1').css('display')=='block'){
                  $('#no2').css('display','block')
                  $('#no1').css('display','none')
              }else{
            	  $('#no2').css('display','none')
                  $('#no1').css('display','block')
              }
		 }); //change
	}); //ready
</script>
</html>