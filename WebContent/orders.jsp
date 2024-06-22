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
    OrderDao orderDao = new OrderDao(DbCon.getConnection());

    // Se l'utente è admin, può vedere tutti gli ordini
    if (auth.getAdmin()) {
        String date = request.getParameter("date");
        String userEmail = request.getParameter("email");

        // Controlla se sia la data che l'email sono forniti
        if (date != null && !date.isEmpty() && userEmail != null && !userEmail.isEmpty()) {
            orders = orderDao.getOrdersByDateAndUserEmail(date, userEmail);
        } else if (date != null && !date.isEmpty()) {
            orders = orderDao.getOrdersByDate(date);
        } else if (userEmail != null && !userEmail.isEmpty()) {
            orders = orderDao.getOrdersByUserEmail(userEmail);
        } else {
            orders = orderDao.getAllOrders();
        }
    } else {
        // Altrimenti, visualizza solo i propri ordini
        orders = orderDao.userOrders(auth.getId());
    }
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

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">

<meta charset="ISO-8859-1">
<title>Orders</title>
<%@include file="includes/header.jsp"%>

<link rel = "stylesheet" href = "ordersSTYLE.css">
</head>
<body>
    <%@include file="includes/NavBar.jsp"%>

    <div class="container">
        <div class="card-header my-3">All Orders</div>
        
        <% if (auth != null && auth.getAdmin()) { %>
            <form method="GET" action="orders.jsp">
                <label for="date">Search by Date:</label>
                <input type="date" id="date" name="date">
                <label for="email">or Email:</label>
                <input type="email" id="email" name="email">
                <button type="submit">Search</button>
            </form>
        <% } %>
        
        <table style="background-color:#4169E1" class="table table-light">
            <thead>
                <tr>
                    <th scope="col">Data</th>
                    <th scope="col">Nome</th>
                    <th scope="col">Quantità</th>
                    <th scope="col">Prezzo</th>
                    <% if (auth != null && auth.getAdmin()) { %>
                        <th scope="col">Utente</th>
                    <% } %>
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
                        System.out.println(o.toString());
                %>
                <tr>
                    <td><%=o.getDate()%></td>
                    <td><%=o.getName()%></td>
                    <td><%=o.getQuantity()%></td>
                    <td><%=dcf.format(o.getTotal())%></td>
                    <% if (auth != null && auth.getAdmin()) { %>
                        <td><%=o.getUserEmailById()%></td>
                    <% } %>
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
