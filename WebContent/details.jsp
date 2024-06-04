<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
            height: 140vh;
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
        input[type="text"],
        input[type="number"],
        input[type="date"],
        input[type="password"],
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
</head>

<body>
    <form>

		
		
        <h1>Inserisci dati pagamento</h1>
        <p>I campi obbligatori sono seguiti da *</p>
        <h3>Informazioni di Contatto</h3>
        <p>Nome:* <input type="text" name="nome" required></p>
        <p>Cognome:* <input type="text" name="cognome" required></p>
        <p>Indirizzo:* <input type="text" name="indirizzo" required></p>
        <p>Citt�:* <input type="text" name="citta" required></p>
        <p>CAP:* <input type="text" name="cap" required></p>
        <p>Telefono: <input type="text" name="tel"></p>
        <hr>
        <h3>Informazioni di Pagamento</h3>
        <p>Tipo di Carta:* 
            <select name="card_type" id="card_type" required>
                <option value="">--- Seleziona un tipo di carta ---</option>
                <option value="visa">Visa</option>
                <option value="rupay">Rupay</option>
                <option value="master card">Master Card</option>        
            </select>
        </p>
        <p>Numero della Carta:* <input type="number" name="card_number" id="card_number" required></p>
        <p>Data di Scadenza:* <input type="date" name="exp_date" id="exp_date" required></p>
        <p>CVV:* <input type="password" name="CVV" id="CVV" required></p>
        <input type="submit" value="Paga Ora">
    </form>
</body>
</html>
