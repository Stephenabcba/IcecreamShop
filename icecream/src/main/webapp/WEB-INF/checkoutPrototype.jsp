<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<a href="/" draggable="false">
			<h1>"Icecream" <span class="titillium">Icecream</span> <span class="sacramento">icecream</span></h1>
		</a>
		<a href="/cart" draggable="false"><img src="/img/shopping-cart.png" alt="shopping-cart" class="icon"
				draggable="false" id="shopping-cart" /></a>
	</div>
	<div class="container">
		<h2 class="title-center">Check Out</h2>
		<div class="grid" id="checkout">
			<div class="border">
				<div>
					<p>Pineapple Icecream</p>
					<p class="light-text add-on-item">+Pineapple chunks</p>
					<p class="light-text add-on-item">+M&amp;Ms</p>
				</div>
				<p class="mint-text price">$2.99</p>
				<p>Blueberry</p>
				<p class="mint-text price">$1.99</p>
				<p>Total</p>
				<p class="mint-text price">$6.47</p>
			</div>
			<div class="border">
				<form action="">
					<div>
						<label for="name">Name</label>
						<input type="text" name="name" id="name" class="border" />
					</div>
					<div>
						<label for="address">Address</label>
						<input type="text" name="address" id="address" class="border" />
					</div>
					<div>
						<label for="city">City</label>
						<input type="text" name="city" id="city" class="border" />
					</div>
					<div>
						<label for="ccnumber">Credit Card Number</label>
						<input type="text" name="ccnumber" id="ccnumber" class="border" />
					</div>
					<div>
						<label for="cvv">CVV</label>
						<input type="text" name="cvv" id="cvv" class="border" placeholder="123" onKeyPress="if(this.value.length==3) return false;"/>
					</div>
					<button class="button">Place Order</button>
				</form>
			</div>
		</div>

	</div>

	<!-- internal script -->
	<script type="text/javascript" src="/js/script.js"></script>
</body>

</html>