<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/list.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col">
					<h3 class="mt-3"><strong>카페 글 목록 입니다.</strong></h3>
				</div>
				<div class="col text-end">
					<a href="${pageContext.request.contextPath }/cafe/private/insertform">
						<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-file-earmark-plus mt-3 me-3" viewBox="0 0 16 16">
						  <path d="M8 6.5a.5.5 0 0 1 .5.5v1.5H10a.5.5 0 0 1 0 1H8.5V11a.5.5 0 0 1-1 0V9.5H6a.5.5 0 0 1 0-1h1.5V7a.5.5 0 0 1 .5-.5z"/>
						  <path d="M14 4.5V14a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h5.5L14 4.5zm-3 0A1.5 1.5 0 0 1 9.5 3V1H4a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V4.5h-2z"/>
						</svg>
					</a>
				</div>
			</div>					
		<table class = "table table-striped mt-3">
			<thead class="table-dark">
				<tr>
					<th>글번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>조회수</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="tmp" items="${list }">
					<tr>
						<td>${tmp.num }</td>
						<td>${tmp.writer }</td>
						<td>
							<a href="detail?num=${tmp.num }">${tmp.title }</a>
						</td>
						<td>${tmp.viewCount }</td>
						<td>${tmp.regdate }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<nav>
			<ul class="pagination justify-content-center mt-5">
				<c:if test="${startPageNum != 1 }">
					<li class="page-item">
			 		<a class="page-link" href="list?pageNum=${startPageNum-1}"> Prev </a>
			 		</li>
			 	</c:if>
			 	<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
			 		<li class="page-item ${pageNum eq i ? 'active' : ''}">
						<a class="page-link" href="list?pageNum=${i}">${i } </a>
					</li>	
			 	</c:forEach>
				<c:if test="${endPageNum < totalPageCount }">
					<li class="page-item">
						<a class="page-link" href="list?pageNum=${endPageNum+1 }">Next</a>
					</li>
				</c:if>
			</ul>
		</nav>
		<form action="list" method="get">
			<label for="condition">검색조건</label>
			<select name="condition" id="condition">
				<option value="title_content">제목+내용</option>
				<option value="title">제목</option>
				<option value="writer">작성자</option>
			</select>
			<input type="text" name="keyword" id="keyword" />
			<button type="submit">검색</button>		
		</form>
	</div>
</body>
</html>