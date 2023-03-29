//지연화면, 랜딩페이지
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wero/pages/login_page.dart';
import 'package:get/get.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    Timer(Duration(milliseconds: 500), () {
      Get.offAll(LoginPage());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context ) {
    return Scaffold(
      body: Stack(
        children: [Text('landing page'),
          Center(
          child: CircularProgressIndicator()
          ),
        ]
      ),
    );
  }
}