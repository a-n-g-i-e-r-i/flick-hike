// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

function initMap() {
  map.mapTypes.set(customMapTypeId, customMapType);
  map.setMapTypeId(customMapTypeId);
}

function initMap() {
  var customMapType = new google.maps.StyledMapType([
    {
      stylers: [
        {hue: '#000040'},
        {visibility: 'simplified'},
        {gamma: 0.5},
        {weight: 0.5}
      ]
    },
    {
      elementType: 'labels',
      stylers: [{visibility: 'off'}]
    },
    {
      featureType: 'water',
      stylers: [{color: '#000040'}]
    }
  ], {
    name: 'Custom Style'
  });
  var customMapTypeId = 'custom_style';
  var directionsService = new google.maps.DirectionsService;
  var directionsDisplay = new google.maps.DirectionsRenderer;
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 12,
    center: {lat: 37.7833, lng: -122.431297},  // San Francisco
    mapTypeControlOptions: {
      mapTypeIds: [google.maps.MapTypeId.ROADMAP, customMapTypeId]
    }
  });

  var infoWindow = new google.maps.InfoWindow({map: map});

  map.mapTypes.set(customMapTypeId, customMapType);
  map.setMapTypeId(customMapTypeId);

  directionsDisplay.setMap(map);
  directionsDisplay.setPanel(document.getElementById('right-panel'));

  // **************************************************************
  // Get user's location using HTML5 geolocation.
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var pos = {
        lat: position.coords.latitude,
        lng: position.coords.longitude
      };

      infoWindow.setPosition(pos);
      infoWindow.setContent('current location');
      map.setCenter(pos);
      document.getElementById('submit').addEventListener('click', function() {
        calculateAndDisplayRoute(directionsService, directionsDisplay, pos);
      });
    }, function() {
      handleLocationError(true, infoWindow, map.getCenter());
    });
  } else {
    // Browser doesn't support Geolocation
    handleLocationError(false, infoWindow, map.getCenter());
  }
  // **************************************************************
}

function handleLocationError(browserHasGeolocation, infoWindow, pos) {
  infoWindow.setPosition(pos);
  infoWindow.setContent(browserHasGeolocation ?
                        'Error: The Geolocation service failed.' :
                        'Error: Your browser doesn\'t support geolocation.');
}

function calculateAndDisplayRoute(directionsService, directionsDisplay, pos) {
  var waypts = [];
  var checkboxArray = document.getElementById('waypoints');
  for (var i = 0; i < checkboxArray.length; i++) {
    if (checkboxArray.options[i].selected) {
      waypts.push({
        location: checkboxArray[i].value,
        stopover: true
      });
    }
  }

  directionsService.route({
    origin: pos,
    destination: pos,
    // destination: document.getElementById('end').value,
    waypoints: waypts,
    optimizeWaypoints: true,
    travelMode: google.maps.TravelMode.WALKING
  }, function(response, status) {
    if (status === google.maps.DirectionsStatus.OK) {
      directionsDisplay.setDirections(response);
      var route = response.routes[0];
      var summaryPanel = document.getElementById('directions-panel');
      summaryPanel.innerHTML = '';
      // For each route, display summary information.
      // for (var i = 0; i < route.legs.length; i++) {
      //   var routeSegment = i + 1;
      //   summaryPanel.innerHTML += '<p class="accent-text">Flick Hike Leg ' + routeSegment +
      //       '</p>';
      //   summaryPanel.innerHTML += '<span class="context-text">start </span><span>' + route.legs[i].start_address + '</span><br>';
      //   summaryPanel.innerHTML += '<span class="context-text">end </span><span>' + route.legs[i].end_address + '</span><br>';
      //   summaryPanel.innerHTML += '<span class="context-text">distance </span><span>' + route.legs[i].distance.text + '</span><hr>';
      // }
    } else {
      window.alert('Directions request failed due to ' + status);
    }
  });
}

google.maps.event.addDomListener(window, 'load', initMap);
