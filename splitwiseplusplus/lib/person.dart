class Person {
  late String name;
  double? toPay;
  static var persons = <Person>[];
  Person(String name) {
    this.name = name;
  }
  static Person getPerson(String name) {
    for (int i = 0; i < persons.length; i++) {
      if (persons[i].name == name) {
        return persons[i];
      }
    }
    return new Person('');
  }
}
