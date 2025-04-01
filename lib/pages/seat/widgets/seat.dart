import 'package:flutter/material.dart';

//좌석 박스
class Seat extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;

  const Seat({required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50, // 좌석 크기
        height: 50, // 좌석 크기
        decoration: BoxDecoration(
          color: isSelected ? Colors.purple : Colors.grey[300]!, // 색상 변경
          borderRadius: BorderRadius.circular(8), // 모서리 둥글기
        ),
      ),
    );
  }
}
