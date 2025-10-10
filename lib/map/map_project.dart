import 'package:clippy_flutter/triangle.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'map_detail_page.dart';

class MapProject extends StatefulWidget {
  const MapProject({super.key});

  @override
  State<MapProject> createState() => _MapProject();
}

class _MapProject extends State<MapProject> {
  final CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();

  MapType _mapType = MapType.normal;

  void _pilihMapType() {
    setState(() {
      _mapType =
          _mapType == MapType.normal ? MapType.satellite : MapType.normal;
    });
  }

  String? _currentTheme;

  Future<void> _loadTheme(String path) async {
    String theme = await rootBundle.loadString(path);
    setState(() {
      _currentTheme = theme;
    });
  }

  void _standardTheme() => _loadTheme('assets/theme_map/standard.json');

  void _silverTheme() => _loadTheme('assets/theme_map/silver.json');

  final koordinat = LatLng(-0.9171936793549167, 100.35451897474805);

  final List<Map<String, dynamic>> _listHotel = [
    {
      "id": "id-01",
      "nama_hotel": "Urbanview Hotel Falah Residence Syariah By RedDoorz",
      "harga": "Rp. 238.2930",
      "gambar": "assets/images/gambar_1.jpg",
      "rating": 4.5,
      "koordinat": LatLng(-0.9427817234009337, 100.3772617891464),
      "alamat":
          "Jl. Rasak, Lolong Belanti, Kec. Padang Utara, Kota Padang, Sumatera Barat",
    },
    {
      "id": "id-02",
      "nama_hotel": "OYO",
      "harga": "Rp. 77.929",
      "gambar": "assets/images/gambar_2.jpg",
      "rating": 4.0,
      "koordinat": LatLng(-0.9429533778111844, 100.39734637754376),
      "alamat":
          "6 Jl. Banio No.6, Lolong Belanti, Kec. Padang Utara, Kota Padang, Sumatera, Bara, Padang City, West Sumatra 25136",
    },
    {
      "id": "id-03",
      "nama_hotel": "Bumi",
      "harga": "Rp. 208.199",
      "gambar": "assets/images/gambar_3.jpg",
      "rating": 3.0,
      "koordinat": LatLng(-0.9427817206231481, 100.37554512585452),
      "alamat":
          "1, Beringin V No.1, RT.2/RW.5, Lolong Belanti, Padang Utara, West Sumatra 25136",
    },
  ];

  Set<Marker> _createMarkers() {
    Set<Marker> markers = {};
    for (var hotel in _listHotel) {
      markers.add(
        Marker(
          markerId: MarkerId(hotel['id']),
          position: hotel['koordinat'],
          onTap: () {
            _customInfoWindowController.addInfoWindow!(
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // === CARD UTAMA ===
                  Container(
                    width: 220,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // === GAMBAR HOTEL ===
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(16),
                          ),
                          child: Image.asset(
                            hotel['gambar'],
                            width: double.infinity,
                            height: 100,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                height: 100,
                                color: Colors.grey[300],
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.image_not_supported,
                                  color: Colors.grey[600],
                                ),
                              );
                            },
                          ),
                        ),

                        // === INFORMASI HOTEL ===
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                hotel['nama_hotel'],
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                hotel['harga'],
                                style: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 6),

                              // === RATING ===
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "${hotel['rating']}",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Icon(Icons.star, size: 13, color: Colors.yellow),
                                ],
                              ),

                              SizedBox(height: 8),

                              // === TOMBOL VIEW ===
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => MapDetailPage(hotel),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.redAccent,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    padding: EdgeInsets.symmetric(vertical: 8),
                                  ),
                                  child: Text(
                                    "VIEW",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // === SEGITIGA PENANDA (DI BAWAH CARD) ===
                  Triangle.isosceles(
                    edge: Edge.BOTTOM,
                    child: Container(color: Colors.blue, width: 25, height: 12),
                  ),
                ],
              ),
              hotel['koordinat'],
            );
          },
        ),
      );
    }
    return markers;
  }

  @override
  void dispose() {
    _customInfoWindowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(target: koordinat, zoom: 15),
            markers: _createMarkers(),

            mapType: _mapType,
            style: _currentTheme,

            onTap: (position) {
              _customInfoWindowController.hideInfoWindow!();
            },
            onCameraMove: (position) {
              _customInfoWindowController.onCameraMove!();
            },
            onMapCreated: (GoogleMapController controller) async {
              _customInfoWindowController.googleMapController = controller;
            },
          ),
          Positioned(
            bottom: 16,
            left: 16,
            child: Column(
              children: [
                FloatingActionButton(
                  onPressed: _pilihMapType,
                  materialTapTargetSize: MaterialTapTargetSize.padded,
                  backgroundColor: Colors.green,
                  child:
                      _mapType == MapType.normal
                          ? Icon(Icons.map, size: 36, color: Colors.white)
                          : Icon(
                            Icons.satellite,
                            size: 36,
                            color: Colors.white,
                          ),
                ),
                SizedBox(height: 10),
                FloatingActionButton(
                  onPressed: _standardTheme,
                  backgroundColor: Colors.green,
                  child: Icon(Icons.sunny, size: 36, color: Colors.white),
                ),
                SizedBox(height: 10),
                FloatingActionButton(
                  onPressed: _silverTheme,
                  backgroundColor: Colors.green,
                  child: Icon(
                    Icons.location_city,
                    size: 36,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          CustomInfoWindow(
            controller: _customInfoWindowController,
            width: 200,
            height: 280,
            offset: 50,
          ),
        ],
      ),
    );
  }
}
