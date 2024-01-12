import 'package:flutter/material.dart';
import 'package:onesoultion_task/pages/all_bmi/presentation/views/widgets/all_bmi_view_body.dart';

class AllBmisView extends StatelessWidget {
  const AllBmisView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All bmi"),
      ),
      body: const AllBmiViewBody(),
    );
  }
}
