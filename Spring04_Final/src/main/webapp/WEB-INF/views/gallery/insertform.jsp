<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/gallery/insertform.jsp</title>
<style>
	#imageForm{
		display:none;
	}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h3 class="mt-3">갤러리 추가 폼입니다.</h3>
		<p class="form-label">사진</p>
		<a id="imageLink" href="javascript:">
			<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-image" viewBox="0 0 16 16">
			  <path d="M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
			  <path d="M2.002 1a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2h-12zm12 1a1 1 0 0 1 1 1v6.5l-3.777-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12V3a1 1 0 0 1 1-1h12z"/>
			</svg>
		</a>
		<form action="${pageContext.request.contextPath}/gallery/insert"  method="post">
			<input type="hidden" id="imagePath" name="imagePath"/>
			<div class="mb-3">
				<label class="form-label"  for="caption">제목</label>
				<input class="form-control" type="text" id="caption" name="caption" />
			</div>
			<button class="mt-3 btn btn-dark" type="submit">업로드</button>
		</form>
		
		 <form id="imageForm" action="${pageContext.request.contextPath}/gallery/image_upload" method="post" enctype="multipart/form-data">
         사진
         <input type="file" id="image" name="image" accept=".jpg, .png, .gif"/>
         <button type="submit">업로드</button>
      </form>
	</div>
    <script src="${pageContext.request.contextPath }/resources/js/gura_util.js"></script>
	<script>
		document.querySelector("#imageLink").addEventListener("click", function(){
			document.querySelector("#image").click();
		});
		
		document.querySelector("#image").addEventListener("change", function(){
			const form = document.querySelector("#imageForm");
			ajaxFormPromise(form)
			.then(function(response){
				return response.json();
			})
			.then(function(data){
				console.log(data);
				document.querySelector("input[name=imagePath]").value = data.imagePath;
				
				let img=`<img id="Image"
					src="${pageContext.request.contextPath }\${data.imagePath}">`;
				document.querySelector("#imageLink").innerHTML=img;
			});
		});
	</script>
</body>
</html>