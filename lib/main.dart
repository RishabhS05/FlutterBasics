import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: HomeListing()));
}

class HomeListing extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeListing> {
  List<String>list = ['L1','L2','L3'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
          title: Text("Listing Dynamic Data"),
          centerTitle: true,
          backgroundColor: Colors.grey[600]),
      body: Column(
        children: list.map((l){
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Text(l),
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
          child: Text("+"), backgroundColor: Colors.red[600], onPressed: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
