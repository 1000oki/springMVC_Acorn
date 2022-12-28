<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/gallery/list.jsp</title>
<style>
	.card-img-top{
		width:100%;
		height:30vh;
		object-fit:contain;
	}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<a href="${pageContext.request.contextPath}/gallery/insertform">추가</a>
	  	<h1>갤러리 입니다.</h1>
	   	<div class="row row-cols-lg-4 row-cols-md-3 row-cols-sm-2">
	      	<c:forEach var="tmp" items="${list }">
	         	<div class="col mt-3">
	            	<div class="card" onclick="location.href='${pageContext.request.contextPath}/gallery/detail?num=${tmp.num }'">
	            		<div class="embed-responsive embed-responsive-4by3">
	               			<img class="card-img-top embed-responsive-item" src="${pageContext.request.contextPath }${tmp.imagePath}"/>
	               		</div>
	               		<div class="card-body">
	                  		<h3 class="card-title">caption</h3>
	                  		<p class="card-text">${tmp.caption }</p>
	               		</div>
	            	</div>
	         	</div>      
	      	</c:forEach>
	   </div>
	</div>
</body>
</html>