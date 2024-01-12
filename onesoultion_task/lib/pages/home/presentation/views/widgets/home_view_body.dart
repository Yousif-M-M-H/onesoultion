import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onesoultion_task/core/utils/bmi_utils.dart';
import 'package:onesoultion_task/pages/home/presentation/view_models/calculate_bmi_cubit/calculate_bmi_cubit.dart';
import 'package:onesoultion_task/pages/home/presentation/views/widgets/age_text_field.dart';
import 'package:onesoultion_task/pages/home/presentation/views/widgets/bmi_calculate_button.dart';
import 'package:onesoultion_task/pages/home/presentation/views/widgets/height_text_field.dart';
import 'package:onesoultion_task/pages/home/presentation/views/widgets/show_bmi_num_column.dart';
import 'package:onesoultion_task/pages/home/presentation/views/widgets/weight_text_field.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  @override
  void dispose() {
    heightController.clear();
    weightController.clear();
    ageController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            AgeTextField(
              ageController: ageController,
            ),
            HeightTextField(
              heightController: heightController,
            ),
            WeightTextField(
              weightController: weightController,
            ),
            CalculateBmiButton(
              onPressed: () async {
                double weight = double.tryParse(weightController.text) ?? 0.0;
                double height = double.tryParse(heightController.text) ?? 0.0;
                int age = int.tryParse(ageController.text) ?? 0;

                CalculateBmiCubit calculateBmiCubit =
                    context.read<CalculateBmiCubit>();

                await calculateBmiCubit.calculateBmi(
                  weight: weight,
                  height: height,
                  age: age,
                );
              },
            ),
            BlocBuilder<CalculateBmiCubit, CalculateBmiState>(
              builder: (context, state) {
                if (state is CalculateBmiSuccess) {
                  return ShowBmiAndBmiStatus(
                    bmiNumber: 'BMI: ${state.result}',
                    bmiStatus:
                        'BMI Status: ${BmiUtils.getBmiStateText(state.bmiState)}',
                  );
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
