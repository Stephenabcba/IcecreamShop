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
<link rel="stylesheet" href="/css/newForm.css" />
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
		<form:form action="/flavors/new" method="post" modelAttribute="flavor" id="newFlavorForm" enctype="multipart/form-data">
			<h2>Create a New Flavor!</h2>
	    	<form:errors path="name" class="alert border" element="p" delimiter="</p><p class='alert border'>"/>
	    	<form:errors path="price" class="alert border" element="p" delimiter="</p><p class='alert border'>"/>
	    	<form:errors path="description" class="alert border" element="p" delimiter="</p><p class='alert border'>"/>
	    	<form:errors path="file" class="alert border" element="p" delimiter="</p><p class='alert border'>"/>
	    	<c:if test="${fileError!=null }">
	    		<p class="alert border"><c:out value="${fileError}"/></p>
	    	</c:if>
		    <p>
		        <form:label path="name">Flavor:</form:label>
		        <form:input class="border" path="name" placeholder="Chocolate"/>
		    </p>
		    <p>
		        <form:label path="price">Price:</form:label>
		        <form:input class="border" type="number" step="0.01" path="price" value="1.99"/>
		    </p> 
		    <p>
		        <form:label path="description">Description:</form:label>
		        <form:textarea class="border" path="description" rows="5" placeholder="Made with love and care"/>
		    </p>   
		    <div>
		    	<label for="image" class="button">Upload Image!</label>
		    	<input type="file" name="image" id="image" accept="image/png, image/jpeg"/>
		    </div>
			<button class="button">Create Icecream Flavor!</button>
		</form:form>
	</div>

	<!-- internal script -->
	<script type="text/javascript" src="/js/script.js"></script>
</body>
</html>