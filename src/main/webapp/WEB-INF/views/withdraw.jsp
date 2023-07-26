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
                            url: "${CP}/withdraw", // 변경된 URL
                            dataType: "html",
                            data: {
                                password: password
                            },
                            success: function(data) {
                                // 탈퇴 결과에 따른 처리 (예: 팝업 메시지 띄우기 등)
                                alert(data); // 서버에서 전달한 메시지를 팝업으로 띄웁니다.
                                if (data === "success") {
                                    var loginPageUrl = "${CP}/login"; // 로그인 페이지 URL
                                    window.location.href = loginPageUrl; // 로그인 페이지로 이동합니다.
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