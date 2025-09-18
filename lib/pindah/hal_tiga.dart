import 'package:flutter/material.dart';

class HalTiga extends StatelessWidget {
  final String nim;
  final String nama;
  final String email;
  final String hp;
  const HalTiga(this.nim,this.nama,this.email,this.hp,{super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("Biodata Mahasiswa"),
            SizedBox(height: 15,),
            Text("NIM : $nim"),
            SizedBox(height: 15,),
            Text("Nama : $nama"),
            SizedBox(height: 15,),
            Text("Email : $email"),
            SizedBox(height: 15,),
            Text("HP : $hp"),
          ],
        ),
      ),
    );
  }
}
