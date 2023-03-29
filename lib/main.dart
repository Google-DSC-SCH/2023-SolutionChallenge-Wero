import 'package:flutter/material.dart';
import 'package:wero/pages/landing_page.dart';
import 'package:get/get.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //라우트를 GetX로 사용할 예정
      home: LandingPage(),
    );
  }
}
