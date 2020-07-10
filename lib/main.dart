import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Home()));
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
          /*
    * Flat Button
    */
//          child : FlatButton(
//        onPressed: () {},
//        child: Text(
//          "Click here",
//          style: TextStyle(
//              fontFamily: 'Roboto',
//              fontSize: 30.0,
//              color: Colors.white,
//              fontStyle: FontStyle.italic),
//        ),
//            color: Colors.blue, )),

/* RaisedButton*/
//          child: RaisedButton(
//        onPressed: () {},
//        child: Text(
//          "Click here",
//          style: TextStyle(
//              fontFamily: 'Roboto',
//              fontSize: 30.0,
//              color:Colors.white,
//              fontStyle: FontStyle.italic),
//        ),
//        color: Colors.blue,
//      )
          /*Raisedbutton.Icon()*/
//        child: RaisedButton.icon(
//          onPressed: () {
//            print("hello");
//          },
//          icon: Icon(
//            Icons.access_alarms,
//            color: Colors.white,
//          ),
//          textColor: Colors.white,
//          label: Text("Set Alarm"),
//          color: Colors.amber,
//        ),
          /*IconBotton*/
          child: IconButton(
              onPressed: () {
                print('hello bhai saahab');
              },
              icon: Icon(
                Icons.access_time,
                color: Colors.blue,
                size: 60,
              ))),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.access_alarm,
            color: Colors.blue,
            size: 60,
          ),
          backgroundColor: Colors.transparent,
          onPressed: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
