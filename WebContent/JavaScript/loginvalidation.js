document.getElementById('email-input').focus();
document.addEventListener("DOMContentLoaded", function() {
	// Seleziona il form e aggiungi un evento di submit
	const form = document.querySelector('form');
	form.addEventListener('submit', function(event) {
		// Seleziona il bottone premuto
		const submitter = event.submitter;

		// Controlla se il bottone premuto è quello di login
		if (submitter && submitter.name === 'login-button') {
			// Seleziona i campi email e password
			const emailInput = form.querySelector('input[name="login-email"]');
			const passwordInput = form.querySelector('input[name="login-password"]');

			// RegExp per validare l'email
			const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
			const emailIsValid = emailPattern.test(emailInput.value);

			// Controlla la lunghezza della password
			const passwordIsValid = passwordInput.value.length >= 6;

			// Se l'email o la password non sono validi, mostra un messaggio di errore e impedisce l'invio del form
			if (!emailIsValid || !passwordIsValid) {
				event.preventDefault(); // Impedisce l'invio del form

				// Reset error messages
				document.getElementById('email-error').textContent = '';
				document.getElementById('password-error').textContent = '';

				// Mostra messaggi di errore
				if (!emailIsValid) {
					document.getElementById('email-error').textContent = 'Please enter a valid email address.';
				}
				if (!passwordIsValid) {
					if (passwordInput.value.length == 0) {
						document.getElementById('password-error').textContent = 'Inserisci password';

					}
					else {
						document.getElementById('password-error').textContent = 'Password must be at least 6 characters long.';
					}
				}
			}
		}
	});

	// Gestisce il click del pulsante di registrazione
	const registerButton = document.querySelector('#register-button');
	registerButton.addEventListener('click', function(event) {
		event.preventDefault();
		location.href = "/Arduino_TSW/register.jsp";
	});
});
