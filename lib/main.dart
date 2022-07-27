import 'package:flutter/material.dart';
import 'package:tutorial/pages/home_page.dart';
// import 'package:tutorial/pages/home_page.dart';
import 'package:tutorial/pages/login_page.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Awsome App",
      home: LoginPage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      routes: {
        "/login": ((context) => LoginPage()),
        "/home": ((context) => HomePage()),
      },
    ),
  );
}
