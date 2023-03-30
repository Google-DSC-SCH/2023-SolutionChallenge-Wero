import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

class DiaryPage extends StatefulWidget {
  @override
  _DiaryPageState createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Calendar(),
    );
  }
}

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() =>_CalendarState();
}

class _CalendarState extends State<Calendar> {
  bool showOverlay = false; //일기장입력창 보여주기 true, false 설정
  //overlay show 변수를 통해서
  bool touchable = false;//스크린 전환되서 뒤에 화면을 선택 가능여부 체크
  DateTime _selectedDate =  new DateTime.now();
  DateFormat formatter = DateFormat('yyyy-MM-dd');
  late String body, title; // 일기 내용
  double opacity =1.0 ;

  var day=' ';
  var dayOnly = '';//날짜만
  int dayOnlyInt = 1;

  @override
  void initState() {
    // TODO: implement initState
    day = formatter.format(_selectedDate);
    var dayOnly = day.substring(8,10); //날짜 데이터 기본 형을 뒤에서 잘라서 날짜만 가져오도록 함
    dayOnlyInt = int.parse(dayOnly);// 날짜데이터를 스트링에서 int로 변환
  }

  var diary;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
                top: 0,
                right: 0,
                left:0,
                child: Container(
                  height: 400,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple[200],
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                  ),
                  child: Align(
                      alignment: Alignment.topCenter,
                      child: Column(
                        children: [
                          SizedBox(height: 40,),
                          Text('Diary',style: TextStyle(fontSize: 35, color: Colors.white, fontWeight: FontWeight.bold), ),
                        ],
                      ),
                  ),
                )
            ),
            Opacity(
              opacity:  opacity,//위젯 투명도 조절
              child: IgnorePointer(
                ignoring: touchable,
              child: Container(

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                ),
                margin: EdgeInsets.fromLTRB(40, 100, 40,  40),
                child: Column(
                  children: [

                    CalendarCarousel(
                      onDayPressed: (DateTime date, List<dynamic> events) {
                        setState(() {
                          _selectedDate = date;
                        });
                        print('selected date is ${formatter.format(_selectedDate) }');
                        day = formatter.format(_selectedDate);
                        var dayOnly = day.substring(8,10); //날짜 데이터 기본 형을 뒤에서 잘라서 날짜만 가져오도록 함
                        dayOnlyInt = int.parse(dayOnly);// 날짜데이터를 스트링에서 int로 변환


                      },
                      weekendTextStyle: TextStyle(
                        color: Colors.red,
                      ),
                      thisMonthDayBorderColor: Colors.grey,
                      weekFormat: false,
                      height: 350.0,
                      selectedDateTime: _selectedDate,
                      todayButtonColor: Colors.blueGrey,
                      selectedDayButtonColor: Colors.purple[200]!,
                      todayBorderColor: Colors.transparent,
                    ),
                    
                    Divider( //구분 선
                      thickness: 3,
                      color: Colors.grey[200],
                    ),
                    Row( //일기 날짜랑, 댓글버튼
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Date: $day', style: TextStyle(fontSize: 17, color: Colors.black),),
                        FloatingActionButton.small(
                          onPressed: () {
                            setState(() {
                              showOverlay = true;
                              touchable = true;
                              opacity = 0.3;
                            });
                          },//_showCommentDialog(context),
                          child: Icon(Icons.add, size: 30.0,),
                          backgroundColor: Colors.black,
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Divider( //구분 선
                      thickness: 3,
                      color: Colors.grey[200],
                    ),
                    SizedBox(height: 10,),
                    Container(//일기 내용
                      child: Text('${Daiary[dayOnlyInt]}',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      height: 80,
                    ),
                    Divider( //구분 선
                      thickness: 3,
                      color: Colors.grey[200],
                    ),
                    SizedBox( height: 15),

                  ],
                ),
              ),
          ),
            ),
            if(showOverlay)//show over lay가 true가 되면 위젯을 일단띄움
            Expanded( //일기 입력창
              child: Column(
                children: [
                  SizedBox(height: 150,),
                  Container(
                    height: 400,
                    color: Colors.white30,
                    margin: EdgeInsets.all(15),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.grey[400]!, width: 2)
                      ),

                      child: Column(
                        children: [
                          SizedBox(height: 30,),
                          Center(child: Text('Write your story', style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),)),
                          Padding(
                              padding: EdgeInsets.all(13),
                              //'This widget is passed to the overlay using overlayWidget '
                              //'so there is no close button, but you can always close this overlay by '
                              // 'tapping anywhere in the darker areas.'
                              child: TextField(
                                maxLength: 100,
                                keyboardType: TextInputType.multiline,
                                minLines: 1,//Normal textInputField will be displayed
                                maxLines: 3,// when user presses enter it will adapt to itㅇㄴㅁ
                                onChanged: (value) {
                                  diary = value;
                                },
                              )
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                Daiary[dayOnlyInt] = diary;
                              showOverlay = false;
                              touchable = false;
                              opacity = 1.0;
                            });
                            },
                            child: Center(child: Text('UPLOAD', style: TextStyle(fontSize: 17, color: Colors.white),)),
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(168, 38),
                              primary: Colors.blue[200], // Background color
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ]
        ),
      ),
    );
  }
}

var Daiary = {
  1: 'Today was a great day, I woke up early and went for a run, then spent the afternoon reading my favorite book.',
  2: 'I had a rough day at work today, but I managed to finish all my tasks and even received some praise from my boss.',
  3: 'It\'s been a while since I\'ve talked to my best friend, so we had a long phone call catching up on each other\'s lives.',
  4: 'I tried a new recipe for dinner tonight and it turned out surprisingly well, I might add it to my regular rotation.',
  5: 'I went to a yoga class this morning and felt so relaxed and rejuvenated afterwards.',
  6: 'I received some exciting news today, I was offered a job at my dream company!',
  7: 'I spent the day exploring a new city with my partner, we had so much fun discovering new places together.',
  8: 'I had a lazy day at home today, I binge-watched my favorite show and ordered in some delicious takeout.',
  9: 'I received a heartfelt message from an old friend today, it made me feel so grateful for our friendship.',
  10: 'I attended a virtual conference today and learned so much from the various speakers.',
  11: 'Today was a productive day, I crossed off several tasks from my to-do list and feel accomplished.',
  12: 'I had a deep conversation with a family member today and gained a new perspective on a situation.',
  13: 'I went to a concert tonight and had an amazing time singing and dancing along with the crowd.',
  14: 'I received some disappointing news today, but I\'m trying to stay positive and find a solution.',
  15: 'I had a nostalgic moment today and looked through old photo albums, reminiscing on happy memories.',
  16: 'I went for a hike in the mountains today and the views were breathtaking, I feel so grateful for nature.',
  17: 'I had a fun night out with friends, we went to a comedy show and laughed until our stomachs hurt.',
  18: 'I received a surprise package in the mail today, it made my day and put a smile on my face.',
  19: 'I tried a new hobby today and although it was challenging, I enjoyed the learning process.',
  20: 'I went to a museum today and learned so much about art and history.',
  21: 'I had a difficult conversation with a colleague today, but I\'m proud of myself for speaking my truth.',
  22: 'I spent the day volunteering at a local shelter and it was heartwarming to see the animals being cared for.',
  23: 'I received some constructive criticism today, although it was hard to hear, I know it will make me better in the long run.',
  24: 'I had a lazy Sunday today, I slept in and spent the day relaxing at home.',
  25: 'I visited a new cafe today and had the best latte, I\'ll definitely be going back.',
  26: 'I had a misunderstanding with a friend today, but we talked it out and came to a resolution.',
  27: 'I went to a baseball game today and even though my team lost, it was still a fun experience.',
  28: 'I received a compliment from a stranger today, it made me feel appreciated and valued.',
  29: '',//'I had a difficult workout today, but I feel proud of myself for pushing through the discomfort.',
  30: ' ',//'I spent the day doing a digital detox, it was refreshing to disconnect from technology and focus on the present moment.',
  31: 'I had a difficult conversation with a friend today, but we were able to resolve our issues and strengthen our friendship.'
};
