<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <style>
        body {
            font-family: 'NanumSquare';
        }
    </style>
    <script src="${CP}/resources/js/bootstrap/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="${CP}/resources/js/jquery-3.7.0.js"></script>
    <script>
        $(document).ready(function() {
            console.log("$document.ready");

            // 회원탈퇴 버튼 클릭 이벤트 처리
            $("#doWithdraw").on("click", function() {
                console.log("doWithdraw");

                var password = $("#password").val();
                if (password === '') {
                    alert('비밀번호를 입력해주세요.');
                } else {
                    if (confirm('정말로 회원 탈퇴하시겠습니까?')) {
                        // 비밀번호를 서버로 전송하여 회원 탈퇴 처리 요청 전송
                        $.ajax({
                            type: "POST",
                            url: "${CP}/withdraw", 
                            dataType: "html",
                            data: {
                            	upassword: password
                            },
                            success: function(data) {
                                // 탈퇴 결과에 따른 처리
                                alert(data); 
                                if (data === "success") {
                                    var loginPageUrl = "${CP}/login"; 
                                    window.location.href = loginPageUrl; // 로그인 페이지로 이동
                                }
                            },
                            error: function(data) {
                                console.log("error:" + data);
                            }
                        });
                    }
                }
            });
        });
    </script>
</head>
<body>
    <div class="container">
        <h1>탈퇴 페이지</h1>
        <p>비밀번호: <input type="password" id="password"></p>
        <button id="doWithdraw">회원 탈퇴하기</button>
    </div>
</body>
</html>
