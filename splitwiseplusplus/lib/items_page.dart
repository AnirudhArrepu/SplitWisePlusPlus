import 'package:flutter/material.dart';
import 'package:splitwiseplusplus/item.dart';
import 'package:splitwiseplusplus/item_widget.dart';


class ItemsPage extends StatelessWidget {
  const ItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Items', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.grey),),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Icon(Icons.food_bank_rounded, size: 35,),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(
            child: SizedBox(
              height: 400,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                      for(int i=0; i<Item.items.length; i++)
                        ItemWidget(i: i),
                  ],
                ),
              ),
            ),
          ),
          Column(
            children: [
              ElevatedButton.icon(
                onPressed: (){
                  Navigator.pushNamed(context, '/next/next/next');
                },
                label: const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text('Next', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.grey),),
                ),
                icon: const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Icon(Icons.arrow_circle_right, size: 32, color: Colors.grey,),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}