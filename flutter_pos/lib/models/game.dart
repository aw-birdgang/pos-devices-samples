import 'dart:math';

class Game {
  int? id = 0;
  int? maxNumber, numberCount;
  List<int> _numbers = [];

  Game({this.maxNumber = 45, this.numberCount = 5});

  Game.fromJson(Map<dynamic, dynamic> Map) {
    maxNumber = Map["maxNumber"];
    numberCount = Map["numberCount"];
  }

  toJson() {
    return {
      'maxNumber': maxNumber,
      'numberCount': numberCount,
    };
  }

  addNumber(int number) {
    _numbers.add(number);
  }

  addNumbers(List<int> numbers) {
    _numbers.addAll(numbers);
  }

  List<int> generateNumbers() {
    _numbers = List.generate(numberCount!, (index) => _randomNumber());
    return _numbers;
  }

  int _randomNumber() {
    int number;
    do {
      number = (1 + (maxNumber! * _randomDouble()).toInt());
    } while (_numbers.contains(number));
    return number;
  }

  double _randomDouble() {
    return Random().nextDouble();
  }

  List<int> get numbers => _numbers;

  set numbers(List<int> value) {
    _numbers = value;
  }
}
