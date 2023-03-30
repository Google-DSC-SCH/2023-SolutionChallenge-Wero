import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:wero/objects/emotions_explain.dart';
import 'package:wero/pages/daily_testing_page.dart';
import 'package:wero/pages/group_thraphy.dart';

List<Map> dailyTestList = [
  //전역 변수로 날짜별 점수로 초기화 시켜둠
  {'dailyScore': 10, 'dailyDate': '03-14', 'dailyEmotion': "happy"},
  {'dailyScore': 4, 'dailyDate': '03-15', 'dailyEmotion': "depressed"},
  {'dailyScore': 8, 'dailyDate': '03-16', 'dailyEmotion': "excited"},
  {'dailyScore': 6, 'dailyDate': '03-17', 'dailyEmotion': "happy"},
  {'dailyScore': 3, 'dailyDate': '03-18', 'dailyEmotion': "angry"},
  {'dailyScore': 7, 'dailyDate': '03-19', 'dailyEmotion': "not_bad"},
  {'dailyScore': 9, 'dailyDate': '03-20', 'dailyEmotion': "happy"},
];

List emotions = ['happy', 'depressed', 'excited','happy','angry','not_bad','happy'];

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return HP();
  }
}



class HP extends StatefulWidget {
  @override
  _HPState createState() => _HPState();
}

class _HPState extends State<HP> {
  //Homepage State에서 리스트로 초기화 시켜놓을것

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(iconTheme : IconThemeData(color: Colors.black), backgroundColor: Colors.white, title: Image.asset('assets/app_icon/Wero.png',height: 70), centerTitle: true,),
      drawer: Drawer(
          child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget> [
                Container(
                    padding: EdgeInsets.all(30),
                    height: 100,
                    child: Text('Menu', style: TextStyle(fontSize: 40))
                ),
                ListTile(
                  title: const Text('EDIT MEMBER INFORMATION',style: TextStyle(fontSize: 20),),
                  onTap: () {

                  },
                ),
                ListTile(
                  title: const Text('ALARM',style: TextStyle(fontSize: 20),),
                  onTap: () {

                  },
                ),
                ListTile(
                  title: const Text('LOGOUT',style: TextStyle(fontSize: 20),),
                  onTap: () {

                  },
                ),
              ]
          )
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(DailyTestingPage());
                    },
                    child: Text('DAILY TEST', style: TextStyle(fontSize: 17, color: Colors.black),),
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(168, 38),
                      primary: Colors.lightGreen[300], // Background color
                    ),
                ),
              ),
              SizedBox(height: 17.0),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                //일주일 이동하기 버튼으로 이벤트 처리하기
                // setState로 이모지, 그래프를 변경시켜야 한다.
                ElevatedButton(
                    onPressed: () {
                      Get.to(GroupTheraphy());
                    },
                    child: Text('GROUP TERAPHY',style: TextStyle(fontSize: 17, color: Colors.black),),
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(168, 38),
                      primary: Colors.lightGreen[600]!, // Background color
                  ),
                ),

              ]),
              SizedBox(height: 25.0),
              SizedBox(
                child: BarChartHome(),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    iconSize: 13,
                    icon: Icon(Icons.arrow_back_ios_new_outlined),
                  ),
                  Expanded(child: Container()),
                  IconButton(
                    iconSize: 13,
                    onPressed: () {},
                    icon: Icon(Icons.arrow_forward_ios_outlined),
                  ),
                ],
              ),
              //7개의 이모티콘
             EmoList(),

              SizedBox(height: 16.0),
              //emoticon feedback 이모지 피드백
              Container(

                  width: double.infinity,
                  height: 100,
                margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.red[100],
                    border: Border.all(width: 2, color: Colors.grey[300]!),
                  borderRadius:  BorderRadius.circular(10),
                ),
                child: Column(children: [
                  Center(
                    child: Container(
                        child: Center(child: Text('Most popular icons of last 7days', style: TextStyle(fontSize: 16),)),
                      width: double.infinity,
                      height: 30,
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: Center(child: Image.asset(
                        'assets/emoticons/${emotions[0]}.png',
                        //'assets/emoticons/${dailyTestList[idx]['dailyEmotion']}.png',
                        //7개짜리 리스트에 맞는 인덱스로 접근해서 이에 맞는 이모티콘을 가져옴
                        width: 50.0,
                        height: 50.0),),
                    width: double.infinity,
                    height: 66,
                  ),
                ]),
              ),
              //이번주 피드백
              Container(
                width: double.infinity,
                height: 200,
                margin: const EdgeInsets.all(10.0),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.grey[300]!),
                  borderRadius:  BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Text('Analysis of your last 7days', style: TextStyle(fontSize: 20.0)),
                    SizedBox(height: 5,),
                    Divider(thickness: 1, height: 1, color: Colors.grey[400]),
                    SizedBox(height: 10,),
                    Text(
                        EmotionExplain[emotions[0]]!),
                  ],
                ),
              ),
              //사용자 일주일 분석 문장
            ],
          ),
        ),
      ),
    );
  }
}

//var now = new DateTime.now(); //반드시 다른 함수에서 해야함, Mypage같은 클래스에서는 사용 불가능
class _BarChart extends StatelessWidget {
  //시간 변수를 선언해 두어 일주일 전으로 이동하는 것을 구현한다.
  int timeIndex = 28; //4주차의 데이터를 받아올 것이므로

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barTouchData: barTouchData,
        titlesData: titlesData,
        borderData: borderData,
        barGroups: barGroups,
        gridData: FlGridData(show: false),
        alignment: BarChartAlignment.spaceAround,
        maxY: 10,
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: true,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.transparent,
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 8,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.round().toString(),
              const TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );

  Widget getTitles(double value, TitleMeta meta) {
    final style = TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      //value값을 몇으로 주냐에 따라
      //
      case 0: // DateFormat('yy/MM/dd - HH:mm:ss').format(now)
        text =
            '${dailyTestList[0]['dailyDate']}'; //timeIndex에서 7을 뺴는 것으로 0을 바꾸면서 구현 가능할 것으로 본다.
        break;
      case 1:
        text = '${dailyTestList[1]['dailyDate']}';
        break;
      case 2:
        text = '${dailyTestList[2]['dailyDate']}';
        break;
      case 3:
        text = '${dailyTestList[3]['dailyDate']}';
        break;
      case 4:
        text = '${dailyTestList[4]['dailyDate']}';
        break;
      case 5:
        text = '${dailyTestList[5]['dailyDate']}';
        break;
      case 6:
        text = '${dailyTestList[6]['dailyDate']}';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(text, style: style),
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: getTitles,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  List<BarChartGroupData> get barGroups => [
        BarChartGroupData(
          x: 0,
          barRods: [
            BarChartRodData(
              color: Colors.grey[300],
              toY: dailyTestList[0]['dailyScore'].toDouble(),
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 1,
          barRods: [
            BarChartRodData(
              color: Colors.grey[300],
              toY: dailyTestList[1]['dailyScore'].toDouble(),
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 2,
          barRods: [
            BarChartRodData(
              color: Colors.grey[300],
              toY: dailyTestList[2]['dailyScore'].toDouble(),
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 3,
          barRods: [
            BarChartRodData(
              color: Colors.grey[300],
              toY: dailyTestList[3]['dailyScore'].toDouble(),
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 4,
          barRods: [
            BarChartRodData(

              color: Colors.grey[300],
              toY: dailyTestList[4]['dailyScore'].toDouble(),
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 5,
          barRods: [
            BarChartRodData(
              color: Colors.grey[300],
              toY: dailyTestList[5]['dailyScore'].toDouble(),
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 6,
          barRods: [
            BarChartRodData(
              color: Colors.red[200]!,
              toY: dailyTestList[6]['dailyScore'].toDouble(),
            )
          ],
          showingTooltipIndicators: [0],
        ),
      ];
}

class BarChartHome extends StatefulWidget {
  const BarChartHome({super.key});

  @override
  State<StatefulWidget> createState() => BarChartHomeState();
}

class BarChartHomeState extends State<BarChartHome> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.6,
      child: _BarChart(),
    );
  }
}



//이모티콘과 그래프 초기화를 위한 버튼
//
class EmoList extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => EmoListState();
}

class EmoListState extends State<EmoList> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Container(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List<Widget>.generate(7, (idx) {
          return InkWell(
              onTap: () {
                _showCommentDialog(context, idx);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                    'assets/emoticons/${emotions[idx]}.png',
                    //'assets/emoticons/${dailyTestList[idx]['dailyEmotion']}.png',
                    //7개짜리 리스트에 맞는 인덱스로 접근해서 이에 맞는 이모티콘을 가져옴
                    width: 44.0,
                    height: 40.0),
              ));
        })),
      ),
    );
  }

  void _showCommentDialog(BuildContext context, int idx) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Emoji selection'),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  emotions[idx] = 'angry';
                  Get.back();
                  setState(() {

                  });
                },
                child: Image.asset(
                    'assets/emoticons/angry.png',
                    width: 44.0,
                    height: 40.0),
              ),
              GestureDetector(
                onTap: () {
                  emotions[idx] = 'depressed';
                  Get.back();
                  setState(() {

                  });
                },
                child: Image.asset(
                    'assets/emoticons/depressed.png',
                    width: 44.0,
                    height: 40.0),
              ),
              GestureDetector(
                onTap: () {
                  emotions[idx] = 'excited';
                  Get.back();
                  setState(() {

                  });
                },
                child: Image.asset(
                    'assets/emoticons/excited.png',
                    width: 44.0,
                    height: 40.0),
              ),
              GestureDetector(
                onTap: () {
                  emotions[idx] = 'happy';
                  Get.back();
                  setState(() {

                  });
                },
                child: Image.asset(
                    'assets/emoticons/happy.png',
                    width: 44.0,
                    height: 40.0),
              ),
              GestureDetector(
                onTap: () {
                  emotions[idx] = 'not_bad';
                  Get.back();
                  setState(() {

                  });
                },
                child: Image.asset(
                    'assets/emoticons/not_bad.png',
                    width: 44.0,
                    height: 40.0),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancel'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red[200])
            ),
          ],
        );
      },
    );
  }
}
