import 'package:flutter/material.dart';

class AgeTextField extends StatelessWidget {
  const AgeTextField({super.key, this.ageController});

  final TextEditingController? ageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          "Your age",
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 18.0),
        ),
        const SizedBox(height: 8.0),
        TextField(
          controller: ageController,
          textAlign: TextAlign.left,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: "Please enter your age",
            fillColor: Colors.grey[200],
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
