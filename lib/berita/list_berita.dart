
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:roni/model/berita_model.dart';
import 'package:roni/utils/base_url.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:logger/logger.dart';

class ListBerita extends StatefulWidget {
  const ListBerita({super.key});

  @override
  State<ListBerita> createState() => _ListBeritaState();
}

class _ListBeritaState extends State<ListBerita> {
  late Future<List<Datum>?> dataJson;
  var logger = Logger();

  Future<List<Datum>?> getData() async {
    try {
      http.Response hasil = await http.get(
        Uri.parse("${ApiConfig.baseUrl}/get_berita.php"),
      );
      logger.d("Status ${beritaModelFromJson(hasil.body).success}");
      print("Status ${beritaModelFromJson(hasil.body).success}");
      return beritaModelFromJson(hasil.body).data;
    } catch (e) {
      print("Kesalahan ${e}");
    }
    return null;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataJson = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("List Berita", style: TextStyle(color: Colors.white)),
      ),
      body: FutureBuilder<List<Datum>?>(
        future: dataJson,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Terjadi kesalahan saat mengambil data"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("Tidak ada data berita"));
          } else {
            List<Datum> berita = snapshot.data!;
            return ListView.builder(
              itemCount: berita.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    elevation: 3,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // Aligns text to the top
                      children: [
                        Image.network(
                          berita[index].gambar,
                          width: 80, // Adjust width
                          height: 80, // Adjust height
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 10), // Space between image and text
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                berita[index].judul,
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 24),
                                softWrap: true, // Ensures text wraps
                                overflow:
                                    TextOverflow
                                        .visible, // Ensures text is shown fully
                              ),
                              Text(
                                berita[index].tglIndonesiaBerita,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[600],
                                ),
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  RatingBarIndicator(
                                    rating: berita[index].rating,
                                    itemBuilder:
                                        (context, index) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                    itemCount: 5,
                                    itemSize: 15,
                                    direction: Axis.horizontal,
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
