<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>로드스캐너</title>
</head>
<body>
<h1>로드스캐너 시작페이지</h1>
<h2>요구사항</h2>
<div>
    게시판
    <ul>
        <li><a href="/board/">전체게시물 확인하기</a></li>
        <li><a href="/board/detail">게시물 상세페이지</a></li>
        <li><a href="/board/write">글쓰기 상세페이지</a></li>
        <li><a href="/board/admin">관리자 전용 게시판</a> <!-- 일단 관리자 모드 고려 x, 임시 링크 설정-->
    </ul>
    관리자
    <ul>
        <li><a href="/board/#">전체게시물 확인하기</a></li>
        <li><a href="/board/admin/write">글쓰기 상세페이지</a></li>
    </ul>
</div>
	<ul>
	    <li>파일업로드</li>
	    <li><a href = "/login">로그인</a></li>   
	</ul>
	    <input type="text" value="push test" readonly="readonly">
</body>
</html>