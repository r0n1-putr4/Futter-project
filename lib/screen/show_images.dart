import 'package:flutter/material.dart';

class ShowImages extends StatelessWidget {
  const ShowImages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Images View",style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(10)),
            Text("Komputer",style: TextStyle(fontSize: 25,color: Colors.red),),
            Padding(padding: EdgeInsets.all(10)),
            Image.asset("images/pic1.jpeg",width: 200,),
            Padding(padding: EdgeInsets.all(10)),
            Text("Komputer",style: TextStyle(fontSize: 25,color: Colors.red),),
            Padding(padding: EdgeInsets.all(10)),
            Image(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWpPNkRC0Ok3jO_qsEk7WuTfd2m-oiORoBwQ&s"),width: 200,)
          ],
        ),
      ),
    );
  }
}
