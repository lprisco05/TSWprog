<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<%@page import="arduinoTSW.model.*"%>
<%@page import="arduinoTSW.dao.*"%>
</head>
<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
	if (request.getSession().getAttribute("carta") != null) {
		response.sendRedirect("orders.jsp");
	}

} else {
	response.sendRedirect("login.jsp");
}
%>

<!DOCTYPE html>
<html lang="it">
<head>
<meta charset="ISO-8859-1">
<title>Payment Form</title>
<style>
body {
	background-color: lightblue;
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 180vh;
}

form {
	background: white;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	max-width: 400px;
	width: 100%;
}

h1, h2 {
	color: #333;
}

p {
	margin-bottom: 15px;
}

input[type="text"], input[type="number"], input[type="date"], input[type="password"],
	select {
	width: calc(100% - 22px);
	padding: 10px;
	margin-top: 5px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

input[type="submit"] {
	background-color: #4CAF50;
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

input[type="submit"]:hover {
	background-color: #45a049;
}

hr {
	margin: 20px 0;
	border: 0;
	border-top: 1px solid #ccc;
}
</style>
<script src="JavaScript/ccvalidation.js" defer></script>
</head>


<body>
	<form action="CashOut" method="post">
		<h1>Inserisci dati pagamento</h1>
		<p>I campi obbligatori sono seguiti da *</p>
		<h3>Informazioni di Contatto</h3>
		<p>
			Nome:* <input type="text" name="nome" id="nome" required>
		</p>
		<p>
			Cognome:* <input type="text" name="cognome" required>
		</p>
		<p>
			Indirizzo:* <input type="text" name="indirizzo" required>
		</p>
		<p>
			Città:* <input type="text" name="citta" required>
		</p>
		<p>
			CAP:* <input type="text" name="cap" required>
		</p>
		<p>
			Telefono: <input type="text" name="tel">
		</p>
		<hr>
		<h3>Informazioni di Pagamento</h3>
		<p>
			Tipo di Carta:* <select name="card_type" id="card_type" required>
				<option value="">--- Seleziona un tipo di carta ---</option>
				<option value="visa">Visa</option>
				<option value="rupay">Rupay</option>
				<option value="master card">Master Card</option>
			</select>
		</p>
		Numero della Carta:*
		<p>
			 <input type="tel" name="card_number" id="card_number"
				placeholder="xxxx-xxxx-xxxx-xxxx"
				pattern="[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{4}" maxlength="19"
				required>
		</p>
		<p>
			Data di Scadenza:* <input type="date" name="exp_date" id="exp_date"
				required>
		</p>
		<p>
			CVV:* <input type="password" name="CVV" id="CVV" maxlength="3"
				pattern="\d{3}" required>
		</p>

		<div class="container">
			<label for="myCheckbox">Ricordami:</label> <input type="checkbox"
				id="rembemberCard">
		</div>

		<div class="text-xcenter">
			<button type="submit" class="btn btn-primary">Conferma</button>
		</div>
	</form>
</body>
</html>
