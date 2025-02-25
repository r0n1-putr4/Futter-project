import 'package:flutter/material.dart';

class StyleTextIcons extends StatelessWidget {
  const StyleTextIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //div kotak
        color: Colors.blue,
        width: 200.0,
        height: 100.0,
        child: Center(
          // Icons
          child: Icon(Icons.favorite,color: Colors.white),
          // Text
          // child: Text(
          //   "Example Style, Text and Icons",
          //   style: TextStyle(color: Colors.white, fontFamily: "Serif"),
          // ),
        ),
      ),
    );
  }
}
