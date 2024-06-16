
document.getElementById('reg-name').focus();
document.addEventListener("DOMContentLoaded", function() {
	// Seleziona il form e aggiungi un evento di submit
	const form = document.getElementById('registration-form');
	form.addEventListener('submit', function(event) {
		// Seleziona i campi nome, email e password
		const nameInput = form.querySelector('input[name="register-name"]');
		const emailInput = form.querySelector('input[name="register-email"]');
		const passwordInput = form.querySelector('input[name="register-password"]');

		// RegExp per validare l'email
		const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
		const emailIsValid = emailPattern.test(emailInput.value);

		// Controlla la lunghezza della password
		const passwordIsValid = passwordInput.value.length >= 6;

		// Controlla che il nome non sia vuoto
		const nameIsValid = nameInput.value.trim().length > 0;

		// Se uno dei campi non è valido, mostra un messaggio di errore e impedisce l'invio del form
		if (!emailIsValid || !passwordIsValid || !nameIsValid) {
			event.preventDefault(); // Impedisce l'invio del form

			// Crea un elemento per mostrare il messaggio di errore
			let errorMessage = '';
			if (!nameIsValid) {
				errorMessage += 'Please enter your full name.\n';
			}
			if (!emailIsValid) {
				errorMessage += 'Please enter a valid email address.\n';
			}
			if (!passwordIsValid) {
				errorMessage += 'Password must be at least 6 characters long.\n';
			}

			alert(errorMessage); // Mostra l'errore in un alert
		}
	});
});
