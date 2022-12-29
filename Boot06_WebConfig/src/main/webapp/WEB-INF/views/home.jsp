<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/main/webapp/WEB-INF/views/home.jsp</title>
</head>
<body>
	<div class="container">
		<h1>인덱스 페이지 입니다.</h1>
		<%-- 
			Spring Boot 에서 추가된 static 폴더에 있는 자원 사용하기 
			jsp 사용 불가이므로 그냥 사용하지 말고 밑에서 사용하는 webapp안에 있는 resource안에서 사용하자!
		--%>
		<img src="${pageContext.request.contextPath}/images/bottle.png" />
		<%-- Resource Handler 설정으로 추가한 resources 폴더에 있는 자원 사용하기 --%>
		<img src="${pageContext.request.contextPath}/resources/images/kim1.png" />
		<br />
		<a href="${pageContext.request.contextPath}/resources/test.jsp">jsp 페이지 사용</a>
		<br />
		
		<p>아래의 링크를 클릭해서 system 콘솔창에 MyInterceptor가 관여하는지 안하는지 확인</p>
		<a href="${pageContext.request.contextPath}/users/info">인터셉터 동작확인</a>
		<a href="${pageContext.request.contextPath}/users/loginform">인터셉터 동작확인2</a>
		
		<h3>공지사항</h3>
		<ul>
			<c:forEach var="tmp" items="${noticeList }">
				<li>${tmp }</li>
			</c:forEach>
		</ul>
	</div>
</body>
</html>