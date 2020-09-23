import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("screen 2"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text("<-"),
        backgroundColor: Colors.red[600],
        onPressed: () {
          Navigator.pop(context, "Hi");
        },
      ),
    );
  }
}
