import 'package:flutter/material.dart';
import 'package:flutter_train_app/pages/seat/widgets/seat.dart';

class SeatRow extends StatelessWidget {
  final int rowIndex;
  final List<bool> seatStatus;
  final Function(int) onSeatTap;

  const SeatRow({
    required this.rowIndex,
    required this.seatStatus,
    required this.onSeatTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 좌석 레이블 (A, B, C, D) 행 상단에 위치하도록 수정
        SeatLabel(),
        SizedBox(height: 8), // 세로 간격을 8로 설정
        // 각 좌석
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Seat(isSelected: seatStatus[0], onTap: () => onSeatTap(0)),
            SizedBox(width: 4), // 가로 간격
            Seat(isSelected: seatStatus[1], onTap: () => onSeatTap(1)),
            SizedBox(width: 4), // 가로 간격
            Seat(isSelected: seatStatus[2], onTap: () => onSeatTap(2)),
            SizedBox(width: 4), // 가로 간격
            Seat(isSelected: seatStatus[3], onTap: () => onSeatTap(3)),
          ],
        ),
        SizedBox(height: 8), // 행 사이에 세로 간격 추가
      ],
    );
  }
}
