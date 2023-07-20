<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="CP" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author"  content="hbi">  
<!-- CSS -->
<link  href="${CP}/resources/css/bootstrap/bootstrap.min.css" rel="stylesheet"  crossorigin="anonymous">
<script src="${CP}/resources/js/bootstrap/bootstrap.bundle.min.js"  crossorigin="anonymous"></script>
<script src="${CP}/resources/js/jquery-3.7.0.js"></script>
<link>
<title>Find_ID_PW</title>
  </head>
<body>
 <div class = "container">
    <a href="${CP}/login">로그인 페이지</a>
      <div><!-- id 찾기 -->
        <form>
          <input type="text" id="name" name="name" placeholder="이름">
          <input type="email" id="email" name= "email" placeholder="이메일">
          <button type="button" id="findId" name="findId">아이디 찾기</button>
        </form>
      </div><!-- id 찾기 -->
      
	  <div><!-- pw 찾기 -->
        <form>
          <input type="text" id="userId" name="userId" placeholder="아이디">
          <input type="text" id="name2" name= "name2" placeholder="이름">
          <button type="button" id="findPw" name="findPw">비밀번호 찾기</button>
        </form>
      </div><!-- pw 찾기 -->  
    </div><!-- container -->   
</body> 
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
              url:"${path}/findId",
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
           
            $.ajax({
                  type: "POST",
                  url:"${path}/findPw",
                  /* asyn:"true", */
                  dataType:"html",
                  data:{
                    id   : $("#userId").val(),
                    name : $("#name2").val(),
                    
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
                      }
                    },
                    error:function(data){//실패시 처리
                      console.log("error:"+data);
                    }
              }); //  $.ajax End --------------------------       
          }); // $("#findPw").on("click") End --------------------------             
      }); // $(document).ready End --------------------------
    
    </script>
</html>