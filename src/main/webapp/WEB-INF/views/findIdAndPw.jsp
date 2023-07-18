<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="ko">
  <head>                 
	<meta charset="UTF-8">    
	<meta name="author"  content="hbi"> 
	<link  href="${path}/resources/css/bootstrap/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<script src="${path}/resources/js/bootstrap/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  <script src="${path}/resources/js/jquery-3.7.0.js"></script>
	<script>
	$(document).ready(function(){ //모든 화면이 다 로딩이 되면 실행하는 영역
	    $("#findId").on("click",function(){	
	      console.log("name  : "+$("#name").val());
	      console.log("email : "+$("#email").val());
	        
          if(""==$("#name").val() || 0==$("#name").val().length){
              alert("이름을 입력하세요");  // javascript 메시지 다이얼 로그
              $("#name").focus();          // jquery로 포커스를 이동시킨다.
              return;
            }
	      
          if(""==$("#email").val() || 0==$("#email").val().length){
              alert("이메일을 입력하세요");  // javascript 메시지 다이얼 로그
              $("#email").focus();
              return;
            }
	      
	      $.ajax({
	            type: "POST",
              url:"${path}/findId.do",
	            /* asyn:"true", */
	            dataType:"html",
	            data:{
                    name: $("#name").val(),
                    email: $("#email").val()
	            },
	            success:function(data){//통신 성공
	                //console.log("success data:"+data);
	                // JSON.parse() 메서드는 JSON 문자열의 구문을 분석하고, 그 결과에서 JavaScript 값이나 객체를 생성합니다.
	                let paredJSON = JSON.parse(data);
	                console.log("paredJSON.msgId:"+paredJSON.msgId);
	                
	                if("1"==paredJSON.msgId || "10"==paredJSON.msgId){
	                  alert(paredJSON.msgContents);  // javascript 메시지 다이얼 로그
	                  return;
	                }
	                if("30"==paredJSON.msgId){//로그인 성공
	                  alert(paredJSON.msgContents);
	                }
	              },
	              error:function(data){//실패시 처리
	                console.log("error:"+data);
	              }
	        }); //  $.ajax End --------------------------     
	      
	      
	    }); // $("#findId").on("click") End --------------------------	
        
        $("#findPw").on("click",function(){  
            console.log("userId : "+$("#userId").val());
            console.log("name  : "+$("#name2").val());
            console.log("email : "+$("#email2").val());

            if(""==$("#userId").val() || 0==$("#userId").val().length){
              alert("아이디를 입력하세요");  
              $("#userId").focus();      
              return;
            }
            if(""==$("#name2").val() || 0==$("#name2").val().length){
              alert("이름을 입력하세요");  
              $("#name2").focus();      
              return;
            }
            if(""==$("#email2").val() || 0==$("#email2").val().length){
              alert("이메일을 입력하세요");  
              $("#email2").focus();
              return;
            }
            $.ajax({
                  type: "POST",
                  url:"${path}/findPw.do",
                  /* asyn:"true", */
                  dataType:"html",
                  data:{
                    id   : $("#userId").val(),
                    name : $("#name2").val(),
                    email: $("#email2").val()
                  },
                  success:function(data){//통신 성공
                      //console.log("success data:"+data);
                      // JSON.parse() 메서드는 JSON 문자열의 구문을 분석하고, 그 결과에서 JavaScript 값이나 객체를 생성합니다.
                      let paredJSON = JSON.parse(data);
                      console.log("paredJSON.msgId:"+paredJSON.msgId);
                      
                      if("1"==paredJSON.msgId || "10"==paredJSON.msgId){
                        alert(paredJSON.msgContents);  
                        return;
                      }
                      if("30"==paredJSON.msgId){//로그인 성공
                        alert(paredJSON.msgContents);
                        
                        window.location.href="${path}/main.do";
                      }
                    },
                    error:function(data){//실패시 처리
                      console.log("error:"+data);
                    }
              }); //  $.ajax End --------------------------       
          }); // $("#findPw").on("click") End --------------------------             
	  }); // $(document).ready End --------------------------
	
	</script>
	<title>Find_ID_PW</title>
  </head>
</head>  
<body>
  <header>
    <nav class="py-2 bg-light border-bottom">
      <div class="container d-flex flex-wrap">
        <ul class="nav me-auto">
          <li class="nav-item" style="margin-top: 0px; margin-bottom: 0px">
            <a id="logo" href="${path}/main.do" class="nav-link link-dark px-2 active" aria-current="page"> <img src="resources/img/Pill_32px.png" alt="Pill"> &nbsp; <b>PillDex</b> </a>
          </li>
        </ul>
        <ul class="nav" style="">       
          <li class="nav-item" style="margin-top: 0px; margin-bottom: 0px; padding-top:4px"><a href="${path}/mode.do" class="nav-link link-dark px-2"><b>돋보기</b></a></li>
          <li class="nav-item" style="margin-top: 0px; margin-bottom: 0px; padding-top:4px"><a href="${path}/map.do" class="nav-link link-dark px-2"><b>MAP</b></a></li>    
          <c:if test="${user ne null }"> <!-- 유저 정보가 있을 경우 마이페이지/로그아웃 버튼 활성화. --> 
            <li class="nav-item" style="margin-top: 0px; margin-bottom: 0px; padding-top:4px"><a href="${path}/mypage.do" class="nav-link link-dark px-2"><b>마이페이지</b></a></li>
            <li class="nav-item" style="margin-top: 0px; margin-bottom: 0px; padding-top:4px"><a href="${path}/logout.do" class="nav-link link-dark px-2"><b>로그아웃</b></a></li>
          </c:if>
          <c:if test="${user eq null}"> <!-- 유저 정보가 없을 경우 로그인 버튼 활성화. --> 
            <li class="nav-item" style="margin-top: 0px; margin-bottom: 0px; padding-top:4px"><a href="${path}/main.do" class="nav-link link-dark px-2"><b>로그인</b></a></li>
          </c:if> 
        </ul>
      </div>  
	  </nav>
	  </header>
    
  <main>
      <div class="container text-center"> <!--  안의 내용을 가운데 정렬하는 container 영역 -->
      <div class="container text-center" style="margin-top: 60px; margin-bottom: 60px; visibility: hidden;"><a>빈 공간 입니다.</a> </div>
      <div class="row m-5">
        <form>
              <h1 class="h2 my-3 fw-normal"><b>아이디 찾기</b></h1>
              <div style="margin-top: 20px; margin-bottom: 20px;"></div>
              <div class="form-floating m-3">
                <input type="name" class="form-control" id="name" placeholder="이름">
                <label for="name">이름</label>
              </div>
              <div class="form-floating m-3">
                <input type="email" class="form-control" id="email" placeholder="이메일">
                <label for="email">이메일</label>
              </div>
              <button class="w-50 btn btn-lg btn-primary"  id="findId" type="button">아이디 찾기 </button>
              <p class="mt-5 mb-3 text-muted"/>
            </form>        
      </div>
    </div>
    <div class="container text-center" style="margin-top: 40px; margin-bottom: 40px; visibility: hidden; "> <a>빈 공간 입니다.</a> </div>
    <div class="container text-center">
      <div style="margin-top: 100px; margin-bottom: 100px;"></div>
      <div class="row m-5">
        <form>
          <h1 class="h2 my-3 fw-normal"><b>비밀번호 찾기</b></h1>
          <div style="margin-top: 20px; margin-bottom: 20px;"></div>
          <div class="form-floating m-3">
            <input type="userId" class="form-control" id="userId" placeholder="아이디">
            <label for="userId">아이디</label>
          </div>
  
            <div class="form-floating m-3">
            <input type="name2" class="form-control" id="name2" placeholder="이름">
            <label for="name2">이름</label>
          </div>
            <div class="form-floating m-3">
            <input type="email2" class="form-control" id="email2" placeholder="이메일">
            <label for="email2">이메일</label>
          </div>
          <button class="w-50 btn btn-lg btn-primary"  id="findPw" type="button">비밀번호 찾기 </button>
          <p class="mt-5 mb-3 text-muted"/>
        </form>        
        </div>
    </div>
  </main>     
  <footer class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
    <div class="col-md-4 d-flex align-items-center">
      <a href="/" class="mb-3 me-2 mb-md-0 text-muted text-decoration-none lh-1">
        <svg class="bi" width="30" height="24"><use xlink:href="#bootstrap"/></svg>
      </a>
      <span class="mb-3 mb-md-0 text-muted">&copy; Make, 2023 FiveGuys 4 Team </span>
    </div>
  </footer>  
</body> 
</html>