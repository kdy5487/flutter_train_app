import 'package:flutter/material.dart';

class StationSelectionBox extends StatelessWidget {
  final String startStation;
  final String endStation;
  final VoidCallback onTapStart;
  final VoidCallback onTapEnd;

  const StationSelectionBox({
    required this.startStation,
    required this.endStation,
    required this.onTapEnd,
    required this.onTapStart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200, // 높이 200
      decoration: BoxDecoration(
        color: Colors.white, // 배경색 흰색
        borderRadius: BorderRadius.circular(20), // 모서리 둥글기 20
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, // 세로 가운데 정렬
        children: [
          Expanded(
            child: GestureDetector(
              onTap: onTapStart,
              child: _StationLabel(text: '출발역', stationName: startStation),
            ),
          ),
          // 세로선 추가
          _VerticalDividerLine(),
          Expanded(
            child: GestureDetector(
              onTap: onTapEnd,
              child: _StationLabel(text: '도착역', stationName: endStation),
            ),
          ),
        ],
      ),
    );
  }
}

class _StationLabel extends StatelessWidget {
  final String text;
  final String stationName;

  const _StationLabel({required this.text, required this.stationName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            stationName.isEmpty ? '선택' : stationName,
            style: TextStyle(fontSize: 40),
            overflow: TextOverflow.ellipsis, // 텍스트가 길어지면 잘리도록 함
            softWrap: false, // 자동 줄 바꿈을 방지
          ),
        ],
      ),
    );
  }
}

// 세로선
class _VerticalDividerLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 2, // 세로선 너비
      height: 50, // 세로선 높이
      color: Colors.grey[400], // 세로선 색상
    );
  }
}
