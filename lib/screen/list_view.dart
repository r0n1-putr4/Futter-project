import 'package:flutter/material.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("List Item View", style: TextStyle(color: Colors.white)),
      ),
      body: ListView(
        children: [
          DataItems(
            gambar:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWpPNkRC0Ok3jO_qsEk7WuTfd2m-oiORoBwQ&s",
            judul: "Manajemen Informatika",
          ),
          DataItems(
            gambar:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWpPNkRC0Ok3jO_qsEk7WuTfd2m-oiORoBwQ&s",
            judul: "Manajemen Informatika",
          ),
        ],
      ),
    );
  }
}

class DataItems extends StatelessWidget {
  final String gambar;
  final String judul;

  const DataItems({super.key, required this.gambar, required this.judul});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Padding(padding: EdgeInsets.all(5)),
          Image(image: NetworkImage(gambar), width: 150),
          Padding(padding: EdgeInsets.all(5)),
          Text(judul, style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
