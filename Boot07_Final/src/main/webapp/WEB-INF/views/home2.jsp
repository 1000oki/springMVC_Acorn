<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>practice</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<style>
	.container{
		margin-top: 5em;
	}
	.content{
		border : 1px solid black;
		margin-right:10px
	}
	
	#side{
		position:sticky;
		border : 1px solid black;
		min-width: 160px;
  		max-width: 220px;
	}
	
</style>
</head>
<body>
	
	<div class="container">
		
		<div class="content">
			강의 썸네일
		</div>
		<div class="cjustify-content-end" id="side">
			<div id="side">
				<button>강의 신청하기</button>
			</div>
		</div>
	</div>
</body>
</html>