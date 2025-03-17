import 'dart:math';

class CalculatorBrain {
  final int height;
  final int weight;
  late double _bmi;

  CalculatorBrain({required this.height, required this.weight}) {
    _bmi = weight / pow(height / 100, 2);
  }

  String getBMI() => _bmi.toStringAsFixed(1);

  String getResult() {
    if (_bmi >= 25) {
      return 'Thừa cân';
    } else if (_bmi > 18.5)
      return 'Bình thường';
    else
      return 'Thiếu cân';
  }
}
