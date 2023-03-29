import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wero/objects//mbtiQustion.dart';

//mbti검사 기능
import 'package:flutter/material.dart';
import 'package:wero/pages/mbti_test_result_page.dart';

class MbtiTestingPage extends StatefulWidget {
  @override
  MbtiTestingPageState createState() => MbtiTestingPageState();


}

class MbtiTestingPageState extends State<MbtiTestingPage> {
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
  var questionPageIndex = 0; // 퀴즈인덱스를 언제 까지 진행했는지를 체크함
  var totalScore =  [0, 0, 0, 0];//점수 계를 저장할 변수
  //모델에 순서대로 데이터 넘길 것
  //MBTI 테스팅 페이지에서 survey페이지로 totaldata를 넘기고, 화면을 넘긴다.
  //또한 공통적으로 제공되어야 할 리스트역시도 여기서 선언되어 있어야 SurveyScreen에서 사용가능 할 것
  // List of questions 리스트에 원본 데이터를 옮겨서 받아온다.
  var _questions = mbtiQuestions;

  @override
  Widget build(BuildContext context) {
    _questions.shuffle();

    return SurveyScreen(total : totalScore,questions: _questions, lastQuestion: 0,);
  }
}

class SurveyScreen extends StatefulWidget {
  //survey screen이 변경 되면서
  late int lastQuestion;
  List finalScore = [0,0,0,0];
  late List questions;
  @override
  SurveyScreenState createState() => SurveyScreenState();

  SurveyScreen({required int lastQuestion,required List total ,required List questions}){
    this.lastQuestion = lastQuestion;
    this.questions = questions;
    this.finalScore = total;
  }
}

class SurveyScreenState extends State<SurveyScreen> {

  // List of selected ratings, initialized to -1
  final List<int> _ratings = List.generate(8, (_) => -1);
  //결과 값 리스트 생성
  List<int> total = [0,0,0,0];

  @override
  initState() {
    total = [0,0,0,0];
  }

  @override
  Widget build(BuildContext context) {
    SurveyScreenState? parent = context.findAncestorStateOfType<SurveyScreenState>();
    //리스트는 부모에서 이미 진행 되어있는 상태이다.
    //퀴즈 40개가 순서가 랜덤으로 설정되어 있음

    return Scaffold(
      backgroundColor: Colors.purple[100],
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(35),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(10.0))
            ),

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(

              children: [Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(8, (index) {
                  //index는 0, 1, 2, 3, 4,5, 6, 7로 나타남

                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${index + 1+ widget.lastQuestion}. ${widget.questions[index+ widget.lastQuestion]['questionText']}',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(5, (ratingIndex) { //rating index는 점수 0,1,2,3,4
                            return InkWell(
                              onTap: () {
                                print(ratingIndex);
                                if(_ratings[index]!=-1){//이미 값이 초기화 되어 있다면 기존 값은 총계에서 빼주기
                                  total[widget.questions[index+ widget.lastQuestion]['domain']-1]= total[widget.questions[index+ widget.lastQuestion]['domain']-1]-_ratings[index];
                                }
                                _ratings[index] = ratingIndex + 1;//탭할때마다 발생하는 상황에서 결과 값인 토탈에 리스트 인덱스 값을 더하면 당연히 오류가 발생할 것
                                total[widget.questions[index+ widget.lastQuestion]['domain']-1]= total[widget.questions[index+ widget.lastQuestion]['domain']-1]+ ratingIndex+1;
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
                                      : Colors.grey[300],
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
                //버튼에서 화면 이동 처리하기

                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(168, 38),
                      primary: Colors.blue[200], // Background color
                    ),
                    onPressed: () {
                      widget.lastQuestion =widget.lastQuestion+8;
                      if(widget.lastQuestion>=40 ){
                        Get.to(MbtiResult(widget.finalScore));
                      }

                        //최종 결과 값배열에 [0,0,0,0]에 화면바뀔때 마다 값을적용
                        for (int i = 0; i < 4; i++) {
                          widget.finalScore[i] = widget.finalScore[i] + total[i];
                        }
                        //lastQuestion +8해서 넘기기 질문이 40개이므로 마지막 질문의 개수가 40이면 다음화면은 결과화면이 될 것
                        print('${widget.finalScore[0]}, ${widget
                            .finalScore[1]},${widget.finalScore[2]},${widget
                            .finalScore[3]}');
                        for (var i = 0; i < _ratings.length; i++) {
                          _ratings[i] = 0;
                        }

                      initState();

                    setState(() {
                      //화면 초기화
                    });
                  },
                    child: widget.lastQuestion<=24?Text('Next ${32-widget.lastQuestion}left ',style: TextStyle(fontSize: 17, color: Colors.black),)
                        :Text('Test Result',style: TextStyle(fontSize: 17, color: Colors.black),)
                )
              ]
        ),
            ),
          ),
        ),
      ),
    );
  }
}

