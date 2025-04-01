import 'package:flutter/material.dart';

class SeatLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
          ['A', 'B', 'C', 'D'].map((label) {
            return Container(
              width: 50,
              height: 50,
              alignment: Alignment.center,
              child: Text(label, style: TextStyle(fontSize: 18)),
            );
          }).toList(),
    );
  }
}
