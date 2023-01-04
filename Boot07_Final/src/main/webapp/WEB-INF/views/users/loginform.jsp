<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.108.0">
<title>/users/loginform.jsp</title>
<link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/sign-in/">
<link href="${pageContext.request.contextPath }/resources/assets/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
  .bd-placeholder-img {
    font-size: 1.125rem;
    text-anchor: middle;
    -webkit-user-select: none;
    -moz-user-select: none;
    user-select: none;
  }

  @media (min-width: 768px) {
    .bd-placeholder-img-lg {
      font-size: 3.5rem;
    }
  }

  .b-example-divider {
    height: 3rem;
    background-color: rgba(0, 0, 0, .1);
    border: solid rgba(0, 0, 0, .15);
    border-width: 1px 0;
    box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
  }

  .b-example-vr {
    flex-shrink: 0;
    width: 1.5rem;
    height: 100vh;
  }

  .bi {
    vertical-align: -.125em;
    fill: currentColor;
  }

  .nav-scroller {
    position: relative;
    z-index: 2;
    height: 2.75rem;
    overflow-y: hidden;
  }

  .nav-scroller .nav {
    display: flex;
    flex-wrap: nowrap;
    padding-bottom: 1rem;
    margin-top: -1px;
    overflow-x: auto;
    text-align: center;
    white-space: nowrap;
    -webkit-overflow-scrolling: touch;
  }

</style>
<link href="${pageContext.request.contextPath }/resources/assets/dist/css/sign-in.css" rel="stylesheet">

</head>

<body class="text-center">
	<main class="form-signin w-100 m-auto">
	  <form action="${pageContext.request.contextPath}/users/login" method="post">
	  	<c:choose>
            <c:when test="${ empty param.url }">
               <input type="hidden" name="url" value="${pageContext.request.contextPath}/"/>
            </c:when>
            <c:otherwise>
               <input type="hidden" name="url" value="${param.url }"/>
            </c:otherwise>
        </c:choose>
	    <img class="mb-4" src="${pageContext.request.contextPath }/resources/assets/brand/bootstrap-logo.svg" alt="" width="72" height="57">
	    <h1 class="h3 mb-3 fw-normal">Please sign in</h1>
	
	    <div class="form-floating">
	      <input type="text" class="form-control" id="floatingInput" name="id" placeholder="id" value="${savedId}">
	      <label for="floatingInput">id</label>
	    </div>
	    <div class="form-floating">
	      <input type="password" class="form-control" id="floatingPassword" name="pwd" placeholder="Password" value="${savedPwd}">
	      <label for="floatingPassword">Password</label>
	    </div>
	
	    <div class="checkbox mb-3">
	      <label>
	      <!-- 
	      	체크박스를 체크하지 않으면 isSave라는 파라미터 값으로 넘어오는 문자열을 null이고 
	      	체크하면 isSave라는 파라미터 값으로 넘어오는 문자열은 "yes"이다 
	      -->
	        <input type="checkbox" value="remember-me" name=isSave value="yes" ${not empty cookie.savedId ? 'checked':'' } }> Remember me
	      </label>
	    </div>
	    <button class="w-100 btn btn-lg btn-primary" type="submit">Sign in</button>
	    <p class="mt-5 mb-3 text-muted">&copy; 2017–2022</p>
	  </form>
	</main>
</body>
</html>