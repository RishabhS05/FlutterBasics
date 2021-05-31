import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatelessWidget {
  static const platform = const MethodChannel('web_view');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Wigets"), centerTitle: true, backgroundColor: Colors.red[600]),
      body: Center(
          child: Text(
        "hello I am center Wiget",
        style: TextStyle(fontFamily: 'Roboto', fontSize: 30.0, fontStyle: FontStyle.italic),
      )),
      floatingActionButton: FloatingActionButton(child: Text("+"), backgroundColor: Colors.red[600], onPressed: openWebView),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Future openWebView() async {
    await platform.invokeMethod('openWebView');
  }
}
