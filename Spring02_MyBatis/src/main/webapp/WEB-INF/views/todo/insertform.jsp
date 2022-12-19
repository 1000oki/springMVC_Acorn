<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/insertform.jsp</title>
</head>
<body>
	<div class="container">
		<h1>할일 목록 추가</h1>
		<form action="insert" method="post">
			<div>
				<label for="content">할일</label>
				<input type="text" id="content" name="content" />
			</div>
			<button type="submit">추가</button>
		</form>
	</div>
</body>
</html>