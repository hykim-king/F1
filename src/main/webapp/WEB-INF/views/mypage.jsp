<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="CP" value="${pageContext.request.contextPath}"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- CSS -->
<link  href="${CP}/resources/css/bootstrap/bootstrap.min.css" rel="stylesheet"  crossorigin="anonymous">
<script src="${CP}/resources/js/bootstrap/bootstrap.bundle.min.js"  crossorigin="anonymous"></script>
<script src="${CP}/resources/js/jquery-3.7.0.js"></script>
<title>RoadScanner mypage test</title>
</head>
<body>
  <h2>${user.uid}의 마이페이지</h2>
  <form>
    <div>
      <label>아이디</label>

      <input type="text" readonly="readonly" value="${user.uid}">

      <input type="text" id="uid" readonly="readonly" value="${user.uid}">

    </div>
    <div>
      <label>비밀번호 수정</label>
      <input type="password" id="upassword" placeholder="문자, 숫자, 특수문자 포함 8~20글자)" >
    </div>
    <div>
      <label>비밀번호 확인</label><br/>
      <input type="password" id="upassword2" placeholder="비밀번호 재입력" onchange="check_pw()"><br/>
      <label id="pw_check"></label>
    </div>
    <div>
      <label>이메일</label>

      <input type="text" readonly="readonly" value="${user.uemail}">

      <input type="text" id="uemail" readonly="readonly" value="${user.uemail}">

    </div>
  </form>
  <form>
    <div>
      <input type="button" id="update" value="수정">
      <input type="button" id="cancel" value="취소">
    </div>
  </form>
  <div>
      <input type="button" id="myQnAboard" value="내 QnA보기">
  </div>
  <div>
      <input type="button" id="withdraw" value="탈퇴">
  </div>
</body>
<script>
function check_pw() {
    var pw = document.getElementById('upassword').value;
    var num = pw.search(/[0-9]/g);
    var eng = pw.search(/[a-z]/ig);
    var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

    if(pw.length<8 || pw.length>20) {
       window.alert('비밀번호는 8글자 이상, 20글자 이하만 이용 가능합니다.');
       document.getElementById('upassword').value='';
    } else if(pw.search(/\s/) != -1) {
       window.alert('비밀번호는 공백 없이 이용 가능합니다');
       document.getElementById('upassword').value='';
    } else if(num < 0 || eng < 0 || spe < 0) {
       window.alert('영문, 숫자, 특수문자를 최소 1글자 이상씩 사용하여 입력해주세요');
       document.getElementById('upassword').value='';
    }           
    
    if(document.getElementById('upassword').value !='' && document.getElementById('upassword2').value!='') {
      
        if(document.getElementById('upassword').value == document.getElementById('upassword2').value) {
            document.getElementById('pw_check').innerHTML='비밀번호가 일치합니다.'
            document.getElementById('pw_check').style.color='blue';
        } else {
            document.getElementById('pw_check').innerHTML='비밀번호가 일치하지 않습니다.';
            document.getElementById('pw_check').style.color='red';
            document.getElementById('upassword').value='';
            document.getElementById('upassword2').value='';
        }
        
    }
    
}   // check_pw end

$(document).ready(function(){  //모든 화면이 다 로딩이 되면 실행하는 영역
   console.log("document ready");
   
   $("#withdraw").on("click", function(){
	      
	    alert("탈퇴페이지 이동");
	    window.location.href="${CP}/withdraw";
	    
	  });   // $("#withdraw") click

  $("#cancel").on("click", function(){
	  
    alert("로그인페이지로 이동합니다");
    window.location.href="${CP}/login";
    
  });   // $("#cancel") click
  
  $("#update").on("click", function(){
	  
	  $.ajax({
	        type: "POST",
	        url:"${CP}/update",
	        asyn:"true",
	        dataType:"html",
	        data:{
	        	uid: $("#uid").val(),
	        	upassword: $("#upassword").val(),
	        	uemail: $("#uemail").val()
	        },
	        success:function(data){//통신 성공
	        	  let parsedJSON = JSON.parse(data);
	        	  
	        	  if("10" == parsedJSON.msgId) {
	        		  alert(parsedJSON.msgContents);
	        		  window.location.href="${CP}/login";
	        	  }
	        	  
	        	  if("20" == parsedJSON.msgId) {
                  alert(parsedJSON.msgContents);
                  return;
	             }
	        	  
	          },
	          error:function(data){//실패시 처리
	            console.log("error:"+data);
	          }
	      });  // ajax end
	  
  });   // $("#update") click
  
});   //모든 화면이 다 로딩이 되면 실행하는 영역
</script>
</html>