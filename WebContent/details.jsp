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

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">

<meta charset="ISO-8859-1">
<title>Payment Form</title>

<script src="JavaScript/ccvalidation.js" defer></script>

<link rel = "stylesheet" href = "detailsSTYLE.css">
</head>

<body>
	<form style="background-color:#4169E1" action="CashOut" method="post">
		<h1>Inserisci dati pagamento</h1>
		<p>I campi obbligatori sono seguiti da *</p>
		<h3>Informazioni di Contatto</h3>
		<p>
			Nome:* <input type="text" name="nome" id="nome">
		<div id="nome-error" class="error-message"></div>
		</p>
		<p>
			Cognome:* <input type="text" name="cognome">
		<div id="cognome-error" class="error-message"></div>
		</p>
		<p>
			Indirizzo:* <input type="text" name="indirizzo">
		<div id="indirizzo-error" class="error-message"></div>
		</p>
		<p>
			Città:* <input type="text" name="citta">
		<div id="citta-error" class="error-message"></div>
		</p>
		<p>
			CAP:* <input type="text" name="cap">
		<div id="cap-error" class="error-message"></div>
		</p>
		<p>
			Telefono: <input type="text" name="tel">
		<div id="tel-error" class="error-message"></div>
		</p>
		<hr>
		<h3>Informazioni di Pagamento</h3>
		<p>
			Tipo di Carta:* <select name="card_type" id="card_type">
				<option value="">--- Seleziona un tipo di carta ---</option>
				<option value="visa">Visa</option>
				<option value="rupay">Rupay</option>
				<option value="master card">Master Card</option>
			</select>
		<div id="card-type-error" class="error-message"></div>
		</p>
		<p>
			Numero della Carta:* <input type="tel" name="card_number"
				id="card_number" placeholder="xxxx-xxxx-xxxx-xxxx"
				pattern="[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{4}" maxlength="19">
		<div id="card-number-error" class="error-message"></div>
		</p>
		<p>
			Data di Scadenza:* <input type="month" name="exp_date" id="exp_date"
				required>
		<div id="exp-date-error" class="error-message"></div>
		</p>
		<p>
			CVV:* <input type="password" name="CVV" id="CVV" maxlength="3"
				pattern="\d{3}">
		<div id="cvv-error" class="error-message"></div>
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
