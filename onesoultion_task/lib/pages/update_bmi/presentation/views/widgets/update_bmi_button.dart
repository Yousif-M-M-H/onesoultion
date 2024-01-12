import 'package:flutter/material.dart';

class UpdateBmiButton extends StatelessWidget {
  const UpdateBmiButton({super.key, this.onPressed});

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
              "Update",
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
