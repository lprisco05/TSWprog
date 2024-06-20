<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="arduinoTSW.model.Product"%>
<%@page import="arduinoTSW.dao.ProductDao"%>
<%@page import="arduinoTSW.connection.DbCon"%>
<%@page import="java.sql.Connection"%>

<%@page import="arduinoTSW.model.*"%>


<%
User auth = (User) request.getSession().getAttribute("auth");

//Ottieni l'ID del prodotto dalla richiesta
int productId = Integer.parseInt(request.getParameter("id"));

//Connessione al database e recupero del prodotto
Connection conn = DbCon.getConnection();
ProductDao productDao = new ProductDao(conn);
Product product = productDao.getSingleProduct(productId);


if (product == null) {
	response.sendRedirect("index.jsp");
	return;
}

else if (auth != null) {

	if (!auth.getAdmin()) {
		response.sendRedirect("index.jsp");
	} 
	request.setAttribute("auth", auth);

} else {
	response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Product</title>
<%@include file="includes/header.jsp"%>
</head>
<body>
	<%@include file="includes/NavBar.jsp"%>

	<div class="container">
		<h2 class="my-4">Edit Product</h2>
		<form action="update-product" method="post">
			<input type="hidden" name="id" value="<%=product.getId()%>">

			<div class="form-group">
				<label for="name">Product Name:</label> <input type="text"
					class="form-control" id="name" name="name"
					value="<%=product.getName()%>" required>
			</div>

			<div class="form-group">
				<label for="price">Price:</label> <input type="number"
					class="form-control" id="price" name="price"
					value="<%=product.getPrice()%>" step="0.01" required>
			</div>

			<div class="form-group">
				<label for="category">Category:</label> <input type="text"
					class="form-control" id="category" name="category"
					value="<%=product.getCategory()%>" required>
			</div>

			<div class="form-group">
				<label for="image">Image URL:</label> <input type="text"
					class="form-control" id="image" name="image"
					value="<%=product.getImage()%>" required>
			</div>

			<button type="submit" class="btn btn-primary">Update Product</button>
		</form>

		<form action="delete-product" method="post" style="margin-top: 20px;">
			<input type="hidden" name="id" value="<%=product.getId()%>">
			<button type="submit" class="btn btn-danger">Delete Product</button>
		</form>

	</div>

	<%@include file="includes/footer.jsp"%>
</body>
</html>
