import 'package:flutter/material.dart';

class Komputer extends StatelessWidget {
  const Komputer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(20)),
            Text("Komputer",style: TextStyle(color: Colors.red,fontSize: 25),),
            Padding(padding: EdgeInsets.all(10)),
            Icon(Icons.computer,size: 60,)
          ],
        ),
      ),
    );
  }
}
