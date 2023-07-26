<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시판 상세페이지</title>
    <style>
        textarea {
            width: 100%;
            height: 200px;
        }
        
        form {
            width: 100%;
            height: 200px;
            border: solid;
            border-color: gray;
            border-width: 1px;
            
        }
        input {
            margin: 10px;
        }

        .button-container {
            display: flex;
            justify-content: center;
        }
        
        .sjbutton {
            float: right;
        }
        
        .block {
            height: 50px;
            margin-top: 10px;
            color: #fff;
        }
        
    </style>
</head>
<body>
    <div>
        <h4>Q&A 게시판</h4>
        <hr/>
    </div>
    <div>
        <h2>제목</h2>
        <hr/>
    </div>
    <div>
        <h5>작성자: | 작성일 : | 조회수: </h5>
        <hr/>
    </div>
    <div>
        <h5>내용</input></h5>
        <form class="" id="" rows=""></form>
    </div>
    <div class="sjbutton">
        <input type="button" value="수정">
        <input type="button" value="삭제">
    </div>
    <div class="block"></div>
    <div>
        <h5>답변</h5>
        <form class="" id="" rows=""></form>
    </div>
    <div class="sjbutton">
        <input type="button" value="수정"></input>
    </div>
    <div class="block"></div>
    <div class="button-container">
        <input type="button" value="목록"></input>
        <input type="button" value="글쓰기"></input>
    </div>
        
</body>

</html>