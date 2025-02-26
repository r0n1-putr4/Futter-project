import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:roni/model/berita_model.dart';
import 'package:roni/utils/base_url.dart';

class ListBerita extends StatefulWidget {
  const ListBerita({super.key});

  @override
  State<ListBerita> createState() => _ListBeritaState();
}

class _ListBeritaState extends State<ListBerita> {
  late Future<List<Datum>?> dataJson;

  Future<List<Datum>?> getData() async {
    try {
      http.Response hasil = await http.get(
        Uri.parse("${ApiConfig.baseUrl}/get_berita.php"),
      );

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
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    children: [
                      Image(
                        image: NetworkImage(berita[index].gambar),
                        width: 200,
                      ),
                      Expanded(child: Text(berita[index].isi, softWrap: false)),
                    ],
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
