import 'package:flutter/material.dart';

class HeightTextField extends StatelessWidget {
  const HeightTextField({super.key, this.heightController});

  final TextEditingController? heightController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          "Your Height in cm :",
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 18.0),
        ),
        const SizedBox(height: 8.0),
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
        const SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}
