import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onesoultion_task/pages/update_bmi/presentation/model_views/cubit/update_bmi_cubit.dart';
import 'package:onesoultion_task/pages/update_bmi/presentation/views/widgets/update_bmi_button.dart';
import 'package:onesoultion_task/pages/update_bmi/presentation/views/widgets/weight_and_height_text_fields.dart';

class UpdateBmiViewBody extends StatelessWidget {
  final Map<String, dynamic> initialData;

  const UpdateBmiViewBody({Key? key, required this.initialData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController heightController = TextEditingController();
    TextEditingController weightController = TextEditingController();

    heightController.text = initialData['height'].toString();
    weightController.text = initialData['weight'].toString();

    return BlocProvider(
      create: (context) => UpdateBmiCubit(),
      child: BlocConsumer<UpdateBmiCubit, UpdateBmiState>(
        listener: (context, state) {
          if (state is UpdateBmiSuccess) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Update BMI Data'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  UpdateHeightAndWeightTextFields(
                    heightController: heightController,
                    weightController: weightController,
                  ),
                  UpdateBmiButton(
                    onPressed: () async {
                      double height =
                          double.tryParse(heightController.text) ?? 0.0;
                      double weight =
                          double.tryParse(weightController.text) ?? 0.0;

                      context.read<UpdateBmiCubit>().updateBmiData(
                            height: height,
                            weight: weight,
                          );
                    },
                  ),
                  const SizedBox(height: 16.0),
                  if (state is UpdateBmiLoading)
                    const Center(child: CircularProgressIndicator())
                  else if (state is UpdateBmiSuccess)
                    const Center(child: Text('BMI Data Updated Successfully'))
                  else if (state is UpdateBmiFailure)
                    Center(child: Text('Error: ${state.errMessage}')),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
