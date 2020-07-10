import 'dart:js';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
    appBar: AppBar(
        title: Text("Wigets"),
        centerTitle: true,
        backgroundColor: Colors.red[600]),
    body: Center(
      child: Text("hello I am center Wiget"),
    ),
    floatingActionButton: FloatingActionButton(
        child: Text("+"), backgroundColor: Colors.red[600],
      onPressed: (){},
    ),
       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
  )));
}
