<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Icecream</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
</head>
<body>
	<div class="d-flex justify-content-between align-items-center p-4">
		<h1>Icecream</h1> 
		<img src="/img/shopping-cart.png" alt="shopping-cart" style="width:50px;" />
	</div>
	<div class="container pt-5">
		<div class="row mb-5" style="height:300px;">
			<div class="col" >
				<div class="card h-100">
					<img src="/img/chocolate.jpg" alt="chocolate-icecream" class="card-img-top h-75" />
					<div class="card-body">Chocolate</div>
				</div>
			</div>
			<div class="col">
				<div class="card h-100">
					<img src="/img/cookies-and-cream.jpg" alt="cookies-and-cream-icecream" class="card-img-top h-75"/>
					<div class="card-body">Cookies &amp; Cream</div>
				</div>
			</div>
			<div class="col">
				<div class="card h-100">
					<img src="/img/strawberry.jpg" alt="strawberry-icecream" class="card-img-top h-75"/>
					<div class="card-body">Strawberry</div>
				</div>
			</div>
			<div class="col">
				<div class="card h-100">
					<img src="/img/vanilla.png" alt="vanilla-icecream" class="card-img-top h-75"/>
					<div class="card-body">Vanilla</div>
				</div>
			</div>
		</div>
		<div class="row mb-5" style="height:300px;">
			<div class="col">
				<div class="card h-100">
					<img src="/img/pineapple.jpg" alt="pineapple-icecream" class="card-img-top" style="height:240px;"/>
					<div class="card-body h-25">Pineapple</div>
				</div>
			</div>
			<div class="col">
				<div class="card h-100">
					<img src="/img/milk-tea.jpg" alt="milk-tea-icecream" class="card-img-top" style="height:240px;"/>
					<div class="card-body">Milk Tea</div>
				</div>
			</div>
			<div class="col">
				<div class="card h-100">
					<img src="/img/caramel.jpg" alt="caramel-icecream" class="card-img-top" style="height:240px;"/>
					<div class="card-body">Caramel</div>
				</div>
			</div>
			<div class="col">
				<div class="card h-100">
					<img src="/img/matcha.jpg" alt="matcha-icecream" class="card-img-top" style="height:240px;"/>
					<div class="card-body">Matcha</div>
				</div>
			</div>
		</div>

	</div>

	<!-- For any Bootstrap that uses JS or jQuery-->
	<script src="/webjars/jquery/jquery.min.js"></script>
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	<!-- internal script -->
	<script type="text/javascript" src="/js/script.js"></script>
</body>
</html>
