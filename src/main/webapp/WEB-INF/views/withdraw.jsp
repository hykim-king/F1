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
                    if (confirm('탈퇴하겠습니까?')) {
                        // 비밀번호를 서버로 전송하여 회원 탈퇴 처리 요청 전송
                        $.ajax({
                            type: "POST",
                            url: "${CP}/withdraw", // 변경된 URL
                            dataType: "html",
                            data: {
                                password: password
                            },
                            success: function(data) {
                                // 탈퇴 결과에 따른 처리
                                if (data === "success") {
                                    // 탈퇴 성공 시 메시지 출력 및 로그인 페이지로 이동
                                    alert("탈퇴 처리가 되었습니다.");
                                    var loginPageUrl = "${CP}/login";
                                    window.location.href = loginPageUrl;
                                } else if (data === "incorrect") {
                                    // 비밀번호가 일치하지 않을 경우 오류 메시지 출력
                                    alert("비밀번호가 일치하지 않습니다.");
                                } else {
                                    // 기타 오류 처리
                                    alert("오류가 발생했습니다. 다시 시도해주세요.");
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