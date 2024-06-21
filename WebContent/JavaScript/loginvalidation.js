

document.getElementById('email-input').focus();

document.addEventListener("DOMContentLoaded", function() {
    const form = document.querySelector('#login-form');
    form.addEventListener('submit', function(event) {
        event.preventDefault(); // Impedisce l'invio del form tradizionale

        // Seleziona il bottone premuto
        const submitter = event.submitter;

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

                    } else {
                        document.getElementById('password-error').textContent = 'Password must be at least 6 characters long.';
                    }
                }
            } else {	
                // Procedi con l'invio AJAX
                $.ajax({
                    url: 'user-login',
                    method: 'POST',
                    data: {
                        'login-email' : emailInput.value,
                        'login-password' : passwordInput.value
                    },
                    success: function(response) {
                        if (response.trim() === 'success') {
                            window.location.href = 'index.jsp'; // Reindirizza alla pagina home
                        } else if (response.trim() === 'failure') {
						  document.getElementById('password-error').textContent = 'email o password errata!';

                        }
                    },
                    error: function() {
                document.getElementById('password-error').textContent = 'Errore del Server';
                    }
                });
            }
        }
    });

    const registerButton = document.querySelector('#register-button');
    registerButton.addEventListener('click', function(event) {
        event.preventDefault();
        location.href = "/Arduino_TSW/register.jsp";
    });
});
