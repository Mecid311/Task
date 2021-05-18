//**owl carousel */
$(document).ready(function () {
    $(".owl-carousel").owlCarousel();
});

$('.owl-carousel').owlCarousel({
    loop: true,
    margin: 10,
    nav: true,
    dots: false,
    responsive: {
        0: {
            items: 1
        },
        600: {
            items: 2
        },
        1000: {
            items: 3
        }
    }
})

//**card-page */
$(document).ready(function (e) {

    // $('img[usemap]').rwdImageMaps();

    $('.card').delay(1800).queue(function (next) {
        $(this).removeClass('hover');
        $('a.hover').removeClass('hover');
        next();
    });
    $('.img-1').click(function (e) {
        console.log(e.pageX + " " + e.pageY);

    });


});





