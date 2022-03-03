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
		<div class="grid one-icecream">
			<div>
				<div class="icecream-detail">
					<h2>Chocolate Icecream</h2>
					<p>Uses chocolate from Belgium with locally sourced organic whole milk. Our icecreams are slow-churned for 8 hours before serving fresh every day.</p>
				</div>
				<form action="/icecreams/addToCart">
					<h3>Toppings</h3>
					<input type="hidden" name="flavor" value="chocolate">
					<div>
						<input type="checkbox" id="sprinkles" name="topping1" value="sprinkles"/>
						<label for="sprinkles">Sprinkles</label>
					</div>
					<div>
						<input type="checkbox" id="pineapple_chunk" name="topping2" value="pinepple"/>
						<label for="pineapple_chunk">Pineapple Chunks</label>
					</div>
					<div>
						<input type="checkbox" id="mms" name="topping3" value="mms"/>
						<label for="mms">M&amp;Ms</label>
					</div>
					<div>
						<input type="checkbox" id="peanuts" name="topping4" value="peanuts"/>
						<label for="peanuts">Crushed Peanuts</label>
					</div>
					<div>
						<input type="checkbox" id="gummy_bear" name="topping5" value="gummybear"/>
						<label for="gummy_bear">Gummy Bears</label>
					</div>
					<button class="button">Add to Cart</button>
				</form>
			</div>
			
			<img src="/img/chocolate.jpg" alt="chocolate-icecream" draggable="false"/>
		</div>
	</div>

	<!-- internal script -->
	<script type="text/javascript" src="/js/script.js"></script>
</body>

</html>