import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AutoCompleteTextField searchTextField;
  List<String> listdummy = ["Rishabh", "Anuj", "Abhijeet", "Priyanka", "Amita"];
  TextEditingController controller = new TextEditingController();
  GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Wigets"),
          centerTitle: true,
          backgroundColor: Colors.red[600]),
      body: Center(
        child: Column(children: <Widget>[
          searchTextField = AutoCompleteTextField<String>(
            clearOnSubmit: true,
            textChanged: (text) => controller.text = text,
            textSubmitted: (text) => setState(() {
              if (text != "") {
             controller.text = text;
              }
            }),
            suggestions: listdummy,
            key: key,
            style: new TextStyle(color: Colors.black, fontSize: 16.0),
            decoration: new InputDecoration(
                suffixIcon: Container(
                  width: 85.0,
                  height: 60.0,
                ),
                contentPadding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 20.0),
                filled: true,
                hintText: 'Search Player Name',
                hintStyle: TextStyle(color: Colors.black)),
            itemSubmitted: (item) {
              setState(() => searchTextField.textField.controller.text = item);
            },
            itemFilter: (item, query) {
              return item.toLowerCase().startsWith(query.toLowerCase());
            },
            itemSorter: (a, b) {
              return a.compareTo(b);
            },
            itemBuilder: (context, item) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    item,
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                  ),
                ],
              );
            },
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
          child: Text("+"), backgroundColor: Colors.red[600], onPressed: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
