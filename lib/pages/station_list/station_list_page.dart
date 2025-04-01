import 'package:flutter/material.dart';

class StationListPage extends StatelessWidget {
  final bool isDeparture;
  final List<String> stations = [
    "수서",
    "동탄",
    "평택지제",
    "천안아산",
    "오송",
    "대전",
    "김천구미",
    "동대구",
    "경주",
    "울산",
    "부산",
  ];

  // 출발역/도착역 여부를 받는 생성자
  StationListPage({required this.isDeparture});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isDeparture ? '출발역' : '도착역'), // 제목 표시
        backgroundColor: Colors.pink[50],
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: stations.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                title: Text(
                  stations[index],
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.pop(context, stations[index]); // 선택 시 역 이름 반환
                },
              ),
              Divider(color: Colors.grey[300]), // 구분선
            ],
          );
        },
      ),
    );
  }
}
