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
				<c:choose>
					<c:when test="${cart != null && !cart.orders.isEmpty()}">
						<c:forEach var="order" items="${cart.orders }">
							<table>
								<tr>
									<td><c:out value="${order.flavor.name }"></c:out> Icecream</td>
									<td class="mint-text price"><fmt:formatNumber value="${order.flavor.price }" type="currency"></fmt:formatNumber> </td>
								</tr>
								<c:forEach var="topping" items="${order.toppings}">
									<tr>
										<td class="light-text add-on-item"><c:out value="${topping.name }"></c:out> </td>
										<td class="mint-text price"><fmt:formatNumber value="${topping.price }" type="currency"></fmt:formatNumber> </td>
									</tr>
								</c:forEach>
							</table>
							<div class="item-pricing">
								<p class="mint-text"><fmt:formatNumber value="${order.price }" type="currency"></fmt:formatNumber></p>
								<form action="/removeFromCart" method="POST">
									<button class="remove-from-cart" value="${order.id }" name="orderId">remove from cart</button>
								</form>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<p>There are no items in your cart.</p>
					</c:otherwise>
				</c:choose>
				
				<table id="prices">
					<tr>
						<td class="pink-text">Subtotal</td>
						<c:choose>
							<c:when test="${cart == null }">
							<td class="price mint-text"><fmt:formatNumber value="${0 }" type="currency"></fmt:formatNumber></td>
							</c:when>
							<c:otherwise>
							<td class="price mint-text"><fmt:formatNumber value="${cart.subTotal }" type="currency"></fmt:formatNumber></td>
							</c:otherwise>
						</c:choose>
					</tr>
					<tr>
						<td class="pink-text">Tax</td>
						<c:choose>
							<c:when test="${cart == null }">
							<td class="price mint-text">+<fmt:formatNumber value="${0 }" type="currency"></fmt:formatNumber></td>
							</c:when>
							<c:otherwise>
							<td class="price mint-text">+<fmt:formatNumber value="${cart.tax }" type="currency"></fmt:formatNumber></td>
							</c:otherwise>
						</c:choose>
					</tr>
					<tr>
						<td class="pink-text">Delivery</td>
						<c:choose>
							<c:when test="${cart == null || cart.orders.isEmpty()}">
							<td class="price mint-text">+<fmt:formatNumber value="${0 }" type="currency"></fmt:formatNumber></td>
							</c:when>
							<c:otherwise>
							<td class="price mint-text">+<fmt:formatNumber value="${cart.deliveryFee }" type="currency"></fmt:formatNumber></td>
							</c:otherwise>
						</c:choose>
					</tr>
				</table>
				<table id="price-total">
					<tr>
						<td class="pink-text">Total</td>
						<c:choose>
							<c:when test="${cart == null || cart.orders.isEmpty()}">
							<td class="price mint-text"><fmt:formatNumber value="${0 }" type="currency"></fmt:formatNumber></td>
							</c:when>
							<c:otherwise>
							<td class="price mint-text"><fmt:formatNumber value="${cart.totalPrice }" type="currency"></fmt:formatNumber></td>
							</c:otherwise>
						</c:choose>
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