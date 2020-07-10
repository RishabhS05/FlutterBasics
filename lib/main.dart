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
          child: Image.network(
              'https://homepages.cae.wisc.edu/~ece533/images/airplane.png')
//          child: Image(
//        image: NetworkImage(
//            'https://homepages.cae.wisc.edu/~ece533/images/airplane.png'),
//      )
          ),
      floatingActionButton: FloatingActionButton(
          child: Center(
            child: Image.asset('assets/profile.png'),
//              child: Image(
//            image: AssetImage('assets/profile.png'),
//          )
          ),
          backgroundColor: Colors.red[600],
          onPressed: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
