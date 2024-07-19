import 'package:flutter/material.dart';
import 'package:splitwiseplusplus/person.dart';
import 'package:splitwiseplusplus/person_owes_widget.dart';

class FinalPage extends StatelessWidget {
  const FinalPage({super.key});

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text(
        'To Pay',
        style: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: Colors.grey),
      ),
      centerTitle: true,
      actions: const [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Icon(
            Icons.people,
            size: 35,
          ),
        ),
      ],
    ),
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 400,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for (int i = 0; i < Person.persons.length; i++)
                  PersonOwesWidget(name: Person.persons[i].name),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}