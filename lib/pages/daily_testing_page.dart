import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wero/objects//dailyQuestion.dart';
import 'package:wero/pages/daily_test_result.dart';
//mbti검사 기능

class DailyTestingPage extends StatefulWidget {
  @override
  DailyTestingPageState createState() => DailyTestingPageState();
}

class DailyTestingPageState extends State<DailyTestingPage> {
  //질문 객체 선언
  //mbti퀴즈는 4가지 영역으로 분류됨
//4가지 영역을 결정짓는 변수가 필요하고,  enum으로 선언? a, b, c,d 영역별로
//선택되었을때 몇점인지 저장이 되어야 하고,
//퀴즈 번호가 있어야 하고,
//퀴즈 텍스트를 저장하고 있어야 한다.
//   식습관
//   1
//   활동성
//   2
//   자존감
//   3
//   대인성
//   4
  var totalScore =  [0, 0];//점수 계를 저장할 변수
  //모델에 순서대로 데이터 넘길 것
  //MBTI 테스팅 페이지에서 survey페이지로 totaldata를 넘기고, 화면을 넘긴다.
  //또한 공통적으로 제공되어야 할 리스트역시도 여기서 선언되어 있어야 SurveyScreen에서 사용가능 할 것
  // List of questions 리스트에 원본 데이터를 옮겨서 받아온다.
  var _questions = dailyQuestions;

  @override
  Widget build(BuildContext context) {
    _questions.shuffle();
    return DailySurveyScreen(questions: _questions, total: [0,0],);
  }
}

class DailySurveyScreen extends StatefulWidget {
  //survey screen이 변경 되면서
  List finalScore = [0,0];
  late List questions;
  @override
  DailySurveyScreenState createState() => DailySurveyScreenState();

  DailySurveyScreen({required List total ,required List questions}){
    this.questions = questions;
    this.finalScore = total;
  }
}

class DailySurveyScreenState extends State<DailySurveyScreen> {

  // List of selected ratings, initialized to -1
  final List<int> _ratings = List.generate(10, (_) => -1);
  //결과 값 리스트 생성
  List<int> total = [0,0,];

  @override
  initState() {
    total = [0,0];
  }
  //_answers의 length를 이용해서 질문의 개수를 알고, 이만 큼의 설문 질문을 생성한다.

  @override
  Widget build(BuildContext context) {
    DailySurveyScreenState? parent = context.findAncestorStateOfType<DailySurveyScreenState>();
    //리스트는 부모에서 이미 진행 되어있는 상태이다.
    //퀴즈 40개가 순서가 랜덤으로 설정되어 있음

    return Scaffold(
      backgroundColor: Colors.lightGreen[200]!,
      body: Container(
        color: Colors.white,
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
                children: [Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(10, (index) {
                    //index는 0, 1, 2, 3, 4,5, 6, 7, 8, 9로 나타남

                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${index + 1}. ${widget.questions[index]['questionText']}',//질문 텍스트에 접근해서 질문을 출력하는 코드
                            style: TextStyle(fontSize: 16.0),
                          ),
                          SizedBox(height: 8.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(widget.questions[index]['answers'].length, (ratingIndex) { //질문의 개수 만큼 질문생성
                              return InkWell(
                                onTap: () {
                                  print(ratingIndex);
                                  if(_ratings[index]!=-1){//이미 값이 초기화 되어 있다면 기존 값은 총계에서 빼주기
                                    total[widget.questions[index]['domain']-1]= total[widget.questions[index]['domain']-1]-((5/widget.questions[index]['answers'].length+0.9).toInt()*_ratings[index]);
                                  }
                                  _ratings[index] = ratingIndex + 1;//탭할때마다 발생하는 상황에서 결과 값인 토탈에 리스트 인덱스 값을 더하면 당연히 오류가 발생할 것
                                  //widget.questions[index]['answers'].length()는 문제 개수 문제 전체 총계에 올바른 도메인에 이전 총계에 5/문제 개수로 가중치 설정하기
                                  total[widget.questions[index]['domain']-1]= total[widget.questions[index]['domain']-1]+(5/widget.questions[index]['answers'].length+0.9).toInt()*ratingIndex+1;
                                  //_ratings[index] 를 이번에 눌린 값으로 초기화 하기 전에 저장되어있는 값을 먼저 전체 값에서 뺴주자
                                  // total[widget.questions[index+ widget.lastQuestion]['domain']-1]= total[widget.questions[index+ widget.lastQuestion]['domain']-1]- _ratings[index];
                                  // _ratings[index] = ratingIndex + 1;//탭할때마다 발생하는 상황에서 결과 값인 토탈에 리스트 인덱스 값을 더하면 당연히 오류가 발생할 것
                                  // //total안에 있는 값에서, 기존의 지정된 값이 있다면 이를 빼주어야 한다. 기존리스트는 _ratings[index]로 알 수 있을 것이다.
                                  // total[widget.questions[index+ widget.lastQuestion]['domain']-1]= total[widget.questions[index+ widget.lastQuestion]['domain']-1]+ ratingIndex+1;
                                  setState(() {
                                    //질문의 영역을찾아서 그에 맞는 인덱스에 결과 값을1,2,3,4  빼기1을해야 실제로 인덱스 값에 계를 더할 수 있음
                                  });
                                },
                                child: Container(
                                  height: 40.0,
                                  width: 40.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    color: _ratings[index] == ratingIndex + 1
                                        ? Colors.black
                                        : Colors.grey[200],
                                  ),
                                  child: Center(
                                    child: Text(
                                      '${ratingIndex + 1}',
                                      style: TextStyle(
                                        color: _ratings[index] == ratingIndex + 1
                                            ? Colors.white
                                            : Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                    );
                  }),

                ),
                  SizedBox(height:  20,),
                  //버튼에서 화면 이동 처리하기
                  ElevatedButton(
                    onPressed: () {
                      Get.to(DailyTestResult(total));
                    },
                    child: Text('Daily Test Result', style: TextStyle(fontSize: 17, color: Colors.black),),
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(168, 38),
                      primary: Colors.lightGreen[200], // Background color
                    ),
                  ),

                ]
            ),
          ),
        ),
      ),
    );
  }
}
