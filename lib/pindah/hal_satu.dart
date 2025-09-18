import 'package:flutter/material.dart';
import 'package:roni/pindah/hal_dua.dart';

class HalSatu extends StatelessWidget {
  const HalSatu({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => HalDua()),
              );
            },
            child: Text("Halaman Dua"),
          ),
        ],
      ),
    );
  }
}
