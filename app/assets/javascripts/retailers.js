$(document).ready(function(){
    initAutocomplete();
    navigator.geolocation.getCurrentPosition(geoSuccess, geoError);
});

function initAutocomplete() {
    var input = document.getElementById('location-autocomplete');
    var options = {
        types: ['geocode']
    };
    if($(input).length) {
        autocomplete = new google.maps.places.Autocomplete(input, options);
    }
}

var startPos;
var geoSuccess = function(position) {
    startPos = position;
    llat = startPos.coords.latitude;
    llng = startPos.coords.longitude;
    setCookie('user_current_lat', llat, 1);
    setCookie('user_current_lng', llng, 1);
};

var geoError = function(error) {
    console.log('Error occurred. Error code: ' + error.code);
    // error.code can be:
    //   0: unknown error
    //   1: permission denied
    //   2: position unavailable (error response from location provider)
    //   3: timed out
};

function setCookie(cname, cvalue, exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
    var expires = 'expires=' + d.toUTCString();
    document.cookie = cname + '=' + cvalue + '; ' + expires;
}
