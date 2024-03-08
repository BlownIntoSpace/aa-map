/* global L */
;(function (window) {
  var imageContainerMargin = 50;  // Margin + padding
  function init (mapid) {
    var minZoom = 2
    var maxZoom = 8
    var img = [
      11352,
      15994
    ]



    // the tile layer containing the image generated with gdal2tiles --leaflet ...
    var continents = new L.tileLayer('./tiles/continent/{z}/{x}/{y}.png', {
      noWrap: true,
      attribution: 'Continents by Bailey Allen and Alec Jordan | <a href="./sources/hashtaria.jpg">Download</a>',
      maxNativeZoom:6,
      maxZoom:8
    })

    var cities = new L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png?{foo}', {
      foo: 'bar',
      attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
    })

    // create the map
    var map = new L.map(mapid, {
      center: [0, 0],
      zoom: 3,
      //scrollWheelZoom: false,
      zoomDelta: 6,
      wheelPxPerZoomLevel: 512,
      minZoom: minZoom,
      maxZoom: maxZoom,
      layers: [continents]
    })


    // assign map and image dimensions
    var rc = new L.RasterCoords(map, img)

    //map.on('zoomend', function () {
    //  if (map.getZoom() < 7 && map.hasLayer(cities)) {
    //    map.removeLayer(cities);
    //  }
    //  if (map.getZoom() >= 7 && map.hasLayer(cities) == false)
    //  {
    //    map.addLayer(cities);
    //  }
    //});


}
  init('map')
}(window))
