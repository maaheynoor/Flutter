import 'dart:math';

class CalculatorBMI {
  CalculatorBMI({this.height, this.weight});
  final int height;
  final int weight;

  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 35) {
      return 'Extremely Obese';
    } else if (_bmi >= 30) {
      return 'Obese';
    } else if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 35) {
      return 'You have a much higher body weight. Try to exercise more and eat healty food or visit a dietician.';
    } else if (_bmi >= 30) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi >= 25) {
      return 'You have a slighlty higher than normal body weight. Try some exercise.';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}
