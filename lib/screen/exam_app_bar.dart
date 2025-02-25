import 'package:flutter/material.dart';

class ExamAppBar extends StatelessWidget {
  const ExamAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Icon(Icons.home, color: Colors.white),
        title: Center(
          child: Text("Roni Putra", style: TextStyle(color: Colors.white)),
        ),
        // title: Text("Roni Putra", style: TextStyle(color: Colors.white)),
        actions: [Icon(Icons.search, color: Colors.white)],
      ),
    );
  }
}
