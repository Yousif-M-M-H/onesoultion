import 'package:flutter/material.dart';

class BmiCard extends StatelessWidget {
  const BmiCard(
      {super.key,
      required this.bmiStatus,
      required this.bmiData,
      required this.height,
      required this.weight,
      required this.datetime,
      this.onDeletePressed,
      this.onCardPressed});

  final String bmiStatus;
  final String bmiData;
  final String height;
  final String weight;
  final String datetime;
  final void Function()? onDeletePressed;
  final void Function()? onCardPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCardPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
        child: Card(
          color: Colors.white,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(16.0),
            title: Text(
              bmiStatus,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8.0),
                Text(
                  bmiData,
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  height,
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  weight,
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  datetime,
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            trailing: IconButton(
              onPressed: onDeletePressed,
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
