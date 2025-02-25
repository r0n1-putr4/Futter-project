import 'package:flutter/material.dart';
import 'package:roni/screen/exam_app_bar.dart';

class NavRoute extends StatelessWidget {
  const NavRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Icon(Icons.navigation, color: Colors.white),
        title: Text(
          "Navigation dan Route",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ExamAppBar()),
                );
              },

              icon: Icon(
                Icons.add_circle,
                color: Colors.pink,
                size: 50.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ExamAppBar()),
                );
              },

              icon: Icon(
                Icons.add_circle,
                color: Colors.pink,
                size: 50.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
