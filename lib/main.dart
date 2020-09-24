import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScanResult scanResult;

  // list of format that can be read by the scanner.
  static final _possibleFormats = BarcodeFormat.values.toList()
    ..removeWhere((e) => e == BarcodeFormat.unknown);

  List<BarcodeFormat> selectedFormats = [..._possibleFormats];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("QRCode Scanner Demo"),
          centerTitle: true,
          backgroundColor: Colors.blueAccent),
      body: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
        scanResult != null && scanResult.rawContent.isNotEmpty
              ? scanResult.rawContent
              : "Tap Camera buttom to scan a qrcode.",
        style: TextStyle(
              fontFamily: 'Roboto', fontSize: 20.0, fontStyle: FontStyle.italic),
      ),
          )),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.camera_enhance),
          backgroundColor: Colors.blue,
          onPressed: scan),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Future scan() async {
    try {
      var result = await BarcodeScanner.scan();

      setState(() => scanResult = result);
    } on PlatformException catch (e) {
      var result = ScanResult(
        type: ResultType.Error,
        format: BarcodeFormat.unknown,
      );

      if (e.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          result.rawContent = 'The user did not grant the camera permission!';
        });
      } else {
        result.rawContent = 'Unknown error: $e';
      }
      setState(() {
        scanResult = result;
      });
    }
  }
}
