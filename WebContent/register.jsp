<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Registration</title>
<%@include file="includes/header.jsp"%>
</head>
<body>
	<%
	String auth = null;
	%>
	<%@include file="includes/NavBar.jsp"%>

	<div class="container">
		<div class="card w-50 mx-auto my-5">
			<div class="card-header text-center">User Registration</div>
			<div class="card-body">
				<form action="registration" method="post" id="registration-form">

					<div class="form-group">
						<label>Full Name</label> <input type="text" class="form-control"
							id="reg-name" name="login-name"
							placeholder="Enter your full name" required>
						<div id="name-error" class="text-danger"></div>
					</div>

					<div class="form-group">
						<label>Email Address</label> <input type="email"
							class="form-control" name="login-email"
							placeholder="Enter your Email" required>
						<div id="email-error" class="text-danger"></div>
					</div>

					<div class="form-group">
						<label>Password</label> <input type="password"
							class="form-control" name="login-password"
							placeholder="**********" required>
						<div id="password-error" class="text-danger"></div>
					</div>

					<div class="text-center">
						<button type="submit" class="btn btn-primary">Register</button>
					</div>

				</form>
			</div>
		</div>
	</div>
	<%@include file="includes/footer.jsp"%>
	<script src="JavaScript/registration-validation.js"></script>
</body>
</html>
