import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Person.dart';

class PersonCard extends StatelessWidget {
  final Person person;
  Function delete;

  PersonCard({this.person, this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(14),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Center(
              child: Text(person.name),
            ),
            SizedBox(
              height: 6,
            ),
            Center(
              child: Text(person.age.toString()),
            ),
            SizedBox(
              height: 6,
            ),
            IconButton(
              onPressed: delete,
              icon: Icon(
                Icons.delete,
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}
