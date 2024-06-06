<%@page import="arduinoTSW.connection.DbCon"%>
<%@page import="arduinoTSW.model.*"%>
<%@page import="arduinoTSW.dao.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.text.DecimalFormat"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
request.getSession().removeAttribute("op");

DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);

} else {
	response.sendRedirect("login.jsp");
}

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;
if (cart_list != null) {
	ProductDao pDao = new ProductDao(DbCon.getConnection());
	cartProduct = pDao.getCartProducts(cart_list);
	double total = pDao.getTotalCartPrice(cart_list);
	request.setAttribute("cart_list", cart_list);
	request.setAttribute("total", total);
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>carrello</title>
<%@include file="includes/header.jsp"%>
<!--da spostare questo css in file a parte-->

<style type="text/css">
.table tbody td {
	vertical-align: middle;
}

.btn-incre, .btn-decre {
	box-shadow: none;
	font-size: 15px;
}

.vertical-buttons {
	display: flex;
	flex-direction: column;
	align-items: center;
}

.vertical-buttons .btn {
	display: block;
	padding: 0;
	line-height: 0;
}
</style>
</head>
<body>
	<%@include file="includes/NavBar.jsp"%>

	<div class="container">
		<div class="d-flex py-3">
			<h3>Total Price: $ ${ (total > 0)?dcf.format(total):0 }</h3>
			<a class="mx-3 btn btn-primary" href="cart-check-out">CheckOut</a>
		</div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Price</th>
					<th scope="col">Buy Now</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>
				<%
				if (cart_list != null) {
					for (Cart c : cartProduct) {
				%>

				<tr>
					<td><%=c.getName()%></td>
					<td><%=c.getCategory()%></td>
					<td><%=dcf.format(c.getPrice())%></td>
					<td>
						<form method="post" class="form-inline" action="order-now">
							<input type="hidden" name="id" value=<%=c.getId()%>
								class="form-import">
							<div class="form-group d-flex justify-content-between">
								<input type="text" name="quantity" class="form-control"
									value=<%=c.getQuantity()%> readonly
									style="width: 40px; height: 30px">
								<div class="vertical-buttons" role="group">
									<a class="btn btn-sm btn-incre"
										href="quantity-inc-dec?action=inc&id=<%=c.getId()%>"><i
										class="fas fa-plus-square"></i></a> <a
										class="btn btn-sm btn-decre"
										href="quantity-inc-dec?action=dec&id=<%=c.getId()%>"><i
										class="fas fa-minus-square"></i></a>
								</div>
							</div>
							<div
								style="width: 20px; height: 20px; background-color: transparent; border: 1px solid transparent;"></div>
							<button type="submit" class="btn btn-primary btn-sm">Buy</button>
						</form>
					</td>
					<td><a class="btn btn-sm btn-danger"
						href="remove-from-cart?id=<%=c.getId()%>">Remove</a></td>
				</tr>
				<%
				}
				}
				%>

			</tbody>
		</table>
	</div>


	<%@include file="includes/footer.jsp"%>
</body>
</html>