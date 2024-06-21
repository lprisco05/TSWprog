<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="arduinoTSW.connection.DbCon"%>
<%@page import="arduinoTSW.dao.ProductDao"%>
<%@page import="arduinoTSW.model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
request.getSession().removeAttribute("op");

User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}

ProductDao pd = new ProductDao(DbCon.getConnection());
List<Product> products = pd.getAllProducts();

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");

if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html>
<head>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap"
	rel="stylesheet">

<meta charset="ISO-8859-1">
<title>Home</title>
<%@include file="includes/header.jsp"%>

<link rel="stylesheet" href="IndexSTYLE.css">
</head>
<body>
	<%@include file="includes/NavBar.jsp"%>

	<div class="container">
		<div style="background-color: #4169E1" class="card-header my-3">All
			Products</div>
		<%
		if (auth != null && auth.getAdmin()) {
		%>
		<div class="mt-2">
			<a href="add-product.jsp" class="btn btn-warning">Aggiungi
				Prodotto</a>
		</div>
		<%
		}
		%>


		<div class="row">
			<%
			if (!products.isEmpty()) {

				for (Product p : products) {
					System.out.println(p.getImage());
			%>
			<div class="col-md-3 my-3">
				<div class="card w-100"
					style="width: 300px; height: 500px; background-color: #4169E1">
					<img class="card-img-top" src="product-image/<%=p.getImage()%>"
						alt="Card image cap">

					<div class="card-body">
						<h5 class="card-title"><%=p.getName()%></h5>
						<h6 class="price">
							Price: $<%=p.getPrice()%>
						</h6>
						<h6 class="category">
							Category:
							<%=p.getCategory()%>
						</h6>
						<div class="mt-3 d-flex justify-content-between ">
							<a href="add-to-cart?id=<%=p.getId()%>" class="btn btn-dark">Add
								to Cart</a> <a href="order-now?quantity=1&id=<%=p.getId()%>"
								class="btn btn-primary">Buy Now</a>
						</div>
						<%
						if (auth != null && auth.getAdmin()) {
						%>
						<div class="mt-2">
							<a href="edit-product.jsp?id=<%=p.getId()%>"
								class="btn btn-warning">Modifica</a>
						</div>
						<%
						}
						%>
					</div>
				</div>
			</div>
			<%
			}
			}
			%>
		</div>
	</div>

	<%@include file="includes/footer.jsp"%>
</body>
</html>
