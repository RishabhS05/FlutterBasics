import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: HomeColumn()));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Container Wigets"),
          centerTitle: true,
          backgroundColor: Colors.red[600]),
      body: Container(
        color: Colors.grey,
/*         if there is any widget the color applied becomes background color of the widget.
           ie the container automatically resize according to the added child widget
           otherwise color occupies the whole screen. */
//        padding: EdgeInsets.all(20),
//        padding: EdgeInsets.fromLTRB(20,30,40,50),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//        margin: EdgeInsets.all(40),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//        margin: EdgeInsets.fromLTRB(30,50,60,70),
        child: Text("Have a good day"),
      ),
      floatingActionButton: FloatingActionButton(
          child: Text("+"), backgroundColor: Colors.red[600], onPressed: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class HomeRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Row Widget"),
          centerTitle: true,
          backgroundColor: Colors.green[600]),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Hello"),
          FlatButton(
            onPressed: () {},
            child: Text("click here"),
            color: Colors.blue,
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(20),
            child: Text("Container Wiget"),
            color: Colors.red,
          )
        ],
      ),
    );
  }
}

class HomeColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Column Widget"),
          centerTitle: true,
          backgroundColor: Colors.green[600]),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(20),
            child: Text(
              "Red",
              style: TextCustomStyle(),
            ),
            color: Colors.blue,
          ),
          Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(20),
              child: Text("Blue", style: TextCustomStyle()),
              color: Colors.green),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(20),
            child: Text("Yellow", style: TextCustomStyle()),
            color: Colors.red,
          )
        ],
      ),
    );
  }
}

class TextCustomStyle extends TextStyle {
  @override
  // TODO: implement color
  Color get color => Colors.white;
}
