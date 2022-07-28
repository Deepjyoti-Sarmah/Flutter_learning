import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutorial/pages/home_page.dart';
// import 'package:tutorial/pages/home_page.dart';
import 'package:tutorial/pages/login_page.dart';
import 'package:tutorial/utils/constants.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Awsome App",
      home: Constants.prefs.getBool("loggedIn") == true
          ? HomePage()
          : LoginPage(),
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
