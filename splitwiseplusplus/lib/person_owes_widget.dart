import 'package:flutter/material.dart';
import 'person.dart';

class PersonOwesWidget extends StatelessWidget {
  final String name;
  const PersonOwesWidget({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    double topay = Person.getPerson(name).toPay==null?0.0:Person.getPerson(name).toPay!;
    return SizedBox(
      width: 250,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.person, size: 40),
                  const SizedBox(width: 15),
                  Text(
                    name,
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(width: 15),
                  Text(
                    '₹ ${topay.toString()}',
                    style: const TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
