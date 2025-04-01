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
      themeMode: ThemeMode.dark, // 다크 테마로 시작
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black, // 배경색을 다크 테마에 맞게 설정
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black, // 앱바 색상 다크 테마에 맞게 설정
        ),
      ),
      home: HomePage(), // 첫 실행으로 홈 페이지
    );
  }
}
