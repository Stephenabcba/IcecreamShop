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
		<a href="/cart" draggable="false"><img src="/img/shopping-cart.png"
			alt="shopping-cart" class="icon" draggable="false" id="shopping-cart"/></a>
	</div>
	<div class="container">
		<div class="grid all-icecreams-grid">
			<a href="/icecreams/0" draggable="false"><div class="icecream-card border">
					<img src="/img/chocolate.jpg" alt="chocolate-icecream" draggable="false"/>
					<div class="card-body">Chocolate</div>
				</div></a>
			<a href="/icecreams/1" draggable="false"><div class="icecream-card border">
					<img src="/img/cookies-and-cream.jpg"
						alt="cookies-and-cream-icecream" draggable="false"/>
					<div class="card-body">Cookies &amp; Cream</div>
				</div></a>
			<a href="/icecreams/2" draggable="false"><div class="icecream-card border">
					<img src="/img/strawberry.jpg" alt="strawberry-icecream" draggable="false"/>
					<div class="card-body">Strawberry</div>
				</div></a>
			<a href="/icecreams/3" draggable="false"><div class="icecream-card border">
					<img src="/img/vanilla.png" alt="vanilla-icecream" draggable="false"/>
					<div class="card-body">Vanilla</div>
				</div></a>
			<a href="/icecreams/4" draggable="false"><div class="icecream-card border">
					<img src="/img/pineapple.jpg" alt="pineapple-icecream" draggable="false"/>
					<div class="card-body">Pineapple</div>
				</div></a>
			<a href="/icecreams/5" draggable="false"><div class="icecream-card border">
					<img src="/img/milk-tea.jpg" alt="milk-tea-icecream" draggable="false"/>
					<div class="card-body">Milk Tea</div>
				</div></a>
			<a href="/icecreams/6" draggable="false"><div class="icecream-card border">
					<img src="/img/caramel.jpg" alt="caramel-icecream" draggable="false"/>
					<div class="card-body">Caramel</div>
				</div></a>
			<a href="/icecreams/7" draggable="false"><div class="icecream-card border">
					<img src="/img/matcha.jpg" alt="matcha-icecream" draggable="false"/>
					<div class="card-body">Matcha</div>
				</div></a>
		</div>
	</div>

	<!-- internal script -->
	<script type="text/javascript" src="/js/script.js"></script>
</body>

</html>