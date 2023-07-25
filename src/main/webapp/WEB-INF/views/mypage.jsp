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
  <h2>${user.id}의 마이페이지</h2>
  <form>
    <div>
      <label>아이디</label>
      <input type="text" readonly="readonly" value="${user.id}">
    </div>
    <div>
      <label>비밀번호 수정</label>
      <input type="password" placeholder="문자, 숫자, 특수문자 포함 8~20글자)" >
    </div>
    <div>
      <label>비밀번호 확인</label>
      <input type="password">
    </div>
    <div>
      <label>이메일</label>
      <input type="text" readonly="readonly" value="${user.email}">
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
$(document).ready(function(){  //모든 화면이 다 로딩이 되면 실행하는 영역
   console.log("document ready");

  $("#cancel").on("click", function(){
	  
    alert("로그인페이지로 이동합니다");
    window.location.href="${CP}/login";
    
  });   // $("#cancel").on("click"
  
});   //모든 화면이 다 로딩이 되면 실행하는 영역
</script>
</html>