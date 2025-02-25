import 'package:flutter/material.dart';

class CardParsing extends StatelessWidget {
  const CardParsing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Icon(Icons.home, color: Colors.white),
        title: Text(
          "Card dan Parsing data",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            CardData(
              icon: Icons.wifi,
              text: "Bluetooth",
              warnaIcon: Colors.blue,
            ),
            CardData(
              icon: Icons.bluetooth,
              text: "Wifi",
              warnaIcon: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}

class CardData extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color warnaIcon;

  CardData({
    super.key,
    required this.icon,
    required this.text,
    required this.warnaIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Card(
          child: Column(children: [Icon(icon, color: warnaIcon), Text(text)]),
        ),
      ],
    );
  }
}
