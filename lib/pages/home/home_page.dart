import 'package:flutter/material.dart';
import 'package:flutter_train_app/pages/home/widgets/seat_selection_button.dart';
import 'package:flutter_train_app/pages/home/widgets/station_selector_box.dart';
import 'package:flutter_train_app/pages/station_list/station_list_page.dart'; // 역 목록 페이지 추가
import 'package:flutter_train_app/pages/seat/seat_page.dart'; // 좌석 선택 페이지 추가

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String startStation = ''; // 출발역
  String endStation = ''; // 도착역

  // 역 선택 후 반환되는 값을 처리하는 함수
  void _selectStation(bool isDeparture) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StationListPage(isDeparture: isDeparture),
      ),
    );

    // 선택된 역이 있다면 상태 업데이트
    if (result != null && result is String) {
      setState(() {
        if (isDeparture) {
          startStation = result;
        } else {
          endStation = result;
        }
      });
    }
  }

  // 좌석 선택 페이지로 이동하는 함수
  void _navigateToSeatPage() {
    if (startStation.isNotEmpty && endStation.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder:
              (context) =>
                  SeatPage(startStation: startStation, endStation: endStation),
        ),
      );
    } else {
      // 미선택 시 경고 메시지 출력
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('출발역과 도착역을 모두 선택해주세요.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('기차 예매')),
      body: Container(
        padding: EdgeInsets.all(20),
        color: Colors.grey[200],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StationSelectionBox(
              startStation: startStation,
              endStation: endStation,
              onTapStart: () => _selectStation(true),
              onTapEnd: () => _selectStation(false),
            ),
            SizedBox(height: 20),
            SeatSelectionButton(onPressed: _navigateToSeatPage),
          ],
        ),
      ),
    );
  }
}
