import 'package:flutter/material.dart';

class ShowBmiAndBmiStatus extends StatelessWidget {
  const ShowBmiAndBmiStatus({
    super.key,
    required this.bmiNumber,
    required this.bmiStatus,
  });
  final String bmiNumber;
  final String bmiStatus;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Text(
          bmiNumber,
          style: const TextStyle(fontSize: 25),
        ),
        const SizedBox(height: 10),
        Text(
          bmiStatus,
          style: const TextStyle(fontSize: 25),
        ),
      ],
    );
  }
}
