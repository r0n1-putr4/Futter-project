import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomBoxMap extends StatelessWidget {
  final String urlImage, namaTempat, harga;
  final double rating;

  const CustomBoxMap({
    super.key,
    required this.urlImage,
    required this.namaTempat,
    required this.harga,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8)],
      ),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.network(
                urlImage,
                // Replace with your image URL
                width: 280,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  namaTempat,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("$rating", style: TextStyle(fontSize: 10)),
                    SizedBox(width: 5),
                    RatingBarIndicator(
                      rating: rating,
                      itemBuilder:
                          (context, index) =>
                              Icon(Icons.star, color: Colors.amber),
                      itemCount: 5,
                      itemSize: 15,
                      direction: Axis.horizontal,
                    ),
                  ],
                ),
                Text(
                  harga,
                  style: TextStyle(color: Colors.grey[700], fontSize: 12),
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      // Change button color
                      foregroundColor: Colors.red, // Change text color
                    ),
                    onPressed: () {},
                    child: Text("VIEW", style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    ;
  }
}
