
$(window).load(function() {
  loadScript();
});

var map;

function initialize() {

  var mapOptions = {
          center: new google.maps.LatLng(37.7889849, -122.4031839),
          zoom: 16,
          mapTypeId: google.maps.MapTypeId.NORMAL,
          panControl: true,
          scaleControl: false,
          streetViewControl: true,
          overviewMapControl: true,
          scrollwheel: false,
        };
        // initializing map
        map = new google.maps.Map(document.getElementById("map-canvas"),mapOptions);

        var marker = new google.maps.Marker({
          position: {
            lat: 37.7889849,
            lng: -122.4031839
          },
          map: map
        });
}



function loadScript() {
	console.log("map loading ...");
  var script = document.createElement('script');
  script.type = 'text/javascript';

  script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp' +
    '&libraries=drawing'+
    '&callback=initialize';
  document.body.appendChild(script);
}
