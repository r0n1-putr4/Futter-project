import 'package:flutter/material.dart';

class ExamRowColumn extends StatelessWidget {
  const ExamRowColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Icon(Icons.home, color: Colors.white),
        title: Text("Row dan Column", style: TextStyle(color: Colors.white)),
        actions: [Icon(Icons.search, color: Colors.white)],
      ),
      body: Column(
        children: [
          Icon(Icons.wifi, size: 70, color: Colors.white),
          Icon(Icons.bluetooth, size: 70, color: Colors.white),
          Row(
            children: [
              Icon(Icons.local_pizza,size: 70,color: Colors.white,),
              Icon(Icons.cake_rounded,size: 70,color: Colors.white,),
            ],
          ),
        ],
      ),
    );
  }
}
