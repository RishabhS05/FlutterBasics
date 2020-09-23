import 'package:flutter/material.dart';
import 'package:wigets_app_demo/screen_second.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String value = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Wigets"),
          centerTitle: true,
          backgroundColor: Colors.red[600]),
      body: Center(
          child: Text(
        "hello I am center Wiget ${value}",
        style: TextStyle(
            fontFamily: 'Roboto', fontSize: 30.0, fontStyle: FontStyle.italic),
      )),
      floatingActionButton: FloatingActionButton(
          child: Text("+"),
          backgroundColor: Colors.red[600],
          onPressed: () async {
            value = await Navigator.push(
                context,
                MaterialPageRoute<String>(
                    builder: (context) => SecondScreen()));
            setState(() {});
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
