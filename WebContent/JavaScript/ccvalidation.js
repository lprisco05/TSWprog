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
        const expDate = expDateInput.value;
        const cvv = cvvInput.value;

        // Regular expressions
        const lettersOnlyPattern = /^[a-zA-Z]+$/;
        const addressPattern = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d\s,.-]+$/;
        const numbersOnlyPattern = /^\d+$/;

        // Clear previous error messages
        document.getElementById('nome-error').textContent = '';
        document.getElementById('cognome-error').textContent = '';
        document.getElementById('indirizzo-error').textContent = '';
        document.getElementById('cap-error').textContent = '';
        document.getElementById('tel-error').textContent = '';
        document.getElementById('card-type-error').textContent = '';
        document.getElementById('card-number-error').textContent = '';
        document.getElementById('exp-date-error').textContent = '';
        document.getElementById('cvv-error').textContent = '';

        let isValid = true;

        // Check Nome (letters only and not empty)
        if (nome.trim() === '') {
            document.getElementById('nome-error').textContent = 'Il nome e obbligatorio.';
            isValid = false;
        } else if (!lettersOnlyPattern.test(nome)) {
            document.getElementById('nome-error').textContent = 'Il nome deve contenere solo lettere.';
            isValid = false;
        }

        // Check Cognome (letters only and not empty)
        if (cognome.trim() === '') {
            document.getElementById('cognome-error').textContent = 'Il cognome e obbligatorio.';
            isValid = false;
        } else if (!lettersOnlyPattern.test(cognome)) {
            document.getElementById('cognome-error').textContent = 'Il cognome deve contenere solo lettere.';
            isValid = false;
        }

        // Check Indirizzo (not empty and matches pattern)
        if (indirizzo.trim() === '') {
            document.getElementById('indirizzo-error').textContent = 'L\'indirizzo e obbligatorio.';
            isValid = false;
        } else if (!addressPattern.test(indirizzo) || indirizzo.length < 10) {
            document.getElementById('indirizzo-error').textContent = 'L\'indirizzo deve contenere almeno una lettera, un numero, e deve essere lungo almeno 10 caratteri. Sono ammessi spazi, virgole, punti e trattini.';
            isValid = false;
        }

        // Check CAP (not empty and numbers only)
        if (cap.trim() === '') {
            document.getElementById('cap-error').textContent = 'Il CAP e obbligatorio.';
            isValid = false;
        } else if (!numbersOnlyPattern.test(cap)) {
            document.getElementById('cap-error').textContent = 'Il CAP deve contenere solo numeri.';
            isValid = false;
        }

        // Check Telefono (if not empty, numbers only)
        if (telefono && !numbersOnlyPattern.test(telefono)) {
            document.getElementById('tel-error').textContent = 'Il telefono deve contenere solo numeri.';
            isValid = false;
        }

        // Check card number length (not empty)
        if (cardNumber.trim() === '') {
            document.getElementById('card-number-error').textContent = 'Il numero della carta e obbligatorio.';
            isValid = false;
        } else if (cardNumber.length !== 19) {
            document.getElementById('card-number-error').textContent = 'Il numero della carta deve essere di 16 cifre.';
            isValid = false;
        }

        // Check expiration date (not empty and valid date)
        if (expDate.trim() === '') {
            document.getElementById('exp-date-error').textContent = 'La data di scadenza e obbligatoria.';
            isValid = false;
        } else {
            const [expYear, expMonth] = expDate.split('-');
            const expDateObj = new Date(expYear, expMonth - 1);
            const today = new Date();
            today.setHours(0, 0, 0, 0);  // Clear the time part

            if (expDateObj < today) {
                document.getElementById('exp-date-error').textContent = 'La data di scadenza non puo essere nel passato.';
                isValid = false;
            }
        }

        // Check CVV (not empty and 3 digits)
        if (cvv.trim() === '') {
            document.getElementById('cvv-error').textContent = 'Il CVV e obbligatorio.';
            isValid = false;
        } else if (!/^\d{3}$/.test(cvv)) {	
            document.getElementById('cvv-error').textContent = 'Il CVV deve essere un numero a 3 cifre.';
            isValid = false;
        }

        if (!isValid) {
            event.preventDefault();
        }
    });
});
