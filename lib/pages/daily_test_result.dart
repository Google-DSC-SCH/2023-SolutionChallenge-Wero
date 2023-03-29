//일일 테스트 결과창

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wero/objects/daily_test_review.dart';
import 'package:wero/pages/main_page.dart';

class DailyTestResult extends StatelessWidget {
  List dailyTest;

  DailyTestResult(this.dailyTest);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightGreen[100],

        body: Container(
          margin: EdgeInsets.all(20),
          child: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.all(35),
                  child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(10.0))),
                      child: Column(
                        children: [
                          Text(
                            'The Score result is $dailyTest',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 30,),
                          Divider(thickness: 2, height: 2, color: Colors.grey[300]),
                          SizedBox(height: 30,),
                          Text('${dailyResult(dailyTest[0] + dailyTest[1])}',
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(height: 10,),
                          ElevatedButton(
                            onPressed: () {
                              Get.off(MainPage());
                            },
                            child: Text('Go to Main Page', style: TextStyle(fontSize: 17, color: Colors.black),),
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(168, 38),
                              primary: Colors.blue[200], // Background color
                            ),
                          ),
                        ],
                      )
                  )
              )
          ),
        )
    );
  }

  //테스트 결과값에 따라 이가 적용된 스트링을 리턴함
  String? dailyResult(int score) {
    late String res;
    if(score<20) {
      return dailyTestReview[20];
    } else if( score >=20 && score<30){
      return dailyTestReview[30];
    } else if( score >= 30 &&  score <40) {
      return dailyTestReview[40];
    }else if( score >= 40 &&  score <50) {
      return dailyTestReview[50];
    }else {
      return  dailyTestReview[50];
    }

  }
}