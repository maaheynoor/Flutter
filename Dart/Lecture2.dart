main() {
  List<int> list1 = List();
  list1.add(3);
  list1.add(10);
  list1.add(1);
  list1.add(21);
  list1.add(11);
  list1.add(7);
  var largest = list1[0];
  list1.forEach((ele) => {
        if (largest < ele) {largest = ele}
      });
  print('The largest number is ${largest}');
}
