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
      //출발역과 도착역 감싸는 박스
      height: 200, //높이200
      decoration: BoxDecoration(
        //데코레이션으로 꾸미기(배경이미지, 색상, 테두리 둥글기 등등)
        color: Colors.white, //박스안에 하얀색
        borderRadius: BorderRadius.circular(20), //모서리 둥글기 20
      ),
      child: Row(
        //박스 안 Row로 정의
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onTapStart,
            child: _StationLabel(text: '출발역', stationName: startStation),
          ),

          _VerticalDividerLine(),
          GestureDetector(
            onTap: onTapEnd,
            child: _StationLabel(text: '도착역', stationName: endStation),
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
          ),
        ],
      ),
    );
  }
}

class _VerticalDividerLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(width: 2, height: 50, color: Colors.grey[400]);
  }
}
