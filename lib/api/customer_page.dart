import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'model_customer.dart';

class CustomerPage extends StatefulWidget {
  const CustomerPage({super.key});

  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  Produk? produk;

  Future<void> fetchProduk() async {
    try {
      http.Response hasil = await http.get(
        Uri.parse("http://10.79.176.108:3006/tes/3"),
        headers: {},
      );
      final data = json.decode(hasil.body);
      setState(() {
        produk = Produk.fromJson(data['produk']);
      });
    } catch (e) {
      print("Kesalahan ${e}");
      // logger.d("Kesalahan ${e} ${ApiConfig.baseUrl}/kontens?judul=${judul}");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchProduk();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Produk")),
      body:
          produk == null
              ? Center(child: CircularProgressIndicator())
              : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("ID: ${produk!.id}"),
                    Text("Username: ${produk!.username}"),
                    Text("Password: ${produk!.password}"),
                    Text("Nama: ${produk!.nama}"),
                    Text("Alamat: ${produk!.alamat}"),
                    Text("Telepon: ${produk!.telepon}"),
                  ],
                ),
              ),
    );
  }
}
