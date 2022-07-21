import 'package:flutter/material.dart';
import 'package:tutorial/pages/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Awsome App",
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
    ),
  );
}
