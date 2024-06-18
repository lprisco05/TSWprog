<%@page import="arduinoTSW.dao.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.*"%>
<%@page import="arduinoTSW.connection.DbCon"%>
<%@page import="arduinoTSW.model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
request.getSession().removeAttribute("op");

DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);
User auth = (User) request.getSession().getAttribute("auth");

List<Order> orders = null;

if (auth != null) {
	request.setAttribute("auth", auth);
	orders = new OrderDao(DbCon.getConnection()).userOrders(auth.getId());
} else {
	response.sendRedirect("login.jsp");
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
<title>Orders</title>
<%@include file="includes/header.jsp"%>
</head>
<body>
	<%@include file="includes/NavBar.jsp"%>

	<div class="container">
		<div class="card-header my-3">All Orders</div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Data</th>
					<th scope="col">Nome</th>
					<th scope="col">Categoria</th>
					<th scope="col">Quantità</th>
					<th scope="col">Prezzo</th>
					<th scope="col">Cancellato</th>
				</tr>
			</thead>
			<tbody>
				<%
				if (orders != null) {
					// Utilizza un Map per raggruppare gli ordini per data
					Map<String, List<Order>> ordersByDate = new HashMap<>();

					for (Order o : orders) {

						String date = o.getDate();
						if (!ordersByDate.containsKey(date)) {
					ordersByDate.put(date, new ArrayList<>());
						}
						ordersByDate.get(date).add(o);

					}

					// Itera su ciascun gruppo di ordini raggruppati per data
					for (String date : ordersByDate.keySet()) {
				%>
				<tr>
					<th colspan="6"><%=date%></th>
				</tr>
				<%
				for (Order o : ordersByDate.get(date)) {
				%>
				<tr>
					<td><%=o.getDate()%></td>
					<td><%=o.getName()%></td>
					<td><%=o.getCategory()%></td>
					<td><%=o.getQuantity()%></td>
					<td><%=dcf.format(o.getPrice())%></td>
					<td><a class="btn btn-sm btn-danger"
						href="cancel-order?id=<%=o.getOrderId()%>">Cancel</a></td>
				</tr>
				<%
				}
				}
				}
				%>
			</tbody>
		</table>



	</div>



	<%@include file="includes/footer.jsp"%>
</body>
</html>