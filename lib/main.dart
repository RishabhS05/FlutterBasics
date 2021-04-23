import 'package:flutter/material.dart';

import 'chrome_safari_web_view.dart';
import 'new_plugin_web_view_file.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(home: ChromeSafariBrowserExampleScreen()));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Wigets"), centerTitle: true, backgroundColor: Colors.red[600]),
      body: Center(
          child: Text(
        "hello I am center Wiget",
        style: TextStyle(fontFamily: 'Roboto', fontSize: 30.0, fontStyle: FontStyle.italic),
      )),
      floatingActionButton: FloatingActionButton(child: Text("+"), backgroundColor: Colors.red[600], onPressed: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
