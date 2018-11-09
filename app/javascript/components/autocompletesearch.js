function autocompletesearch() {
  document.addEventListener("DOMContentLoaded", function() {
    var searchAddress = document.getElementById('query');

    if (searchAddress) {
      var autocomplete = new google.maps.places.Autocomplete(query, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(query, 'keydown', function(e) {
        if (e.key === "Enter") {
          //e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocompletesearch };
