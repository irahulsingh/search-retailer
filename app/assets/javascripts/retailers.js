$(document).ready(function(){
  initAutocomplete();
});

function initAutocomplete() {
  var input = document.getElementById('location-autocomplete');
  var options = {
    types: ['geocode']
  };

  autocomplete = new google.maps.places.Autocomplete(input, options);
}
