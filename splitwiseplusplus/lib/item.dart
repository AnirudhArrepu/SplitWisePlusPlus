import 'person.dart';

class Item {
  late String name;
  late int price;

  static var items = <Item>[];
  var orderedBy = <Person>[];

  Item(String name, int price) {
    this.name = name;
    this.price = price;
  }
}
