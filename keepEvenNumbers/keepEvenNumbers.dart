Iterable<int> evenNumbers(Iterable<int> numbers) {
  return numbers.where((number) => number.isEven);
}

main(List<String> args) {
  print(evenNumbers([1, 3, 4, 5, 6]));
}
