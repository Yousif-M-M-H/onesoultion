import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'update_bmi_state.dart';

class UpdateBmiCubit extends Cubit<UpdateBmiState> {
  UpdateBmiCubit() : super(UpdateBmiInitial());

  Future<void> updateBmiData(
      {required double height, required double weight}) async {
    emit(UpdateBmiLoading());

    try {
      String? userId = FirebaseAuth.instance.currentUser?.uid;

      if (userId != null) {
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection('bmi_data')
            .orderBy('dateTime', descending: true)
            .limit(1)
            .get();

        if (querySnapshot.docs.isNotEmpty) {
          String docId = querySnapshot.docs[0].id;

          double bmi = calculateBmi(height, weight);
          String bmiStatus = getBmiStatus(bmi);

          await FirebaseFirestore.instance
              .collection('bmi_data')
              .doc(docId)
              .update({
            'height': height,
            'weight': weight,
            'bmi': bmi,
            'bmiStatus': bmiStatus,
          });

          emit(UpdateBmiSuccess());
        } else {
          emit(UpdateBmiFailure(errMessage: 'User BMI data not found'));
        }
      } else {
        emit(UpdateBmiFailure(errMessage: 'User not logged in'));
      }
    } catch (e) {
      emit(UpdateBmiFailure(errMessage: 'Error updating BMI data'));
    }
  }

  double calculateBmi(double height, double weight) {
    return weight / ((height / 100) * (height / 100));
  }

  String getBmiStatus(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi < 24.9) {
      return 'Normal';
    } else if (bmi < 29.9) {
      return 'Overweight';
    } else {
      return 'Obesity';
    }
  }
}
