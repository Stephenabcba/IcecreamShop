<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Icecreams</title>
<!-- for internal CSS -->
<link rel="stylesheet" href="/css/showAll.css" />
<link rel="stylesheet" href="/css/style.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto+Mono&family=Sacramento&family=Titillium+Web:wght@600&display=swap"
	rel="stylesheet">
</head>

<body>
	<div id="nav-bar">
		<a href="/" draggable="false"><h1>"Icecream" <span class="titillium">Icecream</span> <span
			class="sacramento">icecream</span></h1> </a>
		<div>
			<c:choose>
				<c:when test="${uuid != null }">
				<p>Hello, <c:out value="${loggedin_name }"></c:out> </p>
				<a href="/dashboard">Dashboard</a>
				<a href="/logout">Log Out</a>
				</c:when>
				<c:otherwise>
					<a href="/login">Login / Register</a>
				</c:otherwise>
			</c:choose>
			<a href="/cart" draggable="false"><img src="/img/shopping-cart.png"
				alt="shopping-cart" class="icon" draggable="false" id="shopping-cart"/></a>
		</div>
	</div>
	<div class="container">
		<c:if test="${error!=null }">		
		<p class="alert border"><c:out value="${error }"></c:out> </p>
		</c:if>
		<c:if test="${flashMessage != null }">
		<p class="message border"><c:out value="${flashMessage }"></c:out> </p>
		</c:if>
		<div class="grid all-icecreams-grid">
			<c:forEach var="flavor" items="${flavors }">
				<a href="/icecreams/${flavor.id }" draggable="false"><div class="icecream-card">
					<img src="${flavor.imageUrl }" alt="<c:out value="${flavor.name }"/>-icecream" draggable="false" class="border"/>
					<div class="image-center-text"><c:out value="${flavor.name }"/></div>
				</div></a>
			</c:forEach>
		</div>
	</div>

	<!-- internal script -->
	<script type="text/javascript" src="/js/script.js"></script>
</body>

</html>