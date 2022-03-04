<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login &#38; Registration</title>
<!-- for Bootstrap CSS -->
<!-- <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" /> -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto+Mono&family=Sacramento&family=Titillium+Web:wght@600&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="/css/newForm.css" />
<link rel="stylesheet" href="/css/login.css" />
<link rel="stylesheet" href="/css/style.css" />
</head>
<body>
	<div id="nav-bar">
		<a href="/" draggable="false"><h1>"Icecream" <span class="titillium">Icecream</span> <span
			class="sacramento">icecream</span></h1> </a>
		<div>
			<a href="/cart" draggable="false"><img src="/img/shopping-cart.png"
				alt="shopping-cart" class="icon" draggable="false" id="shopping-cart"/></a>
		</div>
	</div>
	<div class="container">
		<h2>Welcome!</h2>
		<p>Join our growing community.</p>
		<div class="grid" id="login-grid">
			<div class="border">
				<h2>Register</h2>
				<form:form action="/register" method="post" modelAttribute="newUser"
					class="form">
					<form:errors path="name" class="alert border" element="p"
						delimiter="</p><p class='alert border'>" />
					<form:errors path="email" class="alert border" element="p"
						delimiter="</p><p class='alert border'>" />
					<form:errors path="password" class="alert border" element="p"
						delimiter="</p><p class='alert border'>" />
					<form:errors path="passwordConfirm" class="alert border"
						element="p" delimiter="</p><p class='alert border'>" />
					<p>
						<form:label path="name">Name:</form:label>
						<form:input class="border" path="name" />
					</p>
					<p>
						<form:label path="email">Email:</form:label>
						<form:input class="border" path="email" />
					</p>
					<p>
						<form:label path="password">Password:</form:label>
						<form:input class="border" type="password" path="password" />
					</p>
					<p>
						<form:label path="passwordConfirm">Confirm Password:</form:label>
						<form:input class="border" type="password"
							path="passwordConfirm" />
					</p>
					<input type="submit" value="Register" class="button" />
				</form:form>
			</div>
			<div class="border">
				<h2>Log in</h2>
				<form:form action="/login" method="post" modelAttribute="newLogin"
					class="form">
					<form:errors path="email" id="" class="alert border" element="p"
						delimiter="</p><p class='alert border'>" />
					<form:errors path="password" id="" class="alert border" element="p"
						delimiter="</p><p class='alert border'>" />
					<p>
						<form:label path="email">Email:</form:label>
						<form:input class="border" path="email" />
					</p>
					<p>
						<form:label path="password">Password:</form:label>
						<form:input class="border" type="password" path="password" />
					</p>
					<input type="submit" value="Log In" class="button" />
				</form:form>
			</div>
		</div>
	</div>

	<!-- For any Bootstrap that uses JS or jQuery-->
	<script src="/webjars/jquery/jquery.min.js"></script>
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
