import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapTypePage extends StatefulWidget {
  const MapTypePage({super.key});

  @override
  State<MapTypePage> createState() => _MapTypePageState();
}

class _MapTypePageState extends State<MapTypePage> {
  GoogleMapController? _controller;
  MapType _currentMapType = MapType.normal;
  String? _currentMapStyle;
  LatLng _initialPosition = LatLng(-0.9472813143938821, 100.36326840320734);
  String locationMessage = "Press the button to get location";

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

  void _loadDefaultStyle() => _loadMapStyle('assets/map_style.json');

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        locationMessage = "Location services are disabled.";
      });
      return;
    }

    // Check location permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          locationMessage = "Location permission denied.";
        });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        locationMessage = "Location permissions are permanently denied.";
      });
      return;
    }

    // Get current position
    Position position = await Geolocator.getCurrentPosition(
      locationSettings: LocationSettings(
        accuracy: LocationAccuracy.high, // New approach
      ),
    );

    setState(() {
      _initialPosition = LatLng(position.latitude, position.longitude);
      locationMessage =
      "Lat: ${position.latitude}, Long: ${position.longitude}";
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadDefaultStyle();
  //  _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(locationMessage)),
      body: Stack(
        children: [
          GoogleMap(
            style: _currentMapStyle,
            initialCameraPosition: CameraPosition(
              target: _initialPosition,
              zoom: 15,
            ),
            mapType: _currentMapType,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            // onMapCreated: (controller) => _controller = controller,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.topRight,
              child: Column(
                children: [
                  FloatingActionButton(
                    onPressed: _onMapTypeButtonPressed,
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    backgroundColor: Colors.green,
                    child: const Icon(Icons.map, size: 36.0),
                  ),
                  SizedBox(height: 16.0),
                  FloatingActionButton(
                    onPressed: _getCurrentLocation,
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    backgroundColor: Colors.green,
                    child: const Icon(Icons.map, size: 36.0),
                  ),
                  SizedBox(height: 16.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
