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
<link rel="stylesheet" href="/css/style.css" />
<link rel="stylesheet" href="/css/dashboard.css" />
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
		<c:if test="${unFavoriteSuccess!=null }">		
		<p class="message border"><c:out value="${unFavoriteSuccess }"></c:out> </p>
		</c:if>
		<h2>Dashboard</h2>
		<h3 class="pink-text">Favorite Icecream Flavors:</h3>
		<table id="favorite-icecreams">
			<c:forEach var="flavor" items="${user.favoriteFlavors }">
				<tr>
					<td class="mint-text">
						<a href="/icecreams/${flavor.id }"><c:out value="${flavor.name }"></c:out> Icecream </a>
					</td>
					<td>
						<form action="/icecreams/${flavor.id }/removeFavorite" method="post">
						<button class="text-like-button red-text">Remove From Favorite</button>
					</form>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>

	<!-- internal script -->
	<script type="text/javascript" src="/js/script.js"></script>
</body>

</html>