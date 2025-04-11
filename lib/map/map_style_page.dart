import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapStylePage extends StatefulWidget {
  const MapStylePage({super.key});

  @override
  State<MapStylePage> createState() => _MapStylePageState();
}

class _MapStylePageState extends State<MapStylePage> {
  String? _currentMapStyle;

  Future<void> _loadMapStyle(String path) async {
    String style = await rootBundle.loadString(path);
    setState(() {
      _currentMapStyle = style;
    });
  }

  void _loadStyle(){
    _currentMapStyle == null ?  _loadMapStyle('assets/map_style.json') : _currentMapStyle = null;
  }

  void _loadDefaultStyle() => _loadMapStyle('assets/map_style.json');

  void _clearStyle() => setState(() => _currentMapStyle = null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Style')),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(-0.9472813143938821, 100.36326840320734),
              zoom: 15,
            ),
            style: _currentMapStyle,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  FloatingActionButton(
                    onPressed: _loadDefaultStyle,
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    backgroundColor: Colors.green,
                    child: const Icon(Icons.dark_mode, size: 36.0),
                  ),
                  SizedBox(height: 16.0),
                  FloatingActionButton(
                    onPressed: _clearStyle,
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    backgroundColor: Colors.green,
                    child: const Icon(Icons.map, size: 36.0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
