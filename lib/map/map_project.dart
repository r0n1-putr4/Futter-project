import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:roni/map/custom_box_map.dart';
import 'package:roni/map/map_detail_page.dart';

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
          'images/hotel1.jpeg',
      'harga': 'Rp. 150.000',
      'lat': -0.944713233061033,
      'lng': 100.41347778770545,
      'rating': 4.0,
      'alamat':
          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata',
    },
    {
      'namaTempat': 'Falah Residence Syariah',
      'urlImage':
          'images/hotel2.jpeg',
      'harga': 'Rp. 170.000',
      'lat': -0.9435368127474888,
      'lng': 100.39824221327348,
      'rating': 3.5,
      'alamat':
          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata',
    },
  ];

  String? _currentMapStyle;

  Set<Marker> _createMarkers() {
    Set<Marker> markers = {};
    for (var hotel in _listHotel) {
      final LatLng koordinat = LatLng(hotel['lat'], hotel['lng']);
      markers.add(
        Marker(
          markerId: MarkerId(hotel['namaTempat']),
          position: koordinat,
          onTap: () {
            _customInfoWindowController.addInfoWindow!(
              CustomBoxMap(
                urlImage: hotel['urlImage'],
                namaTempat: hotel['namaTempat'],
                harga: hotel['harga'],
                rating: hotel['rating'],
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => MapDetailPage(hotel)),
                  );
                },
              ),
              koordinat,
            );
          },
        ),
      );
    }

    return markers;
  }

  MapType _currentMapType = MapType.normal;

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType =
          _currentMapType == MapType.normal
              ? MapType.satellite
              : MapType.normal;
    });
  }

  Future<void> _loadMapStyle(String path) async {
    String style = await rootBundle.loadString(path);
    setState(() {
      _currentMapStyle = style;
    });
  }

  void _clearStyle() => setState(() => _currentMapStyle = null);

  void _loadDarkStyle() => _loadMapStyle('assets/map_style_dark.json');

  void _loadRetroStyle() => _loadMapStyle('assets/map_style_retro.json');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(-0.946283232836479, 100.39463665459901),
              zoom: 12.8,
            ),
            // markers: Set<Marker>.of(_markerList),
            markers: _createMarkers(),
            onMapCreated: (controller) {
              _customInfoWindowController.googleMapController = controller;
            },
            onTap: (position) => _customInfoWindowController.hideInfoWindow!(),
            mapType: _currentMapType,
            style: _currentMapStyle,
          ),
          Positioned(
            bottom: 16,
            left: 16,
            child: Column(
              children: [
                FloatingActionButton(
                  onPressed: _onMapTypeButtonPressed,
                  materialTapTargetSize: MaterialTapTargetSize.padded,
                  backgroundColor: Colors.green,
                  child:
                      _currentMapType == MapType.normal
                          ? const Icon(
                            Icons.map,
                            size: 36.0,
                            color: Colors.white,
                          )
                          : const Icon(
                            Icons.satellite_alt,
                            size: 36.0,
                            color: Colors.white,
                          ),
                ),
                SizedBox(height: 16.0),
                FloatingActionButton(
                  onPressed: _clearStyle,
                  materialTapTargetSize: MaterialTapTargetSize.padded,
                  backgroundColor: Colors.green,
                  child: const Icon(
                    Icons.sunny,
                    size: 36.0,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16.0),
                FloatingActionButton(
                  onPressed: _loadDarkStyle,
                  materialTapTargetSize: MaterialTapTargetSize.padded,
                  backgroundColor: Colors.green,
                  child: const Icon(Icons.dark_mode, size: 36.0),
                ),
                SizedBox(height: 16.0),
                FloatingActionButton(
                  onPressed: _loadRetroStyle,
                  materialTapTargetSize: MaterialTapTargetSize.padded,
                  backgroundColor: Colors.green,
                  child: const Icon(
                    Icons.location_city,
                    size: 36.0,
                    color: Colors.yellow,
                  ),
                ),
              ],
            ),
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
