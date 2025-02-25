import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class ListBuilderJson extends StatefulWidget {
  const ListBuilderJson({super.key});

  @override
  State<ListBuilderJson> createState() => _ListBuilderJsonState();
}

class _ListBuilderJsonState extends State<ListBuilderJson> {
  late List dataJson;
  var loading = false;

  Future<void> fetchData() async {
    setState(() {
      loading = true; //ketika proses get data set loading nya true
    });

    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts/');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      setState(() {
        dataJson = jsonDecode(response.body);
        //proses get data berhasil , loading di set false
        loading = false;
      });

      print("Request Success");
      // for (var item in dataJson) {
      //   print('ID: ${item['userId']}, Name: ${item['title']}');
      // }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("data"),
      ),
      body: loading ? Center(child: CircularProgressIndicator()) : ListView.builder(
        itemCount: dataJson == null ? 0 : dataJson.length,
        itemBuilder: (context,index){
          return Card(
            child: Column(
              children: [
                Text(dataJson[index]['title']),
                Text(dataJson[index]['body']),
              ],
            ),
          );
        },
      ),
    );
  }
}
