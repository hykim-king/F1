<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap Icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="${CP}/resources/js/jquery-3.7.0.js"></script>
<script src="${CP}/resources/js/util.js"></script>
<title>Q&A</title>
</head>
<body>
  <header class="bg-light text-center p-4">
      <h1>로드스캐너</h1>
  </header>
  
  <div class="container">
    <!-- 제목 -->
    <div class="page-header">
      <h3>관리자 전용 게시판</h3>
    </div>
    <!-- 제목 end --------------------------------------------------------------->
    
    <!-- 검색 form -->
    <div class="row">
      <div class="col-6">
		    <form name="searchFrm">
		      <div class="row g-1 d-flex">  
		        <div class="col-auto">
		          <select class="form-select" name="searchDiv" id="searchDiv">
		            <option value="">전체</option>
		            <option value="">제목</option>
		            <option value="">내용</option>
		            <option value="">제목+내용</option>
		          </select>
		        </div>
		      </div>
	      </form>
      </div>
		  <div class="col-6 text-end">
	      <!-- 글쓰기 button -->
        <div class="col-auto justify-content-end" name="writeButton" id="writeButton">   
          <a href="#" class="btn btn-primary" onclick="location.href='/board/write'">글쓰기</a>
        </div>
		  </div>  
    </div>
    <!--// 검색 form end -------------------------------------------------------->
    
    <!-- board table -->
    <table class="table table-hover" id="boardTable">
      <thead class="table-light">
        <tr>
          <th class="text-center">번호</th>
          <th class="text-center">분류</th>
          <th class="text-center">제목</th>
          <th class="text-center">작성자</th>
          <th class="text-center">작성일</th>
          <th class="text-center">조회수</th>
        </tr>
      </thead>
      <tbody>
       <tr>
          <td class="text-center col-sm-1 col-md-1 col-lg-1" id="postNum">12</td>
          <td class="text-center col-sm-2 col-md-2 col-lg-1" id="postClass">답변대기</a></td>          
          <td class="text-center col-sm-5 col-md-5 col-lg-5" id="postTitle"><a href="#" style="text-decoration-line: none;">모르겠어요</a></td>
          <td class="text-center col-sm-1 col-md-2 col-lg-2" id="author">dev*******</td>
          <td class="text-center col-sm-2 col-md-1 col-lg-2" id="postDate">16:10</td>
          <td class="text-center col-sm-1 col-md-1 col-lg-1" id="readCnt">33</td>
          <td style="display:none;">1</td>
        </tr>
       <tr>
          <td class="text-center col-sm-1 col-md-1 col-lg-1" id="postNum">11</td>
          <td class="text-center col-sm-2 col-md-2 col-lg-1" id="postClass">답변대기</a></td>          
          <td class="text-center col-sm-5 col-md-5 col-lg-5" id="postTitle"><a href="#" style="text-decoration-line: none;">컴퓨터 이상</a></td>
          <td class="text-center col-sm-1 col-md-2 col-lg-2" id="author">che*******</td>
          <td class="text-center col-sm-2 col-md-1 col-lg-2" id="postDate">2023/07/25</td>
          <td class="text-center col-sm-1 col-md-1 col-lg-1" id="readCnt">99</td>
          <td style="display:none;">1</td>
        </tr>
        <tr class="table-secondary">
          <td class="text-center col-sm-1 col-md-1 col-lg-1" id="postNum">10</td>
          <td class="text-center col-sm-2 col-md-2 col-lg-1 table-secondary" id="postClass">답변완료</a></td>          
          <td class="text-center col-sm-5 col-md-5 col-lg-5" id="postTitle"><a href="#" style="text-decoration-line: none;"></a></td>
          <td class="text-center col-sm-1 col-md-2 col-lg-2" id="author"></td>
          <td class="text-center col-sm-2 col-md-1 col-lg-2" id="postDate"></td>
          <td class="text-center col-sm-1 col-md-1 col-lg-1" id="readCnt"></td>
          <td style="display:none;">1</td>
        </tr>
        <tr class="table-secondary">
          <td class="text-center col-sm-1 col-md-1 col-lg-1" id="postNum">9</td>
          <td class="text-center col-sm-2 col-md-2 col-lg-1" id="postClass">답변완료</a></td>          
          <td class="text-center col-sm-5 col-md-5 col-lg-5" id="postTitle"><a href="#" style="text-decoration-line: none;"></a></td>
          <td class="text-center col-sm-1 col-md-2 col-lg-2" id="author"></td>
          <td class="text-center col-sm-2 col-md-1 col-lg-2" id="postDate"></td>
          <td class="text-center col-sm-1 col-md-1 col-lg-1" id="readCnt"></td>
          <td style="display:none;">1</td>
        </tr>
        <tr class="table-secondary">
          <td class="text-center col-sm-1 col-md-1 col-lg-1" id="postNum">8</td>
          <td class="text-center col-sm-2 col-md-2 col-lg-1" id="postClass">답변완료</a></td>          
          <td class="text-center col-sm-5 col-md-5 col-lg-5" id="postTitle"><a href="#" style="text-decoration-line: none;"></a></td>
          <td class="text-center col-sm-1 col-md-2 col-lg-2" id="author"></td>
          <td class="text-center col-sm-2 col-md-1 col-lg-2" id="postDate"></td>
          <td class="text-center col-sm-1 col-md-1 col-lg-1" id="readCnt"></td>
          <td style="display:none;">1</td>
       </tr>
      </tbody>
    </table>
    <!-- board table end ------------------------------------------------------------>
    
    <!-- pagination -->
    <nav aria-label="Page navigation">
      <ul class="pagination justify-content-center">
        <li class="page-item">
          <a class="page-link" href="#" aria-label="Previous">
            <span aria-hidden="true">&laquo;</span>
          </a>
        </li>
        <li class="page-item"><a class="page-link" href="#">1</a></li>
        <li class="page-item"><a class="page-link" href="#">2</a></li>
        <li class="page-item"><a class="page-link" href="#">3</a></li>
        <li class="page-item">
          <a class="page-link" href="#" aria-label="Next">
            <span aria-hidden="true">&raquo;</span>
          </a>
        </li>
      </ul>
    </nav>
    <!-- pagination end ------------------------------------------------------->
    
  </div>
  <!-- container end ---------------------------------------------------------->
  
</body>
</html>