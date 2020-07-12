import 'package:flutter/material.dart';
import 'package:wigets_app_demo/PersonCard.dart';

import 'Person.dart';

void main() {
  runApp(MaterialApp(home: CustomList()));
}

class HomeListing extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeListing> {
  List<String> list = ['L1', 'L2', 'L3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
          title: Text("Listing Dynamic Data"),
          centerTitle: true,
          backgroundColor: Colors.grey[600]),
      body: Column(
        children: list.map((l) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Text(l),
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
          child: Text("+"), backgroundColor: Colors.red[600], onPressed: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class CustomList extends StatefulWidget {
  @override
  _CustomListState createState() => _CustomListState();
}

class _CustomListState extends State<CustomList> {
  List<Person> personList = [
    Person(name: 'Rishabh', age: 24),
    Person(name: 'Anuj', age: 22),
    Person(name: 'Harsh', age: 34),
    Person(name: 'Kush', age: 23)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
          title: Text("Listing Dynamic Data"),
          centerTitle: true,
          backgroundColor: Colors.grey[600]),
      body: Column(
        children: personList.map((person) => PersonCard(person: person,delete: (){
          setState(() {
            personList.remove(person);
          });
        }),).toList(),
      ),
      floatingActionButton: FloatingActionButton(
          child: Text("+"), backgroundColor: Colors.red[600], onPressed: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
