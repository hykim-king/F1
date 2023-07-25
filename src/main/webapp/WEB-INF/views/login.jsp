<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="CP" value="${pageContext.request.contextPath }"/>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<!-- CSS -->
<link  href="${CP}/resources/css/default.css" rel="stylesheet">
<link  href="${CP}/resources/css/bootstrap/bootstrap.min.css" rel="stylesheet"  crossorigin="anonymous">
<script src="${CP}/resources/js/bootstrap/bootstrap.bundle.min.js"  crossorigin="anonymous"></script>
<script src="${CP}/resources/js/jquery-3.7.0.js"></script>


<title>메인페이지?</title>
</head>
<body>
    <div class = "roadscannercontainer">  
        <div>
           <table>
		       <tr>
		          <td><input class="idpw" type="text" id="id" name="id" placeholder="아이디"></td>
		          <td rowspan="2"><button type="button" id="doLogin" name="doLogin" style="height: 52px;">로그인</button></td>
		       </tr>
		       <tr>
		          <td><input class="idpw" type="password" id="pw" name= "pw" placeholder="비밀번호"></td>
		       </tr>
		       <tr>
		          <td><a href="${CP}/findIdPw">회원정보 찾기</a></td>
		       </tr>
		   </table>
	    </div>
    </div>

</body>
<script>
  $(document).ready(function(){ //모든 화면이 다 로딩이 되면 실행하는 영역
    console.log("$document.ready");
  
    //jquery 이벤트 감지 (#은 id를 감지한는것이다.)
    $("#doLogin").on("click",function(){
      console.log("doLogin");
      
      if(confirm('로그인 하시겠습니까?')==false) return;
      console.log("userId : "+$("#id").val());
      console.log("passwd : "+$("#pw").val());
        
      if(""==$("#id").val() || 0==$("#id").val().length){
          alert("아이디를 입력하세요");  // javascript 메시지 다이얼 로그
          $("#id").focus();          // jquery로 포커스를 이동시킨다.
          return;
      }
      if(""==$("#pd").val() || 0==$("#pw").val().length){
        alert("비밀번호를 입력하세요");  // javascript 메시지 다이얼 로그
        $("#pw").focus();
        return;
      }
      
      $.ajax({
            type: "POST",
            url:"${CP}/login",
            /* asyn:"true", */
            dataType:"html",
            data:{
              id: $("#id").val(),
              pw: $("#pw").val()
            },
            success:function(data){//통신 성공
                //console.log("success data:"+data);
                // JSON.parse() 메서드는 JSON 문자열의 구문을 분석하고, 그 결과에서 JavaScript 값이나 객체를 생성합니다.
                let paredJSON = JSON.parse(data);
                console.log("paredJSON.msgId:"+paredJSON.msgId);
                
                if("1"==paredJSON.msgId || "10"==paredJSON.msgId){
                  alert(paredJSON.msgContents);  // javascript 메시지 다이얼 로그
                  $("#userId").focus();          // jquery로 포커스를 이동시킨다.
                  return;
                }
                if("2"==paredJSON.msgId || "20"==paredJSON.msgId){
                  alert(paredJSON.msgContents);
                  $("#passwd").focus();
                  return;
                }
                if("30"==paredJSON.msgId){//로그인 성공
                  alert(paredJSON.msgContents);
                  
                  //javascript 내장객체 : url
                  window.location.href="#";
                }
              },
              error:function(data){//실패시 처리
                console.log("error:"+data);
              }
          });
    });    
  });
</script>
</html>