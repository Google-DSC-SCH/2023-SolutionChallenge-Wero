//메인 페이지
import 'package:flutter/material.dart';
import 'package:wero/pages/mbti_test_page.dart';
import 'package:wero/pages/mbti_testing_page.dart';
import 'package:wero/pages/recommendation_page.dart';
import 'package:wero/pages/bulletin_board_page.dart';
import 'package:wero/pages/diary_page.dart';
import 'package:wero/pages/home_page.dart';
//페이지 연결및 정의 페이지 app 바와 네비게이션 바 구성
//푸시 알림 테스트 시간 되었을떄 9시 쯤?


class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 2;
  List<BottomNavigationBarItem> bottomItems= [
    BottomNavigationBarItem( //재검사 버튼
      label: 'MBTI test',
      icon: Icon(Icons.youtube_searched_for),
    ),
    BottomNavigationBarItem(//추천기능 활성화
      label: 'Recommend',
      icon: Icon(Icons.recommend),
    ),
    BottomNavigationBarItem(//메인페이지
      label: 'Home',
      icon: Icon(Icons.home),
    ),
    BottomNavigationBarItem(//게시판
      label: 'Bulletin Board',
      icon: Icon(Icons.calendar_today_outlined),
    ),
    BottomNavigationBarItem(//일기 아이콘
      label: 'Diary',
      icon: Icon(Icons.book_outlined),
    ),
  ];

  //페이지를 이동하기 위해 연결하는 페이지들
  List pages = [
    MbtiTestPage(),
    RecommendPage(),
    HomePage(),
    CommunityPage(),
    DiaryPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 10,
        currentIndex: _selectedIndex, //현재 아이템의 인덱스 상태 체크
        onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
        },
        items: bottomItems,
      ),
    );
  }
}