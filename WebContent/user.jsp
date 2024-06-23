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
        var newPasswordError = document.getElementById("new-password-error");
        var form = document.querySelector("form");

        form.addEventListener("submit", function(event) {
            newPasswordError.textContent = ""; // Resetta il messaggio di errore

            if (newPassword.value !== confirmPassword.value) {
                newPasswordError.textContent = "Le password non corrispondono";
                event.preventDefault(); // Blocca l'invio del form se le password non corrispondono
            } else if (newPassword.value.length < 6) {
                newPasswordError.textContent = "La nuova password deve essere almeno 6 caratteri";
                event.preventDefault(); // Blocca l'invio del form se la password è troppo corta
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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">

<meta charset="UTF-8">
<title>Dettagli Utente</title>
<%@include file="includes/header.jsp"%>
<%@include file="includes/NavBar.jsp"%>


<link rel = "stylesheet" href = "FileCSS/userSTYLE.css">
</head>
<body>
	<div class="container">
		<h1>Dettagli Utente</h1>
		<div class="user-details">
			<h4 class="nome">Nome: <%=auth.getName()%></h4>
			<h4 class="email">Email: <%=auth.getEmail()%></h4>
		</div>
		<div class="change-password">
			<h2>Cambia Password</h2>
			<form action="ChangePasswordServlet" method="post">
				<label for="new-password">Nuova Password:</label>
				<input type="password" id="new-password" name="newPassword" required><br>
				<span id="new-password-error" class="error-message"></span><br>
				<label for="confirm-password">Conferma Password:</label>
				<input type="password" id="confirm-password" name="confirmPassword" required><br>
				<button type="submit">Modifica password</button>
			</form>
		</div>
	</div>
</body>
</html>
