<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/insert.jsp</title>
</head>
<body>
	<div class="container">
		<h3>알림</h3>
		<p>${content }를 추가했습니다!</p>
		<a href="${pageContext.request.contextPath}/todo/list">확인</a>
	</div>
</body>
</html>