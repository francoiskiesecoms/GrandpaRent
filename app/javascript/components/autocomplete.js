function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var grandparentAddress = document.getElementById('grandparent_address');

    if (grandparentAddress) {
      var autocomplete = new google.maps.places.Autocomplete(grandparentAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(grandparentAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
