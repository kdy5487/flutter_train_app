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
        width: 50,
        height: 50,
        margin: EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: isSelected ? Colors.purple : Colors.grey[300]!,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          //아이콘이미지 생략가능
          Icons.event_seat,
          size: 30,
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
