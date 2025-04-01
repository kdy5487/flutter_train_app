import 'package:flutter/material.dart';

class SeatLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSeatLabel('A'),
        _buildSeatLabel('B'),
        SizedBox(width: 58), // 숫자열 위치
        _buildSeatLabel('C'),
        _buildSeatLabel('D'),
      ],
    );
  }

  Widget _buildSeatLabel(String label) {
    return Container(
      width: 50,
      height: 50,
      alignment: Alignment.center,
      child: Text(
        label,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
