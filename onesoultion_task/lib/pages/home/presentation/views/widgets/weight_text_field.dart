import 'package:flutter/material.dart';

class WeightTextField extends StatelessWidget {
  const WeightTextField({super.key, this.weightController});

  final TextEditingController? weightController;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          "Your Weight in KG :",
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 18.0),
        ),
        const SizedBox(height: 8.0),
        TextField(
          controller: weightController,
          textAlign: TextAlign.left,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            fillColor: Colors.grey[200],
            hintText: "Your Weight in Kg",
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}
