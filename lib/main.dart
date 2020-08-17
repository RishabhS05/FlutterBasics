import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mjpeg/flutter_mjpeg.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IPScreen(),
    );
  }
}

class IPScreen extends StatelessWidget {
  String ip = "";
  TextEditingController ipTextControlller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wifi IP Address"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Text("Enter IP Address"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: ipTextControlller,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                child: Text("submit"),
                onPressed: () {
                  if (ipTextControlller.text.contains("http") ||
                      ipTextControlller.text.contains("https")) {
                    ip = ipTextControlller.text;
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => MyHomePage(ip: ip)));
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends HookWidget {
  String ip;

  MyHomePage({this.ip});

  @override
  Widget build(BuildContext context) {
    final isRunning = useState(true);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Mjpeg( fit: BoxFit.fill,
            isLive: isRunning.value,
            stream: ip,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Row(
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  isRunning.value = !isRunning.value;
                },
                child: Text('Toggle'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
