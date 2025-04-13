import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MapDetailPage extends StatelessWidget {
  final Map<String, dynamic> hotel;

  const MapDetailPage(this.hotel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(hotel['namaTempat'])),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(hotel['urlImage']),
              Text(
                hotel['namaTempat'],
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                hotel['harga'],
                style: TextStyle(fontSize: 16, color: Colors.red[600]),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("${hotel['rating']}", style: TextStyle(fontSize: 10)),
                  SizedBox(width: 5),
                  RatingBarIndicator(
                    rating: hotel['rating'],
                    itemBuilder:
                        (context, index) =>
                            Icon(Icons.star, color: Colors.amber),
                    itemCount: 5,
                    itemSize: 15,
                    direction: Axis.horizontal,
                  ),
                ],
              ),
              SizedBox(height: 15),
              Text(
                hotel['alamat'],
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
