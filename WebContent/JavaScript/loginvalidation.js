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
                
                // Crea un elemento per mostrare il messaggio di errore
                let errorMessage = '';
                if (!emailIsValid) {
                    errorMessage += 'Please enter a valid email address.\n';
                }
                if (!passwordIsValid) {
                    errorMessage += 'Password must be at least 6 characters long.\n';
                }
                
                alert(errorMessage); // Mostra l'errore in un alert
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
