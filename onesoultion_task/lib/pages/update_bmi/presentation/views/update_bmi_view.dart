import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onesoultion_task/pages/update_bmi/presentation/model_views/cubit/update_bmi_cubit.dart';
import 'package:onesoultion_task/pages/update_bmi/presentation/views/widgets/update_view_body.dart';

class UpdateBmiView extends StatelessWidget {
  final Map<String, dynamic> initialData;

  const UpdateBmiView({Key? key, required this.initialData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateBmiCubit(),
      child: UpdateBmiViewBody(initialData: initialData),
    );
  }
}
