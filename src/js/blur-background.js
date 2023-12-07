// Aspetta che il documento sia completamente caricato
$(document).ready(function () {
    // Ottieni l'immagine di sfondo del body
    var backgroundImage = $('body').css('background-image');

    // Aggiunge l'effetto di sfocatura alla lista degli animali con lo stesso sfondo del body
    $('#petsRow').prepend('<div class="blur-background" style="background-image: ' + backgroundImage + '"></div>');
});

