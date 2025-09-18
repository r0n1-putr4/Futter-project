import 'package:flutter/material.dart';
import 'package:roni/pindah/hal_tiga.dart';

class HalDua extends StatelessWidget {
  const HalDua({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("Berikut Halaman Dua"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/halSatu');
              },
              child: Text("Halaman Satu"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (_) => HalTiga(
                          "2412345789",
                          "Roni Putra",
                          "rn.putra@pnp.ac.id",
                          "082334563453",
                        ),
                  ),
                );
              },
              child: Text("Halaman Tiga"),
            ),
          ],
        ),
      ),
    );
  }
}
