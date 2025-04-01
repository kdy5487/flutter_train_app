import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_train_app/pages/seat/widgets/seat_label.dart';
import 'package:flutter_train_app/pages/seat/widgets/seat_row.dart';
import 'package:flutter_train_app/pages/seat/widgets/seat_status_box.dart';

class SeatPage extends StatefulWidget {
  final String startStation;
  final String endStation;

  const SeatPage({required this.startStation, required this.endStation});

  @override
  _SeatPageState createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  // 좌석 상태 관리 (20행, 4열)
  List<List<bool>> seatStatus = List.generate(20, (_) => List.filled(4, false));
  String? _selectedSeat; // 선택된 좌석 저장

  // 좌석 선택/해제
  void _toggleSeat(int row, int col) {
    setState(() {
      // 이미 다른 좌석이 선택되어 있다면 선택 취소
      if (_selectedSeat != null) {
        final previousSelection = _selectedSeat!.split("-");
        final previousRow = int.parse(previousSelection[0]);
        final previousCol = int.parse(previousSelection[1]);

        seatStatus[previousRow][previousCol] = false;
      }

      // 새 좌석 선택
      seatStatus[row][col] = !seatStatus[row][col];
      if (seatStatus[row][col]) {
        _selectedSeat = '$row-$col'; // 선택된 좌석 저장
      } else {
        _selectedSeat = null; // 선택 해제
      }
    });
  }

  // 예약 버튼 동작
  void _showReservationDialog() {
    if (_selectedSeat == null) return; // 좌석이 선택되지 않으면 아무 동작도 하지 않음

    // 선택된 좌석의 번호 출력
    final seatCoordinates = _selectedSeat!.split("-");
    final row = int.parse(seatCoordinates[0]) + 1; // 행 번호는 1부터 시작
    final col =
        ['A', 'B', 'C', 'D'][int.parse(
          seatCoordinates[1],
        )]; // 열은 A, B, C, D 중 하나

    showCupertinoDialog(
      context: context,
      builder:
          (context) => CupertinoAlertDialog(
            title: Text('예매 확인'),
            content: Text('선택한 좌석을 예약하시겠습니까?\n좌석: $row-$col'),
            actions: [
              CupertinoDialogAction(
                child: Text('취소'),
                onPressed: () => Navigator.pop(context),
              ),
              CupertinoDialogAction(
                child: Text('확인'),
                onPressed: () {
                  // 좌석 예약 처리
                  setState(() {
                    // 예약 상태로 변경 (true)
                    seatStatus[row - 1][int.parse(seatCoordinates[1])] = true;
                  });

                  Navigator.pop(context);
                  Navigator.pop(context); // 이전 페이지로 돌아가기
                },
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('좌석 선택')), //앱바
      body: Column(
        children: [
          // 출발역 -> 도착역 표시
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    widget.startStation, //출발역
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              Icon(
                Icons.arrow_circle_right_outlined, //화살표 아이콘
                size: 30,
                color: Colors.black,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    widget.endStation, // 도착역
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          // 좌석 상태 박스 (선택됨, 선택 안됨)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SeatStatusBox(color: Colors.purple, label: '선택됨'),
              SizedBox(width: 20),
              SeatStatusBox(color: Colors.grey[300]!, label: '선택 안됨'),
            ],
          ),
          SizedBox(height: 15),
          // 좌석 레이블 (A, B, C, D)
          SeatLabel(),

          // 좌석 배열 표시
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 20),
              itemCount: 20, // 20행
              itemBuilder: (context, rowIndex) {
                return SeatRow(
                  rowIndex: rowIndex,
                  seatStatus: seatStatus[rowIndex],
                  onSeatTap: (colIndex) => _toggleSeat(rowIndex, colIndex),
                );
              },
            ),
          ),

          // 예매 하기 버튼
          ElevatedButton(
            onPressed: _showReservationDialog,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              minimumSize: Size(double.infinity, 50),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            ),
            child: Text(
              '예매 하기',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }
}
