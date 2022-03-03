<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link rel="stylesheet" href="/css/checkout.css" />
<script src="https://js.stripe.com/v3/"></script>
<script src="/js/checkout.js" defer></script>
</head>

<body>
	<div id="nav-bar">
		<a href="/" draggable="false">
			<h1>"Icecream" <span class="titillium">Icecream</span> <span
				class="sacramento">icecream</span></h1>
		</a> <a href="/cart" draggable="false"><img
			src="/img/shopping-cart.png" alt="shopping-cart" class="icon"
			draggable="false" id="shopping-cart" /></a>
	</div>
	<div class="container">
		<h2 class="title-center">Check Out</h2>
		<div class="grid" id="checkout">
			<div class="border">
				<c:forEach var="order" items="${cart.orders }">
					<div>
						<p>
							<c:out value="${order.flavor.name }"></c:out>
							Icecream
						</p>
						<c:forEach var="topping" items="${order.toppings }">
							<p class="light-text add-on-item">
								+
								<c:out value="${topping.name }"></c:out>
							</p>
						</c:forEach>
					</div>
					<p class="mint-text price">
						<fmt:formatNumber value="${order.price }" type="currency"></fmt:formatNumber>
					</p>
				</c:forEach>
				<p>Tax &amp; Fees</p>
				<p class="mint-text price">
					<fmt:formatNumber value="${cart.tax + cart.deliveryFee }"
						type="currency"></fmt:formatNumber>
				</p>
				<p>Total</p>
				<p class="mint-text price">
					<fmt:formatNumber value="${cart.totalPrice }" type="currency"></fmt:formatNumber>
				</p>
			</div>
			<div class="border">
				<form id="payment-form">
					<div id="payment-element">
						<!--Stripe.js injects the Payment Element-->
					</div>
					<button id="submit">
						<div class="spinner hidden" id="spinner"></div>
						<span id="button-text">Pay now</span>
					</button>
					<div id="payment-message" class="hidden"></div>
				</form>
			</div>
		</div>

	</div>

	<!-- internal script -->
	<script type="text/javascript" src="/js/script.js"></script>
</body>

</html>