import 'package:flutter/material.dart';

class UpdateHeightAndWeightTextFields extends StatelessWidget {
  const UpdateHeightAndWeightTextFields(
      {super.key, this.heightController, this.weightController});

  final TextEditingController? heightController;
  final TextEditingController? weightController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: heightController,
          textAlign: TextAlign.left,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: "Your height in Cm",
            fillColor: Colors.grey[200],
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        TextField(
          controller: weightController,
          textAlign: TextAlign.left,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: "Your height in Cm",
            fillColor: Colors.grey[200],
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }
}
