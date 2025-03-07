import 'package:flutter/material.dart';

class CustomeGrid extends StatefulWidget {
  const CustomeGrid({super.key});

  @override
  State<CustomeGrid> createState() => _CustomeGridState();
}

class _CustomeGridState extends State<CustomeGrid> {
  List<Map<String, dynamic>> listMovie = [
    {"judul": "Ciao Alberto", "gambar": "movie1.jpg", "harga": 45000},
    {"judul": "The Simson", "gambar": "movie2.png", "harga": 57000},
    {"judul": "Jungle Cruise", "gambar": "movie3.jpg", "harga": 65000},
    {"judul": "Home Alone", "gambar": "movie4.jpg", "harga": 70000},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: listMovie.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 columns
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 0.7, // Adjust based on your design
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Navigate to detail page (if needed)
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "images/${listMovie[index]["gambar"]}",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: Colors.black),
                    ),
                    child: Column(
                      children: [
                        Text(
                          listMovie[index]["judul"],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text("Rp. ${listMovie[index]["harga"]}"),
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
