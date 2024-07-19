import 'package:flutter/material.dart';

class ViewPersonWidget extends StatelessWidget {
  final String name;

  const ViewPersonWidget({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 4, // add elevation for a material look
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.person, size: 40), // increase icon size for better visibility
                  const SizedBox(width: 15),
                  Text(
                    name,
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
