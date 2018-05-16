function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var landAddress = document.getElementById('land_address');

    if (landAddress) {
      var autocomplete = new google.maps.places.Autocomplete(landAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(landAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
