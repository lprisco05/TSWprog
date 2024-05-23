<%@page import="java.util.*" %>
<%@page import="arduinoTSW.connection.DbCon" %>
<%@page import="arduinoTSW.model.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    User auth =(User) request.getSession().getAttribute("auth");
    if(auth!=null){
    	request.setAttribute("auth",auth);
    }
    
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");

    if(cart_list != null){
    	request.setAttribute("cart_list",cart_list);
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
	<%@include file="includes/NavBar.jsp" %>

	<div class="container">
		<div class="card w-50 mx-auto my-5">
			<div class="card-header text-center">User Login</div>
			<div class="card-body">
				<form action="user-login" method="post">
				
					<div class="form-group">
						<label>Email Address</label> <input type="email"
							class="form-control" name="login-email"
							placeholder="Enter your Email" required>

					</div>

					<div class="form-group">
						<label>Password</label> <input type="password"
							class="form-control" name="login-password"
							placeholder="**********" required>

					</div>

					<div class="text-xcenter">
						<button type="submit" class="btn btn-primary">Login</button>
					</div>

				</form>
			</div>
		</div>
	</div>
	<%@include file="includes/footer.jsp"%>
</body>
</html>