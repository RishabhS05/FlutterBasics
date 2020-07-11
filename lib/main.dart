import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: HomeStateFullWidget()));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Wigets"),
          centerTitle: true,
          backgroundColor: Colors.red[600]),
      body: Center(
          child: Text(
        "hello I am center Wiget",
        style: TextStyle(
            fontFamily: 'Roboto', fontSize: 30.0, fontStyle: FontStyle.italic),
      )),
      floatingActionButton: FloatingActionButton(
          child: Text("+"), backgroundColor: Colors.red[600], onPressed: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class HomeStateFullWidget extends StatefulWidget {
  @override
  _HomeStateFullWidgetState createState() => _HomeStateFullWidgetState();
}

class _HomeStateFullWidgetState extends State<HomeStateFullWidget> {
  int x = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "StateFull widget",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: Center(
          child: Text('$x'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            x++;
          });
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
