main() {
  final sumNumbersInArray =
      (List<int> a) => a.reduce((sum, next) => sum + next);
  print(sumNumbersInArray([3, 4, 5, 6]));
}
