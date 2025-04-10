import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final List<Marker> _marker = [];
  final List<Marker> _markerList = [
    Marker(
      markerId: MarkerId("Tempat 1, Sumbar"),
      position: LatLng(-0.9485196050120748, 100.3609429170195),
      infoWindow: InfoWindow(
        title: 'Kota Padang, Sumbar',
        snippet: 'Padang',
      ),
    ),
    Marker(
      markerId: MarkerId("Tempat 1, Sumbar"),
      position: LatLng(-0.9452317941385855, 100.36321441807704),
      infoWindow: InfoWindow(
        title: 'Kota Padang, Sumbar',
        snippet: 'Padang',
      ),
    ),
  ];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_addMarkers();
    _marker.addAll(_markerList);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(-0.9472813143938821, 100.36326840320734),
          zoom: 16,
        ),
        mapType: MapType.normal,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        markers: Set<Marker>.of(_markerList),
      ),
    );
  }
}
