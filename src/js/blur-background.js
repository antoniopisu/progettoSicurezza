$(document).ready(function () {
    
    var backgroundImage = $('body').css('background-image');

    $('#petsRow').prepend('<div class="blur-background" style="background-image: ' + backgroundImage + '"></div>');
});

