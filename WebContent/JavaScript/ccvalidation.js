	document.getElementById('nome').focus();


document.addEventListener('DOMContentLoaded', function() {
	const form = document.querySelector('form');
	const nomeInput = document.querySelector('input[name="nome"]');
	const cognomeInput = document.querySelector('input[name="cognome"]');
	const indirizzoInput = document.querySelector('input[name="indirizzo"]');
	const capInput = document.querySelector('input[name="cap"]');
	const telInput = document.querySelector('input[name="tel"]');
	const cardNumberInput = document.getElementById('card_number');
	const expDateInput = document.getElementById('exp_date');
	const cvvInput = document.getElementById('CVV');
	const rememberCheckbox = document.getElementById('myCheckbox');
	
	


	document.getElementById('card_number').addEventListener('input', function (e) {
    var target = e.target;
    var input = target.value.replace(/\D/g, '').substring(0,16);
    var cardNumber = input.match(/.{1,4}/g);
    
    if (cardNumber !== null) {
        target.value = cardNumber.join('-');
    } else {
        target.value = '';
    }
});

	form.addEventListener('submit', function(event) {
		const nome = nomeInput.value;
		const cognome = cognomeInput.value;
		const indirizzo = indirizzoInput.value;
		const cap = capInput.value;
		const telefono = telInput.value;
		const cardNumber = cardNumberInput.value;
		const expDate = new Date(expDateInput.value);
		const cvv = cvvInput.value;

		// Regular expressions
		const lettersOnlyPattern = /^[a-zA-Z]+$/;
		const addressPattern = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d\s,.-]+$/; // Improved regex for address
		const numbersOnlyPattern = /^\d+$/;

		// Check Nome and Cognome (letters only)
		if (!lettersOnlyPattern.test(nome)) {
			alert('Il nome deve contenere solo lettere.');
			event.preventDefault();
			return;
		}
		if (!lettersOnlyPattern.test(cognome)) {
			alert('Il cognome deve contenere solo lettere.');
			event.preventDefault();
			return;
		}

		// Check Indirizzo 
		if (!addressPattern.test(indirizzo) || indirizzo.length < 10) {
			alert('L\'indirizzo deve contenere almeno una lettera, un numero, e deve essere lungo almeno 10 caratteri. Sono ammessi spazi, virgole, punti e trattini.');
			event.preventDefault();
			return;
		}

		// Check CAP and Telefono (numbers only)
		if (!numbersOnlyPattern.test(cap)) {
			alert('Il CAP deve contenere solo numeri.');
			event.preventDefault();
			return;
		}
		if (telefono && !numbersOnlyPattern.test(telefono)) {
			alert('Il telefono deve contenere solo numeri.');
			event.preventDefault();
			return;
		}



		// Check card number length
		if (cardNumber.length !== 19) {
			console.log('cc')
			alert('Il numero della carta deve essere di 16 cifre, hai inserito' + cardNumber.length + 'cifre');
			event.preventDefault();
			return;
		}

		// Check expiration date
		const today = new Date();
		if (expDate < today) {
			alert('La data di scadenza non può essere nel passato.');
			event.preventDefault();
			return;
		}

		// Check CVV
		const cvvPattern = /^\d{3}$/;
		if (!cvvPattern.test(cvv)) {
			alert('Il CVV deve essere un numero a 3 cifre.');
			event.preventDefault();
			return;
		}
		
		
		
	});


});
