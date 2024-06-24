<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="arduinoTSW.model.Product" %>
<%@page import="arduinoTSW.dao.ProductDao" %>
<%@page import="arduinoTSW.connection.DbCon" %>
<%@page import="java.sql.Connection" %>
<%@page import="arduinoTSW.model.*" %>


<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
    if(!auth.getAdmin())
    		response.sendRedirect("index.jsp");
    request.setAttribute("auth", auth);

} else {
    response.sendRedirect("login.jsp");
}




%>
<!DOCTYPE html>
<html>
<head>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">

<meta charset="ISO-8859-1">
<title>Add Product</title>
<%@include file="includes/header.jsp" %>
<link rel = "stylesheet" href = "FileCSS/add-productSTYLE.css">
</head>
<body>
<%@include file="includes/NavBar.jsp" %>

<div class="container">
    <h2 class="my-4">Add Product</h2>
    <form action="add-product" method="post">
        <input type="hidden" name="id" >

        <div class="form-group">
            <label for="name">Product Name:</label>
            <input type="text" class="form-control" id="name" name="name" required>
        </div>

        <div class="form-group">
            <label for="price">Price:</label>
            <input type="number" class="form-control" id="price" name="price" step="0.01" required>
        </div>

        <div class="form-group">
            <label for="category">Category:</label>
            <input type="text" class="form-control" id="category" name="category" required>
        </div>

        <div class="form-group">
            <label for="image">Image URL:</label>
            <input type="text" class="form-control" id="image" name="image" required>
        </div>

        <button type="submit" class="btn btn-primary">Add Product</button>
    </form>
    


</div>

<%@include file="includes/footer.jsp" %>
</body>
</html>
