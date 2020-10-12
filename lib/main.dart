import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Container Challenge'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  double _height = 10, _width = 10;
  bool isStop = true;
  final _boxContainer = HomeContainer();

  void incrementAndDecrementheightAndwidth(
      BuildContext context, bool isSizeincreasing) async {
    if (isStop) return;
    double heightFrameRate = MediaQuery.of(context).size.height / 20;
    double widthFrameRate = MediaQuery.of(context).size.width / 20;
    if (_height >= MediaQuery.of(context).size.height &&
        _width >= MediaQuery.of(context).size.width) {
      isSizeincreasing = false;
    } else if (_height <= heightFrameRate && _width <= widthFrameRate) {
      isSizeincreasing = true;
    }
    if (isSizeincreasing) {
      _width += widthFrameRate;
      _height += heightFrameRate;
    } else {
      _width -= widthFrameRate;
      _height -= heightFrameRate;
    }
    await Future.delayed(Duration(milliseconds: 100));
    _boxContainer.inBoxSize.add(Size(_width, _height));
    incrementAndDecrementheightAndwidth(context, isSizeincreasing);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: StreamBuilder<Size>(
            stream: _boxContainer.outBoxSize,
            builder: (context, snapshot) {
              return Container(
                width: snapshot.hasData ? snapshot.data.width : 10,
                height: snapshot.hasData ? snapshot.data.height : 10,
                color: Colors.yellow,
              );
            }),
      ),
      floatingActionButton: Visibility(
        child: FloatingActionButton(
          onPressed: () {
            if (isStop)
              isStop = false;
            else {
              isStop = true;
            }

            incrementAndDecrementheightAndwidth(context, true);
          },
        ),
      ),
    );
  }
}

class HomeContainer {
  final StreamController<Size> _sizeController = StreamController<Size>();

//creating stream
  Stream<Size> get outBoxSize => _sizeController.stream;

  Sink<Size> get inBoxSize => _sizeController.sink;

  void dispose() {
    _sizeController.close();
  }
}
