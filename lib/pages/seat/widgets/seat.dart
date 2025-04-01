import 'package:flutter/material.dart';

class Seat extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;

  const Seat({required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50, // 가로 크기 50으로 설정
        height: 50, // 세로 크기 50으로 설정
        decoration: BoxDecoration(
          color: isSelected ? Colors.purple : Colors.grey[300]!, // 색상 설정
          borderRadius: BorderRadius.circular(8), // 모서리 둥글기
        ),
      ),
    );
  }
}
