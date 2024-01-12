import 'package:flutter/material.dart';

class CalculateBmiButton extends StatelessWidget {
  const CalculateBmiButton({super.key, this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20.0,
        ),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: MaterialButton(
            onPressed: onPressed,
            color: Colors.blue,
            child: const Text(
              "Calculate",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
