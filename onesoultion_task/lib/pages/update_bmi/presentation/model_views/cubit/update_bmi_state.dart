part of 'update_bmi_cubit.dart';

@immutable
sealed class UpdateBmiState {}

final class UpdateBmiInitial extends UpdateBmiState {}

final class UpdateBmiLoading extends UpdateBmiState {}

final class UpdateBmiFailure extends UpdateBmiState {
  final String errMessage;

  UpdateBmiFailure({required this.errMessage});
}

final class UpdateBmiSuccess extends UpdateBmiState {}
