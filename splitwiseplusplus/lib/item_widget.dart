import 'package:flutter/material.dart';
import 'package:splitwiseplusplus/item.dart';
import 'package:splitwiseplusplus/person.dart';

class ItemWidget extends StatefulWidget {
  final int i;
  const ItemWidget({super.key, required this.i});

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  void _showPeopleDialog(BuildContext context) {
    final List<Person> people = Person.persons;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Split with:'),
          content: Container(
            width: double.maxFinite,
            constraints: BoxConstraints(maxHeight: 300),
            child: ListView.builder(
              shrinkWrap:
                  true,
              itemCount: people.length,
              itemBuilder: (context, index) {
                final person = people[index];
                return CheckboxListTile(
                  title: Text(person.name),
                  value: Item.items[widget.i].orderedBy.contains(person),
                  onChanged: (newValue) {
                    if (Item.items[widget.i].orderedBy.contains(person)) {
                      Item.items[widget.i].orderedBy.remove(person);
                      person.toPay = person.toPay==null?0:person.toPay! - Item.items[widget.i].price;
                      setState(() {
                        
                      });
                    } else {
                      Item.items[widget.i].orderedBy.add(person);
                      person.toPay = person.toPay==null?0:person.toPay! + Item.items[widget.i].price/(Item.items[widget.i].orderedBy.length);
                      setState(() {
                        
                      });
                    }
                  },
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  
                });
              },
              child: Text('Done'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    Item.items[widget.i].name,
                    style: const TextStyle(
                        fontSize: 30,
                        color: Colors.white),
                    maxLines: 1,
                  ),
                  Text('₹${Item.items[widget.i].price}',
                      style: const TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold,)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      _showPeopleDialog(context);
                    },
                    label:
                        Text(Item.items[widget.i].orderedBy.length.toString(), style: TextStyle(color: Colors.grey),),
                    icon: const Icon(Icons.person, color: Colors.grey,),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
