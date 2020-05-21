main() {
  var evenNumbers = [1, 3, 4, 5, 6].where((number) => number.isEven);
  for (var number in evenNumbers) {
    print("$number");
  }
}
