import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:roni/map/custom_box_map.dart';

class MapProject extends StatefulWidget {
  const MapProject({super.key});

  @override
  State<MapProject> createState() => _MapProjectState();
}

class _MapProjectState extends State<MapProject> {
  final CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();

  final List<Map<String, dynamic>> _listHotel = [
    {
      'namaTempat': 'Wisma Ayank',
      'urlImage':
          'https://lh3.googleusercontent.com/p/AF1QipMjSUIBkrBJiLuuGCeU2MOUF48HwkOjm5U-8oSv=w408-h306-k-no',
      'harga': 'Rp. 150.000',
      'lat': -0.944713233061033,
      'lng': 100.41347778770545,
      'rating':4.0
    },
    {
      'namaTempat': 'Falah Residence Syariah',
      'urlImage':
          'https://lh3.googleusercontent.com/p/AF1QipOWVP17HRBIkPmMsZYl4zFIOJN1vtCS1bkKIJgt=w408-h272-k-no',
      'harga': 'Rp. 170.000',
      'lat': -0.9435368127474888,
      'lng': 100.39824221327348,
      'rating':3.5
    },
  ];

  Set<Marker> _createMarkers() {
    Set<Marker> markers = {};
    for (var hotel in _listHotel) {
      final LatLng koordinat = LatLng(hotel['lat'], hotel['lng']);
      markers.add(
        Marker(
          markerId: MarkerId(hotel['namaTempat']),
          position: koordinat,
          // infoWindow: InfoWindow(title: 'Kota Padang, Sumbar', snippet: 'Padang'),
          onTap: () {
            _customInfoWindowController.addInfoWindow!(
              CustomBoxMap(
                urlImage: hotel['urlImage'],
                namaTempat: hotel['namaTempat'],
                harga: hotel['harga'],
                rating: hotel['rating'],
              ),
              koordinat,
            );
          },
        ),
      );
    }

    return markers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(-0.946283232836479, 100.39463665459901),
              zoom: 13,
            ),
            // markers: Set<Marker>.of(_markerList),
            markers: _createMarkers(),
            onMapCreated: (controller) {
              _customInfoWindowController.googleMapController = controller;
            },
          ),
          CustomInfoWindow(
            controller: _customInfoWindowController,
            height: 200,
            width: 200,
            offset: 50,
          ),
        ],
      ),
    );
  }
}
