import 'package:flutter/material.dart';

class NextAndPrevButtonsRow extends StatelessWidget {
  const NextAndPrevButtonsRow(
      {super.key,
      this.onPrevPreesed,
      required this.currentPage,
      this.onNextPressed});
  final void Function()? onPrevPreesed;
  final String currentPage;
  final void Function()? onNextPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: onPrevPreesed,
        ),
        Text(currentPage),
        IconButton(
            icon: const Icon(Icons.arrow_forward), onPressed: onNextPressed),
      ],
    );
  }
}
