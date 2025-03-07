import 'package:flutter/material.dart';

class ListViewExam extends StatefulWidget {
  const ListViewExam({super.key});

  @override
  State<ListViewExam> createState() => _ListViewExamState();
}

class _ListViewExamState extends State<ListViewExam> {
  List<Map<String, dynamic>> listBerita = [
    {
      "judul": "Judul Berita satu",
      "tanggal": "11 Maret 2025",
      "gambar": "berita1.jpeg",
    },
    {
      "judul": "Judul Berita Dua",
      "tanggal": "12 Maret 2025",
      "gambar": "berita2.jpeg",
    },
    {
      "judul": "Judul Berita Tiga",
      "tanggal": "13 Maret 2025",
      "gambar": "berita3.jpeg",
    },
    {
      "judul": "Judul Berita Empat",
      "tanggal": "14 Maret 2025",
      "gambar": "berita4.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: listBerita.length,
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 3,
              child: Row(
                children: [
                  Image.network(
                    "images/${listBerita[index]['gambar']}",
                    width: 80, // Adjust width
                    height: 80, // Adjust height
                    fit: BoxFit.cover,
                    alignment: Alignment.topLeft,
                  ),
                  SizedBox(width: 10),
                  Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        listBerita[index]['judul'],
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 24),
                        softWrap: true, // Ensures text wraps
                        overflow:
                        TextOverflow
                            .visible, // Ensures text is shown fully
                      ),
                      Text(
                        listBerita[index]['tanggal'],
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
