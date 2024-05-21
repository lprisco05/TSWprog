<%@page import="java.util.List" %>
<%@page import="arduinoTSW.connection.DbCon" %>
<%@page import="arduinoTSW.dao.ProductDao" %>
<%@page import="arduinoTSW.model.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%User auth =(User) request.getSession().getAttribute("auth");
    if(auth!=null){
    	request.setAttribute("auth",auth);
    }
    
    ProductDao pd = new ProductDao(DbCon.getConnection());
    List<Product> products = pd.getAllProducts();
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<%@include file="includes/header.jsp" %>
</head>
<body>
<%@include file="includes/NavBar.jsp" %>

<div class = "container">
<div class = "card-header my-3"> All Products</div>
<div class = "row">
<% 
	if(!products.isEmpty())
	{
		for(Product p:products)
		{
			out.println(p.getCategory());
			
		}
	}
%>
	<div class = "col-md-3">
		<div class="card w-100" style="width: 18rem;">
  			<img class="card-img-top" src="product-image/arduino.jpg" alt="Card image cap">
  			<div class="card-body">
    			<h5 class="card-title">Card title</h5>
    			<h6 class = "price"> Price: 69</h6>
    			<h6 class = "category">Category: some category </h6>
   				<div class = "mt-3 d-flex justify-content-between ">
   				<a href="#" class="btn btn-primary">Add to Cart</a>
   				<a href="#" class="btn btn-primary">Buy Now</a>
   				</div>
    			
  			</div>
	</div>
	</div>
</div>
</div>

<%@include file="includes/footer.jsp" %>
</body>
</html>