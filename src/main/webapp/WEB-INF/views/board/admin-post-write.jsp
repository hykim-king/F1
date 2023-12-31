<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>관리자 - 글쓰기</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<header class="bg-light text-center p-4">
    <h1>로드스캐너</h1>
</header>

<div class="container my-4">
    <h2>Q&A 게시판</h2>
    <form>
        <div class="mb-3 row">
            <label for="postType" class="col-sm-2 col-form-label">분류</label>
            <div class="col-sm-10">
                <select class="form-select" id="postType">
                    <option selected>공지</option>
                </select>
            </div>
        </div>
        <div class="mb-3 row">
            <label for="postTitle" class="col-sm-2 col-form-label">제목</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="postTitle" value="와! 로드스캐너 서비스 런칭합니다.">
            </div>
        </div>
        <div class="mb-3 row">
            <label for="author" class="col-sm-2 col-form-label">작성자</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="author" value="admin" readonly>
            </div>
        </div>
        <div class="mb-3 row">
            <label for="attachment" class="col-sm-2 col-form-label">첨부파일</label>
            <div class="col-sm-10">
                <input type="file" class="form-control" id="attachment">
            </div>
        </div>
        <div class="mb-3 row">
            <label for="content" class="col-sm-2 col-form-label">내용</label>
            <div class="col-sm-10">
                <textarea class="form-control" id="content" rows="10">지금까지 로드스캐너를 사용해주셔서 감사합니다.</textarea>
            </div>
        </div>
        <div class="text-center">
            <button type="button" class="btn btn-secondary btn-lg mx-2" onclick="location.href='/'">취소</button>
            <button type="submit" class="btn btn-primary btn-lg mx-2">작성완료</button>
        </div>
    </form>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
