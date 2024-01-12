import 'enums.dart';

class BmiUtils {
  static String getBmiStateText(BmiState bmiState) {
    switch (bmiState) {
      case BmiState.underweight:
        return "Underweight";
      case BmiState.normal:
        return "Normal";
      case BmiState.overweight:
        return "Overweight";
      case BmiState.obesity:
        return "Obesity";
      default:
        return "Unknown";
    }
  }
}
