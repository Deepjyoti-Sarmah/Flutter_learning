import 'package:flutter/material.dart';
import 'package:tutorial/utils/constants.dart';
import '../widgets/drawer/drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePageSB extends StatelessWidget {
  // final TextEditingController _nameController = TextEditingController();
  // var myText = "Change me";

  // void initState() {
  //   super.initState();
  //   getData();
  // }

  Future getData() async {
    var url = "https://jsonplaceholder.tyicode.com/photos";
    var data;

    var res = await http.get(Uri.parse(url));
    data = jsonDecode(res.body);
    print(data);
    // setState(() {});
    // getData();
    return data;
  }

  Stream<List<String>> getStreamData() {
    var data = Stream<List<String>>.fromIterable(
        [List<String>.generate(10, (index) => "Item $index")]);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: AppBar(
        title: Text("Awsome App"),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Constants.prefs.setBool("loggedIn", false);
              Navigator.pushReplacementNamed(context, "/login");
            },
          )
        ],
      ),
      body: StreamBuilder(
        stream: getStreamData(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Center(
                child: Text("fetch something"),
              );
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Center(
                  child: Text("Some error occured"),
                );
              }
              return ListView.builder(
                // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //   crossAxisCount: 2,
                // ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(snapshot.data[index]),
                    ),
                  );
                },
                itemCount: snapshot.data.length,
              );
          }
        },
      ),
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // myText = _nameController.text;
          // setState(() {});
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}