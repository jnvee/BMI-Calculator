import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});
  final int height;
  final int weight;

  double _bmi;

  String CalculateBMI(){
    _bmi = weight/pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi >= 25){
      return 'OVERWEIGHT';
    } else if (_bmi >18.5){
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String getInterpretation(){
    if(_bmi >= 25){
      return 'Hi you are a bit chubby. Try working out maybe?';
    } else if (_bmi >18.5){
      return 'Hi You have a perfect body mass index! Yayy';
    } else {
      return 'Hi You could maybe try eating a bit more? Get into shape mate!';
    }
  }

}