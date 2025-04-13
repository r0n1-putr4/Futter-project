import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapMarkerPage extends StatefulWidget {
  const MapMarkerPage({super.key});

  @override
  State<MapMarkerPage> createState() => _MapMarkerPageState();
}

class _MapMarkerPageState extends State<MapMarkerPage> {
  final CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();

  @override
  void dispose() {
    _customInfoWindowController.dispose();
    super.dispose();
  }

  Set<Marker> _createMarkers() {
    Set<Marker> markers = {};
    markers.add(
      Marker(
        markerId: MarkerId("Tempat 1, Sumbar"),
        position: LatLng(-0.9485196050120748, 100.3609429170195),
        // infoWindow: InfoWindow(title: 'Kota Padang, Sumbar', snippet: 'Padang'),
        onTap: () {
          _customInfoWindowController.addInfoWindow!(
            _buildInfoWindow(),
            LatLng(-0.9485196050120748, 100.3609429170195),
          );
        },
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
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(-0.9472813143938821, 100.36326840320734),
              zoom: 16,
            ),
            // markers: Set<Marker>.of(_markerList),
            markers: _createMarkers(),
            onMapCreated: (controller) {
              _customInfoWindowController.googleMapController = controller;
            },
            onTap: (position) => _customInfoWindowController.hideInfoWindow!(),
          ),
          CustomInfoWindow(
            controller: _customInfoWindowController,
            height: 140,
            width: 280,
            offset: 50,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoWindow() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8)],
      ),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.network(
                'https://lh3.googleusercontent.com/p/AF1QipMjSUIBkrBJiLuuGCeU2MOUF48HwkOjm5U-8oSv=w408-h306-k-no',
                // Replace with your image URL
                width: 280,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Wisma Ayank Wisma Ayank Wisma Ayank",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Rp 150.000 · ⭐ 4.5 (149)",
                  style: TextStyle(color: Colors.grey[700], fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
