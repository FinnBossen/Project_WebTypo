$('.scroll').on("click", function (e) {
    var href = $(this).attr('href');
    $('html, body').animate({
        scrollTop: $(href).offset().top
    }, 'slow');
    e.preventDefault();

    document.getElementById("eyes").style.display = "unset";
    document.getElementById("Portal").style.display = "none";
    document.getElementById("DepthPicture").style.display = "none";
});

$('#scrollUp').on("click", function (e) {
    var href = $(this).attr('href');
    $('html, body').animate({
        scrollTop: $(href).offset().top
    }, 'slow');
    e.preventDefault();

    document.getElementById("eyes").style.display = "none";
    document.getElementById("DepthPicture").style.display = "unset";
});