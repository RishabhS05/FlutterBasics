import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

import 'BluetoothDeviceListEntry.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  BluetoothState _bluetoothState = BluetoothState.UNKNOWN;
  List<BluetoothDevice> devices = List<BluetoothDevice>();

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state.index == 0) {
      if (_bluetoothState.isEnabled) {
        _listBondedDevice();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BlueTooth Connection")),
      body: Container(
        child: Column(
          children: <Widget>[
            SwitchListTile(
              value: _bluetoothState.isEnabled,
              title: Text("Bluetooth"),
              onChanged: (bool value) {
                future() async {
                  if (value)
                    await FlutterBluetoothSerial.instance.requestEnable();
                  else
                    await FlutterBluetoothSerial.instance.requestDisable();
                }

                future().then((_) {
                  setState(() {});
                });
              },
            ),
            ListTile(
              title: Text("Bluetooth Status"),
              subtitle: Text(_bluetoothState.toString()),
              trailing: RaisedButton(
                child: Text("Settings"),
                onPressed: () {
                  FlutterBluetoothSerial.instance.openSettings();
                },
              ),
            ),
            Expanded(
              child: ListView(
                children: devices
                    .map((_device) => BluetoothDeviceListEntry(
                          device: _device,
                          enabled: true,
                          onTap: () {
                            print("Item");
                          },
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _getState();
    _setStateListener();
    _listBondedDevice();
  }

  _listBondedDevice() {
    FlutterBluetoothSerial.instance
        .getBondedDevices()
        .then((List<BluetoothDevice> bluetoothdevices) {
      devices = bluetoothdevices;
      setState(() {});
    });
  }

  _getState() {
    FlutterBluetoothSerial.instance.state.then((state) {
      _bluetoothState = state;
      setState(() {});
    });
  }

  _setStateListener() {
    FlutterBluetoothSerial.instance
        .onStateChanged()
        .listen((BluetoothState state) {
      _bluetoothState = state;
      print("state is enabled ${state.isEnabled}");
      if (_bluetoothState.isEnabled) {
        _listBondedDevice();
      } else {
        devices.clear();
        setState(() {});
      }
    });
  }
}
