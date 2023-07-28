<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="CP" value="${pageContext.request.contextPath }"/>  
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"> 
    <!-- CSS -->
    <link href="${CP}/resources/css/default.css" rel="stylesheet">
    <link href="${CP}/resources/css/bootstrap/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
    <script src="${CP}/resources/js/bootstrap/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="${CP}/resources/js/jquery-3.7.0.js"></script>
    <title>test</title>
   <style>
      /* 전체 페이지 스타일 설정 */
      body {
        font-family: Arial, sans-serif;
        line-height: 1.6;
        color: #333;
        background-color: #f9f9f9;
        margin: 0;
        padding: 0;
      }

      /* 탈퇴 페이지 컨테이너 스타일 */
      .container {
        max-width: 600px;
        margin: 50px auto;
        padding: 20px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      }


      /* 제목 스타일 */
      h1 {
        text-align: center;
        color: #4285f4;
        margin-bottom: 10px; /* 제목과 내용 사이 간격 조정 */
      }

      /* 내용 스타일 */
      p {
        text-align: center; /* 내용 중앙 정렬 */
        margin-bottom: 30px; /* 제목과 내용 사이 간격 조정 */
      }

      /* 입력 폼 스타일 */
      form {
        display: flex;
        flex-direction: column;
      }

      label {
        margin-bottom: 10px;
        font-weight: bold;
      }

      input[type="text"],
      input[type="password"],
      button {
        padding: 10px;
        margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
        width: 100%; /* 너비를 100%로 설정하여 동일한 길이로 만듦 */
        box-sizing: border-box; /* 패딩과 보더를 포함한 전체 너비 유지 */
      }

      input[type="password"]::placeholder {
        color: #ccc;
      }

      /* 탈퇴 버튼 스타일 */
      button {
        background-color: #4285f4;
        color: #fff;
        border: none;
        cursor: pointer;
      }

      button:hover {
        background-color: #3367d6;
      }

      /* 링크 스타일 */
      a {
        color: #4285f4;
        text-decoration: none;
      }

      a:hover {
        text-decoration: underline;
      }
    </style>

</head>
<body>
    <div class="container">
        <h1>탈퇴 페이지</h1>
        <form>
          <label for="password"></label>
          <input type="password" id="upassword" placeholder="비밀번호를 입력하세요">
        </form>
        <input type="hidden" id="uid"  value="${user.uid}">
        <input type="hidden" id="upw"  value="${user.upassword}">
        <button id="doWithdraw">회원 탈퇴하기</button>
    </div>
    <script>
        $(document).ready(function() {
            console.log("$document ready");

            $("#doWithdraw").click(function() {
                var password = $("#password").val();
                
                

                
                // 확인 메시지 표시
                if (!confirm('회원 탈퇴하시겠습니까?') == true) {
                    return false;
                }
                
                if($("#upassword").val() != $("#upw").val()) {
                	alert("비밀번호가 다릅니다")
                	console.log("비밀번호를 확인하세요");
                }
                    
                else{


                // AJAX 요청을 보냅니다.
                $.ajax({
                    type: "POST",
                    url:"${CP}/withdraw",
                    dataType:"html",
                    data: {
                    	uid: $("#uid").val()
                    },
                    success:function(data) {
                    	let parsedJSON = JSON.parse(data);
                      	
                       	if("10" == parsedJSON.msgId){
                               alert(parsedJSON.msgContents);
                               window.location.href="${CP}/login";
                        } 
                                              
                        if("20" == parsedJSON.msgId){
                            alert(parsedJSON.msgContents);
                            return;
                        }
                        
                    },
                    error: function(data) {
                        console.log("error:" + data);
                    }
                }); // --ajax
                } // -- else
            }); // --doWithdraw
            
        });
    </script>
</body>
</html>