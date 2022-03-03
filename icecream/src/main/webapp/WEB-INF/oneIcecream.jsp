<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Icecreams</title>
<!-- for internal CSS -->
<link rel="stylesheet" href="/css/style.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto+Mono&family=Sacramento&family=Titillium+Web:wght@600&display=swap"
	rel="stylesheet">
</head>

<body>
	<div id="nav-bar">
		<a href="/" draggable="false"><h1>"Icecream" <span
				class="titillium">Icecream</span> <span class="sacramento">icecream</span></h1>
		</a> <a href="/cart" draggable="false"><img
			src="/img/shopping-cart.png" alt="shopping-cart" class="icon"
			draggable="false" id="shopping-cart" /></a>
	</div>
	<div class="container">
		<div class="grid one-icecream">
			<div>
				<div class="icecream-detail">
					<h2>
						<c:out value="${flavor.name }" />
						Icecream
					</h2>
					<p>
						<c:out value="${flavor.description }"></c:out>
					</p>
				</div>
				<form:form action="/icecreams/addToCart" method="POST" modelAttribute="order">
					<h3>Toppings</h3>
					<form:hidden path="flavor" value="${flavor.id }"/>
					<form:checkboxes items="${allToppings }" path="toppings" itemLabel="name" element="div"/>
					<button class="button">Add to Cart</button>
				</form:form>
			</div>

			<img src="${flavor.imageUrl }"
				alt="<c:out value="${flavor.name }"></c:out>-icecream"
				draggable="false" />
		</div>
	</div>

	<!-- internal script -->
	<script type="text/javascript" src="/js/script.js"></script>
</body>

</html>