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
        // 세로 간격 8
        SizedBox(height: 8),
        // 각 좌석과 행 번호가 포함된 Row
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 좌석 A
            Seat(isSelected: seatStatus[0], onTap: () => onSeatTap(0)),
            SizedBox(width: 4), // 가로 간격
            // 좌석 B
            Seat(isSelected: seatStatus[1], onTap: () => onSeatTap(1)),

            // 행 번호 (숫자)
            Container(
              width: 50,
              height: 50,
              alignment: Alignment.center,
              child: Text(
                (rowIndex + 1).toString(), // 행 번호
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            // 좌석 C
            Seat(isSelected: seatStatus[2], onTap: () => onSeatTap(2)),
            SizedBox(width: 4), // 가로 간격
            // 좌석 D
            Seat(isSelected: seatStatus[3], onTap: () => onSeatTap(3)),
          ],
        ),
        // 세로 간격 8
        SizedBox(height: 8),
      ],
    );
  }
}
