<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<%@ page import="arduinoTSW.dao.UserDao"%>
<%@page import="arduinoTSW.connection.DbCon"%>
<%@ page import="arduinoTSW.model.User"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.util.Base64"%>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        var newPassword = document.getElementById("new-password");
        var confirmPassword = document.getElementById("confirm-password");
        var form = document.querySelector("form");

        form.addEventListener("submit", function(event) {
            if (newPassword.value !== confirmPassword.value) {
                alert("Le password non corrispondono. Riprova.");
                event.preventDefault(); // Blocca l'invio del form se le password non corrispondono
            }
        });
    });
</script>

<%
request.getSession().removeAttribute("op");

User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);

} else {
	response.sendRedirect("login.jsp");
}

// Connessione al database

try {
	Connection con = DbCon.getConnection();

	if (con != null) {
		UserDao authDao = new UserDao(con);
}
} catch (ClassNotFoundException | SQLException e) {
	e.printStackTrace();
	out.println("Errore di connessione al database.");
}

%>

<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
<title>Dettagli Utente</title>
<%@include file="includes/header.jsp"%>

<%@include file="includes/NavBar.jsp"%>

<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
}
    label {
        width: 150px; /* Imposta la larghezza dei label */
        display: inline-block;
        text-align: left; /* Allinea il testo dei label a destra */
    }

    input[type="password"] {
        width: 200px; /* Imposta la larghezza dei campi di input */
    }

.container {
	max-width: 600px;
	margin: 50px auto;
	background-color: #fff;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1 {
	text-align: center;
}

.user-details {
	margin-top: 20px;
}

.detail {
	margin-bottom: 10px;
}

.detail label {
	font-weight: bold;
}
</style>
</head>
<body>
	<div class="container">
		<h1>Dettagli Utente</h1>
		<div class="user-details">
			<h4 class="nome">
				Nome: <%=auth.getName()%>
			</h4>
			<h4 class="email">
				Email: <%=auth.getEmail()%>
			</h4>
		</div>
		<div class="change-password">
			<h2>Cambia Password</h2>
			<form action="ChangePasswordServlet" method="post">
				<label for="new-password">Nuova Password:</label>
				<input type="password" id="new-password" name="newPassword" required><br>
				<label for="confirm-password">Conferma Password:</label>
				<input type="password" id="confirm-password" name="confirmPassword" required><br>
				<button type="submit">Modifica password</button>
			</form>
		</div>
	</div>
</body>
</html>
