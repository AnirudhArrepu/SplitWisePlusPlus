import 'package:flutter/material.dart';
import 'view_person_widget.dart';

import 'person.dart';

class PersonPage extends StatefulWidget {
  const PersonPage({super.key});

  @override
  State<PersonPage> createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  void addPerson() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController controller = TextEditingController();
        return AlertDialog(
          title: const Text('Enter Name'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: 'Name'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                String name = controller.text;
                if (name.isNotEmpty) {
                  Person p = Person(name);
                  Person.persons.add(p);
                  setState(() {});
                }
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'People',
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 400,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    for (int i = 0; i < Person.persons.length; i++)
                      ViewPersonWidget(name: Person.persons[i].name),
                  ],
                ),
              ),
            ),
            Center(
              child: SizedBox(
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: addPerson,
                      label: const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          "Add",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 32,
                              color: Colors.grey),
                        ),
                      ),
                      icon: const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Icon(
                          Icons.add_circle,
                          size: 32,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, '/next/next');
                      },
                      label: const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          "Next",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 32,
                              color: Colors.grey),
                        ),
                      ),
                      icon: const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Icon(
                          Icons.arrow_circle_right,
                          size: 32,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
