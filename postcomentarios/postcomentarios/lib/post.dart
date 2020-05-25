import 'dart:convert';

import "package:flutter/material.dart";
import 'package:http/http.dart' as http;
import 'package:postcomentarios/comentarios.dart';

class Post extends StatefulWidget {
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
String url="https://jsonplaceholder.typicode.com/posts";
Comenta comenta;


@override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async{
    var response = await http.get(url);
    var decodedJson = jsonDecode(response.body);
    comenta = Comentarios.fromJson(decodedJson);
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post"),
        backgroundColor: Colors.white10,
        ),
        body: comenta==null ? Center(child: CircularProgressIndicator(),) : 
        GridView.count(
          crossAxisCount: 1,
          children: comenta.comentarios.map((p)=> Card(
            elevation: 3.0,
            child: Column(children: <Widget>[
              Container(height: 100,
              width: 100,
              decoration: BoxDecoration(),)
            ],),))),
      
    );
  }
}

