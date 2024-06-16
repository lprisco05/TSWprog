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
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="includes/header.jsp"%>
</head>
<body>
	<%@include file="includes/NavBar.jsp"%>

	<div class="container">
		<div class="card w-50 mx-auto my-5">
			<div class="card-header text-center">User Login</div>
			<div class="card-body">
				<form action="user-login" method="post" id="login-form">

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
