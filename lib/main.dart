import 'package:flutter/material.dart';
import 'package:flutter_train_app/pages/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(), //첫 실행로 홈 페이지
    );
  }
}
