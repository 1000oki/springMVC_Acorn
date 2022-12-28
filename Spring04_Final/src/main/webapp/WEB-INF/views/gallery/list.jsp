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
	<div class="container mt-3">
		<a href="${pageContext.request.contextPath}/gallery/insertform" class="d-flex justify-content-end">
			<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="dark" class="bi bi-plus-circle" viewBox="0 0 16 16">
			  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
			  <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
			</svg>
		</a>
	  	<h1>갤러리 입니다.</h1>
	   	<div class="row row-cols-lg-4 row-cols-md-3 row-cols-sm-2">
	      	<c:forEach var="tmp" items="${list }">
	         	<div class="col mt-3">
	            	<div class="card" data-bs-toggle="modal" data-bs-target="#exampleModal" data-regdate="${tmp.regdate }" data-caption="${tmp.caption }" data-id="${id }" data-num="${tmp.num }" data-imagePath="${tmp.imagePath }" data-writer="${tmp.writer }">
	            		<div class="embed-responsive embed-responsive-4by3">
	               			<img class="card-img-top embed-responsive-item" src="${pageContext.request.contextPath }${tmp.imagePath}"/>
	               		</div>
	               		<div class="card-body">
	                  		<h3 class="card-title">${tmp.caption }</h3>
	                  		<p class="card-text">${tmp.writer }</p>
	                  		<p class="card-text">${tmp.regdate }</p>
	               		</div>
	            	</div>
	         	</div>      
	      	</c:forEach>
	   </div>
	</div>
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	      	<h1 class="modal-title fs-5">New message</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	      	<p class="modal-writer">id</p>
	      	<p class="modal-regdate">id</p>
	      	<div class="modal-img d-flex justify-content-center"></div>
	      </div>
	      <div class="modal-footer">
	      
	      </div>
	    </div>
	  </div>
	  <script>
		  const exampleModal = document.getElementById('exampleModal')
		  exampleModal.addEventListener('show.bs.modal', event => {
		    const card = event.relatedTarget;
		    const imagePath = card.getAttribute('data-imagePath');
		    const num = card.getAttribute('data-num');
		    const writer = card.getAttribute('data-writer');
		    const id = card.getAttribute('data-id');
		    const caption = card.getAttribute('data-caption');
		    const regdate = card.getAttribute('data-regdate');
		     let img = `<img id="Image" src="${pageContext.request.contextPath }\${imagePath}">`;
		     document.querySelector(".modal-img").innerHTML=img;
		     document.querySelector(".modal-writer").innerText="작성자 : "+ writer;
		     document.querySelector(".modal-regdate").innerText="등록일 : "+ regdate;
		     const del = (id == writer) ? `<button class="btn btn-danger" onclick="location.href='${pageContext.request.contextPath}/gallery/delete?num=\${num}'">삭제</button>` : "";
		     const update = (id == writer) ? `<button class="btn btn-dark" onclick="location.href='${pageContext.request.contextPath}/gallery/updateform?num=\${num}'">수정</button>` : "";
	         document.querySelector(".modal-footer").innerHTML=update + del;
	         document.querySelector(".modal-title").innerText=caption;
	         
		  });
	  </script>
</div>
</body>
</html>