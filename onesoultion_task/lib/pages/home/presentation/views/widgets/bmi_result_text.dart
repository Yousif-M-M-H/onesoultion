import 'package:flutter/material.dart';

class BmiResultTextWidget extends StatelessWidget {
  const BmiResultTextWidget({super.key, required this.result});

  final String result;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20.0,
        ),
        const SizedBox(
          width: double.infinity,
          child: Text(
            "Your BMI is :",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 50.0,
        ),
        Text(
          result,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
