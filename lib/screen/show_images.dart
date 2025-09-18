import 'package:flutter/material.dart';

class ShowImages extends StatelessWidget {
  const ShowImages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Gambar", style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(10)),
            Text(
              "Gambar Satu",
              style: TextStyle(fontSize: 25, color: Colors.red),
            ),
            Padding(padding: EdgeInsets.all(10)),
            Image.asset("images/pic1.jpeg", width: 200),
            Padding(padding: EdgeInsets.all(10)),
            Text(
              "Gambar Dua",
              style: TextStyle(fontSize: 25, color: Colors.red),
            ),
            Image.asset("images/pic2.jpeg", width: 200),
            Padding(padding: EdgeInsets.all(10)),
            Text(
              "Gambar Menggunakan URL",
              style: TextStyle(fontSize: 25, color: Colors.red),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                "https://ti.pnp.ac.id/wp-content/uploads/2022/01/logo-ti-pnp-05-1.png",
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
