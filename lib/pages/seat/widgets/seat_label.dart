import 'package:flutter/material.dart';

class SeatLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSeatLabel('A'),
        _buildSeatLabel('B'),
        SizedBox(width: 58), // 숫자열 위치 (C, D와의 간격을 맞추기 위해 사용)
        _buildSeatLabel('C'),
        _buildSeatLabel('D'),
      ],
    );
  }

  Widget _buildSeatLabel(String label) {
    return Container(
      width: 50, // 좌석 박스 크기와 동일하게 설정
      height: 50, // 좌석 박스 크기와 동일하게 설정
      alignment: Alignment.center,
      child: Text(
        label,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
