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
		<div class="order-list border">
			<h2 class="title-center">Shopping Cart</h2>
			<div class="grid order-items">
				<table>
					<tr>
						<td>Pineapple Icecream</td>
						<td class="mint-text">$1.99</td>
					</tr>
					<tr>
						<td>Pineapple chunks</td>
						<td class="mint-text">$0.50</td>
					</tr>
					<tr>
						<td>M&amp;Ms</td>
						<td class="mint-text">$0.50</td>
					</tr>
				</table>
				<div class="item-pricing">
					<p class="mint-text">$2.99</p>
					<p class="remove-from-cart">remove from cart</p>
				</div>
				<table>
					<tr>
						<td>Blueberry Icecream</td>
						<td class="mint-text">$1.99</td>
					</tr>
				</table>
				<div class="item-pricing">
					<p class="mint-text">$1.99</p>
					<p class="remove-from-cart">remove from cart</p>
				</div>
				<table id="prices">
					<tr>
						<td class="pink-text">Subtotal</td>
						<td class="price mint-text">$4.98</td>
					</tr>
					<tr>
						<td class="pink-text">Tax</td>
						<td class="price mint-text">+$0.49</td>
					</tr>
					<tr>
						<td class="pink-text">Delivery</td>
						<td class="price mint-text">+$1.00</td>
					</tr>
				</table>
				<table id="price-total">
					<tr>
						<td class="pink-text">Total</td>
						<td class="price mint-text">$6.47</td>
					</tr>
				</table>
				
			</div>
		</div>
		<div class="center">
			<a href="/checkout" class="button" draggable="false">Check Out</a>
		</div>
	</div>

	<!-- internal script -->
	<script type="text/javascript" src="/js/script.js"></script>
</body>

</html>