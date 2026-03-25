import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  List<Map<String, dynamic>> listSepeda = [
    {
      "gambar":
          "https://down-id.img.susercontent.com/file/id-11134207-7rase-m3u5qsneo7wve4@resize_w900_nl.webp",
      "nama_produk":
          "Sepeda lipat 16 18 20 evergreen 7 speed 1 speed mortein 123 122DB",
      "harga": "Rp1.250.000",
      "terjual": 100,
      "lokasi": "Jakarta",
      "rating": 4.0,
      "deskripsi":
          "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut l",
    },
    {
      "gambar":
          "https://down-id.img.susercontent.com/file/id-11134207-8224w-mhu0x374g8p060@resize_w900_nl.webp",
      "nama_produk":
          "Sepeda lipat 16 18 20 evergreen 7 speed 1 speed mortein 123 122DB",
      "harga": "Rp1.250.000",
      "terjual": 100,
      "lokasi": "Jakarta",
      "rating": 4.0,
      "deskripsi":
          "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut l",
    },
    {
      "gambar":
      "https://down-id.img.susercontent.com/file/id-11134207-7r98r-lx276kz3nsrfc4@resize_w900_nl.webp",
      "nama_produk":
      "Sepeda lipat 16 18 20 evergreen 7 speed 1 speed mortein 123 122DB",
      "harga": "Rp1.250.000",
      "terjual": 100,
      "lokasi": "Jakarta",
      "rating": 4.0,
      "deskripsi":
      "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut l",
    },
    {
      "gambar":
      "https://down-id.img.susercontent.com/file/id-11134207-8224w-mhu0x374g8p060@resize_w900_nl.webp",
      "nama_produk":
      "Sepeda lipat 16 18 20 evergreen 7 speed 1 speed mortein 123 122DB",
      "harga": "Rp1.250.000",
      "terjual": 100,
      "lokasi": "Jakarta",
      "rating": 4.0,
      "deskripsi":
      "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut l",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: listSepeda.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (context, index) {
          Map<String, dynamic> item = listSepeda[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10),
                      ),
                      child: Image(
                        image: NetworkImage(item['gambar']),
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(item['nama_produk'],maxLines: 1,overflow: TextOverflow.ellipsis,),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
