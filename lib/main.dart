import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController controller;
  TextEditingController controller2;
  String text1 = '';
  bool ischecked = false;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    controller2 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Wigets"),
          centerTitle: true,
          backgroundColor: Colors.red[600]),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Enter something'),
              controller: controller2,
              onSubmitted: (String str) {
                setState(() {
                  text1 = controller2.text;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Enter something'),
              controller: controller,
              onSubmitted: (String str) {
                setState(() {
                  text1 += controller2.text + " " + controller.text;
                });
              },
            ),
          ),
          Text(text1),
          Checkbox(
            tristate: true,
            checkColor: Colors.white,
            activeColor: Colors.blue,
            focusColor: Colors.red,
            value: ischecked,
            onChanged: (bool checked) {
              setState(() {
                this.ischecked = checked;
              });
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Text("+"), backgroundColor: Colors.red[600], onPressed: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void dispose() {
    controller.dispose();
    controller2.dispose();
    super.dispose();
  }
}
