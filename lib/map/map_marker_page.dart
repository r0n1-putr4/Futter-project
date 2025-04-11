import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapMarkerPage extends StatefulWidget {
  const MapMarkerPage({super.key});

  @override
  State<MapMarkerPage> createState() => _MapMarkerPageState();
}

class _MapMarkerPageState extends State<MapMarkerPage> {

  Set<Marker> _createMarkers() {
    Set<Marker> markers = {};
    markers.add(
      Marker(
        markerId: MarkerId("Tempat 1, Sumbar"),
        position: LatLng(-0.9485196050120748, 100.3609429170195),
        infoWindow: InfoWindow(title: 'Kota Padang, Sumbar', snippet: 'Padang'),
      ),
    );
    markers.add(
      Marker(
        markerId: MarkerId("Tempat 2, Sumbar"),
        position: LatLng(-0.9452317941385855, 100.36321441807704),
        infoWindow: InfoWindow(title: 'Kota Padang, Sumbar', snippet: 'Padang'),
      ),
    );

    return markers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(-0.9472813143938821, 100.36326840320734),
          zoom: 16,
        ),
        // markers: Set<Marker>.of(_markerList),
        markers: _createMarkers(),
      ),
    );
  }
}
