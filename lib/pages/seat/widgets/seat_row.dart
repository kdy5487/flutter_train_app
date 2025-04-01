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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 행 번호 표시
          Container(
            width: 50,
            height: 50,
            alignment: Alignment.center,
            child: Text('${rowIndex + 1}', style: TextStyle(fontSize: 18)),
          ),
          SizedBox(width: 20),

          // 좌석 4개 표시 (ABCD)
          Row(
            children: List.generate(4, (colIndex) {
              return Seat(
                isSelected: seatStatus[colIndex],
                onTap: () => onSeatTap(colIndex),
              );
            }),
          ),
        ],
      ),
    );
  }
}
