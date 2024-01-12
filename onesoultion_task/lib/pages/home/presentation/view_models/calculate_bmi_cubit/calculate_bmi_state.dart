part of 'calculate_bmi_cubit.dart';

@immutable
sealed class CalculateBmiState {}

class CalculateBmiInitial extends CalculateBmiState {}

class CalculateBmiLoading extends CalculateBmiState {}

class CalculateBmiSuccess extends CalculateBmiState {
  final String result;
  final BmiState bmiState;

  CalculateBmiSuccess({required this.result, required this.bmiState});
}

class CalculateBmiFailure extends CalculateBmiState {
  final String errMessage;

  CalculateBmiFailure({required this.errMessage});
}
