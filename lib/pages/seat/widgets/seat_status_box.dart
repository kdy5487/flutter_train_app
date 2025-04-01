import 'package:flutter/material.dart';

class SeatStatusBox extends StatelessWidget {
  final Color color;
  final String label;

  const SeatStatusBox({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        SizedBox(width: 4),
        Text(label),
      ],
    );
  }
}
