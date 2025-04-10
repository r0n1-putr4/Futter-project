import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CurrentLocPage extends StatefulWidget {
  const CurrentLocPage({super.key});

  @override
  State<CurrentLocPage> createState() => _CurrentLocPageState();
}

class _CurrentLocPageState extends State<CurrentLocPage> {
  String locationMessage = "Press the button to get location";
  String locationMessagePlace = "Press the button to get Place";
  LatLng _initialPosition = LatLng(-0.9472813143938821, 100.36326840320734);


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
     // getAddressFromLatLng(position);
      _initialPosition = LatLng(position.latitude, position.longitude);
      locationMessage =
          "Latitude: ${position.latitude}, Longitude: ${position.longitude}";
    });
    getAddressFromLatLng(position);
  }
  Future<void> getAddressFromLatLng(Position position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      Placemark place = placemarks[0];
      setState(() {
        locationMessagePlace =
        "Address: ${place.locality}, ${place.country}";
      });


      //print("Address: ${place.locality}, ${place.country}");
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Location Button")),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _initialPosition,
          zoom: 15,
        ),
        myLocationEnabled: true, // 🔵 Show the blue dot
        myLocationButtonEnabled: true, // 📍 Enable the location button
       // onMapCreated: (controller) => _controller = controller,
      ),
    );
  }
}
