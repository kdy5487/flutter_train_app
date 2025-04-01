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

  // 좌석 선택/해제
  void _toggleSeat(int row, int col) {
    setState(() {
      seatStatus[row][col] = !seatStatus[row][col];
    });
  }

  // 예약 버튼 동작
  void _showReservationDialog() {
    bool hasSelected = seatStatus.any((row) => row.contains(true));
    if (!hasSelected) return;

    showCupertinoDialog(
      context: context,
      builder:
          (context) => CupertinoAlertDialog(
            title: Text('예매 확인'),
            content: Text('선택한 좌석을 예약하시겠습니까?'),
            actions: [
              CupertinoDialogAction(
                child: Text('취소'),
                onPressed: () => Navigator.pop(context),
              ),
              CupertinoDialogAction(
                child: Text('확인'),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
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
        //세로
        children: [
          // 출발역 -> 도착역 표시
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 중심으로 정렬
            children: [
              Text(
                widget.startStation, //출발역
                style: TextStyle(
                  //텍스트 스타일 정리
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                  fontSize: 30,
                ),
              ),
              Icon(
                //화살표
                Icons.arrow_circle_right_outlined,
                size: 30,
                color: Colors.black,
              ),
              Text(
                widget.endStation, //도착역
                style: TextStyle(
                  //텍스트 스타일 정리
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                  fontSize: 30,
                ),
              ),
            ],
          ),
          SizedBox(height: 10), //간격 주기
          // 좌석 상태 박스 (선택됨, 선택 안됨)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SeatStatusBox(color: Colors.purple, label: '선택됨'),
              SizedBox(width: 20), // 간격을 맞추기 위한 SizedBox
              SeatStatusBox(color: Colors.grey[300]!, label: '선택 안됨'),
            ],
          ),
          SizedBox(height: 15), // 좌석 상태 박스 아래 간격
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
              minimumSize: Size(double.infinity, 50), // 버튼 높이를 줄여서 두께를 자연스럽게 만듦
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 30,
              ), // 상하 좌우 간격 추가
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
  } //ss
}
