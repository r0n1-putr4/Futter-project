import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Set<Marker> markers = {};

  void _singleMarker() {
    markers.add(
      Marker(
        markerId: MarkerId("Tempat 1, Sumbar"),
        position: LatLng(-0.9485196050120748, 100.3609429170195),
        infoWindow: InfoWindow(title: 'Kota Padang, Sumbar', snippet: 'Padang'),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _singleMarker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(-0.9472813143938821, 100.36326840320734),
          zoom: 16,
        ),
        //compass and gesture
        zoomGesturesEnabled: true,
        tiltGesturesEnabled: true,
        rotateGesturesEnabled: true,
        scrollGesturesEnabled: true,
        markers: markers,
      ),
    );
  }
}
