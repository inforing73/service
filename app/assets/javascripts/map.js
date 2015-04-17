var el = $('#map');
var map;

function enableScrollingWithMouseWheel() {
    map.setOptions({ scrollwheel: true });
}

function disableScrollingWithMouseWheel() {
    map.setOptions({ scrollwheel: false });
}

function init() {
    map = new google.maps.Map(el[0], {
        zoom: 10,
        center: new google.maps.LatLng(47.49840560, 19.04075779),
        scrollwheel: false // disableScrollingWithMouseWheel as default
    });

    google.maps.event.addListener(map, 'mousedown', function(){
        enableScrollingWithMouseWheel()
    });
}

google.maps.event.addDomListener(window, 'load', init);

$('body').on('mousedown', function(event) {
    var clickedInsideMap = $(event.target).parents('#map').length > 0;

    if(!clickedInsideMap) {
        disableScrollingWithMouseWheel();
    }
});

$(window).scroll(function() {
    disableScrollingWithMouseWheel();
});