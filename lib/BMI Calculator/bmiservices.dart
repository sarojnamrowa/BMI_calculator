import 'dart:math';

class Services {
  double weight = 46;
  double height = 167;
  int age = 20;
  //String gender = male;

  double bmiCalculate(double height, double weight) {
    height = height / 100;
    double bmi = weight / pow(height, 2);
    return bmi;
  }

  String getCategory(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi < 25) {
      return 'Normal Weight';
    } else if (bmi < 30) {
      return 'Over Weight';
    } else {
      return 'Obese';
    }
  }

  String getBmiAdvice(double bmi) {
    if (bmi < 18.5) {
      return 'Increase calorie intake with nutritious foods, eat balanced meals, and consider strength training.';
    } else if (bmi < 25.0) {
      return 'Maintain a balanced diet, stay physically active, and continue your healthy lifestyle.';
    } else if (bmi < 30.0) {
      return 'Focus on portion control, regular exercise, and healthier food choices.';
    } else {
      return 'Consider a structured weight-loss plan, regular physical activity, and consult a healthcare professional for guidance.';
    }
  }

  void reset() {
    weight = 46;
    height = 167;
  }
}
