import 'package:flutter/material.dart';

//선택됨, 선택안됨 박스
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
        SizedBox(width: 4), // 상태 박스와 텍스트 간의 간격
        Text(label),
      ],
    );
  }
}
