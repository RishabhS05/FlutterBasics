class Person implements Comparable<Person> {
  String name;
  int age;
Person({this.name ="",this.age});
  @override
  int compareTo(Person other) {
    return this.age - other.age;
  }
}
