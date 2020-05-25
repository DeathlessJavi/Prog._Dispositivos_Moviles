/*
Método principal de la app
*/
import 'package:flutter/material.dart';
import 'package:peticiones_post/home.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Post_app",
      home: Home(),
      debugShowCheckedModeBanner: false,
    )
  );
}
