import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:onesoultion_task/core/utils/enums.dart';
import 'package:onesoultion_task/core/utils/bmi_utils.dart'; // Import the BmiUtils class

part 'calculate_bmi_state.dart';

class CalculateBmiCubit extends Cubit<CalculateBmiState> {
  CalculateBmiCubit() : super(CalculateBmiInitial());

  Future<void> calculateBmi({
    required double weight,
    required double height,
    required int age,
  }) async {
    emit(CalculateBmiLoading());

    try {
      double bmi = weight / ((height / 100) * (height / 100));

      BmiState bmiState = _getBmiState(bmi, age);

      await _storeBmiData(weight, height, bmi, bmiState);

      emit(CalculateBmiSuccess(
        result: bmi.toStringAsFixed(2),
        bmiState: bmiState,
      ));
    } catch (e) {
      emit(CalculateBmiFailure(errMessage: 'Error calculating BMI'));
    }
  }

  BmiState _getBmiState(double bmi, int age) {
    if (bmi < 18.5) {
      return BmiState.underweight;
    } else if (bmi < 24.9) {
      return BmiState.normal;
    } else if (bmi < 29.9) {
      return BmiState.overweight;
    } else {
      return BmiState.obesity;
    }
  }

  Future<void> _storeBmiData(
      double weight, double height, double bmi, BmiState bmiState) async {
    try {
      DateTime dateTime = DateTime.now();

      CollectionReference bmiCollection =
          FirebaseFirestore.instance.collection('bmi_data');

      await bmiCollection.add({
        'weight': weight,
        'height': height,
        'bmi': bmi,
        'bmiStatus': BmiUtils.getBmiStateText(bmiState),
        'dateTime': dateTime,
      });
    } catch (e) {
      print('Error storing BMI data: $e');
    }
  }
}
