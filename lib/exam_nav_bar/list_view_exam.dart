import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ListViewExam extends StatefulWidget {
  const ListViewExam({super.key});

  @override
  State<ListViewExam> createState() => _ListViewExamState();
}

class _ListViewExamState extends State<ListViewExam> {
  List<Map<String, dynamic>> listBerita = [
    {
      "judul": "Statistik Bertahan Idzes Saat Venezia Imbangi Napoli",
      "isi":
          "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam er",
      "tanggal": "11 Maret 2025",
      "gambar": "images/berita1.jpeg",
      "rating": 4,
    },
    {
      "judul": "Judul Berita Dua",
      "isi":
          "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam er",
      "tanggal": "12 Maret 2025",
      "gambar": "images/berita2.jpeg",
      "rating": 3.8,
    },
    {
      "judul": "Judul Berita Tiga",
      "isi":
          "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam er",
      "tanggal": "13 Maret 2025",
      "gambar": "images/berita3.jpeg",
      "rating": 2,
    },
    {
      "judul": "Judul Berita Empat",
      "isi":
          "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam er",
      "tanggal": "14 Maret 2025",
      "gambar": "images/berita4.jpg",
      "rating": 3,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                // Aligns text to the top
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        listBerita[index]['gambar'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  // Space between image and text
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          listBerita[index]['judul'],
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 24),
                        ),
                        Text(
                          listBerita[index]['tanggal'],
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            RatingBarIndicator(
                              rating: listBerita[index]['rating'],
                              itemBuilder:
                                  (context, index) =>
                                      Icon(Icons.star, color: Colors.amber),
                              itemCount: 5,
                              itemSize: 15,
                              direction: Axis.horizontal,
                            ),
                            SizedBox(width: 20),
                          ],
                        ),
                        SizedBox(height: 5),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
