<%@page import="java.util.*"%>
<%@page import="arduinoTSW.connection.DbCon"%>
<%@page import="arduinoTSW.model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
request.getSession().removeAttribute("op");

User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");

if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
}
%>




<!DOCTYPE html>
<html>
<head>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap"
	rel="stylesheet">

<meta charset="ISO-8859-1">



<title>Pagina di Login</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<%@include file="includes/header.jsp"%>
<meta name="viewport"
	content="width = device-width, initial-scale = 1.0">
<link rel="stylesheet" href="LoginStyle.css">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">

		<div class="container">
			<a class="navbar-brand" href="index.jsp">Arduino Buy</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a class="nav-link"
						href="index.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="cart.jsp">Cart
							<span class="badge badge-danger px-1">${ cart_list.size() }</span>
					</a></li>

				</ul>
			</div>
		</div>
	</nav>

	<div class="container">
		<div class="card w-50 mx-auto my-5">
			<div class="card-header text-center">User Login</div>
			<div class="card-body">
				<form id="login-form">

					<div class="form-group">
						<label>Email Address</label> <input type="text"
							class="form-control" name="login-email" id="email-input"
							placeholder="Enter your Email">
						<div id="email-error" class="text-danger"></div>
					</div>

					<div class="form-group">
						<label>Password</label> <input type="password"
							class="form-control" name="login-password"
							placeholder="**********">
						<div id="password-error" class="text-danger"></div>
					</div>

					<div>
						<button type="submit" class="btn btn-primary" name="login-button">Login</button>
					</div>
				</form>

				New User?<br>
				<button id="register-button" class="btn btn-primary"
					name="register-button">Register</button>
			</div>
		</div>
	</div>

	<script src="JavaScript/loginvalidation.js"></script>

	<%@include file="includes/footer.jsp"%>
</body>

</html>
