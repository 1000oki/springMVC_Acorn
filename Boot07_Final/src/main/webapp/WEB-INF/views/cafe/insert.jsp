<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/cafe/insert.jsp</title>
<style>
	.star-rating {
	  border:solid 1px #ccc;
	  display:flex;
	  flex-direction: row-reverse;
	  font-size:1em;
	  justify-content:space-around;
	  padding:0 .2em;
	  text-align:center;
	  width:5em;
	}
		
	.star-rating input {
	  display:none;
	}
	
	.star-rating label {
	  color:#ccc;
	}
	
</style>
</head>
<body>
	
	<p>새글이 추가되었습니다. ${star}</p>
	<div class="star-rating">
			  <input type="radio" id="5-stars" name="star" value="5" />
			  <label style='<c:if test="${star > 4 }">color:#f90;</c:if>' for="5-stars" class="star">&#9733;</label>
			  <input type="radio" id="4-stars" name="star" value="4" />
			  <label style='<c:if test="${star > 3 }">color:#f90;</c:if>' for="4-stars" class="star">&#9733;</label>
			  <input type="radio" id="3-stars" name="star" value="3" />
			  <label style='<c:if test="${star > 2 }">color:#f90;</c:if>' for="3-stars" class="star">&#9733;</label>
			  <input type="radio" id="2-stars" name="star" value="2" />
			  <label style='<c:if test="${star > 1 }">color:#f90;</c:if>' for="2-stars" class="star">&#9733;</label>
			  <input type="radio" id="1-star" name="star" value="1" />
			  <label style='<c:if test="${star > 0 }">color:#f90;</c:if>' for="1-star" class="star">&#9733;</label>
	</div>
</body>
</html>