import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:matcher/matcher.dart';

void main() {
  runApp(MaterialApp(
    title: "Awsome App",
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Awsome App"),
      ),
      body: Container(
        child: Center(
          child: Text("Hi Flutter"),
        ),
      ),
    );
  }
}
