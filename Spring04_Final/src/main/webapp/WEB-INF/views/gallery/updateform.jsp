<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/gallery/updateform.jsp</title>
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
		<h3 class="mt-3">갤러리 수정 폼입니다.</h3>
		<p class="form-label">사진</p>
		<a id="imageLink" href="javascript:">
			<img src="${pageContext.request.contextPath}/${dto.imagePath}" />
		</a>
		<form class="mt-3" action="${pageContext.request.contextPath}/gallery/update"  method="post">
			<input type="hidden" id="imagePath" name="imagePath" value="${dto.imagePath }" />
			<input type="hidden" id="num" name="num" value="${dto.num }" />
			<div>
				<label class="form-label"  for="caption">제목</label>
				<input class="form-control" type="text" id="caption" name="caption" value="${dto.caption }"/>
			</div>
			<button class="mt-3 btn btn-dark" type="submit">업로드</button>
		</form>
		
		 <form class="mt-3" id="imageForm" action="${pageContext.request.contextPath}/gallery/image_upload" method="post" enctype="multipart/form-data">
         사진
         <input type="file" id="image" name="image" accept=".jpg, .png, .gif"/>
         <button  type="submit">업로드</button>
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