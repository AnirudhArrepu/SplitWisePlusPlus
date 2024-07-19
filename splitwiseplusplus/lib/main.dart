import 'package:flutter/material.dart';
import 'package:splitwiseplusplus/final_page.dart';
import 'package:splitwiseplusplus/items_page.dart';
import 'image_items_page.dart';
import 'person_page.dart';

void main() {
  runApp(const SplitWise());
}

class SplitWise extends StatelessWidget {
  const SplitWise({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, brightness: Brightness.dark),
      initialRoute: '/',
      routes: {
        '/': (context) => const ImageItemsPage(),
        '/next': (context) => const PersonPage(),
        '/next/next': (context) => const ItemsPage(),
        '/next/next/next': (context) => const FinalPage(),
      },
    );
  }
}
