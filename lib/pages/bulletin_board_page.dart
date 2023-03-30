//게시판 기능
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wero/cards/post_card.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:wero/objects/mbti_key_value.dart';
class CommunityPage extends StatefulWidget {
  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  String result = '';
  bool Issues = false;
  bool BBS = true;// true 는 커뮤니티 false는 뉴스
  List<bool> isSelected = [true, false];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: BBS?'BBS':'ISSUES'),
        body: Stack(
            clipBehavior: Clip.none,// 정해진 위젯 밖으로 튀어 나가게 하기
            children: [
              isSelected[0]?  SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(8, (index) {
                     return PostCard(number: index.toString(), userName: Post[index]['userName']!, mbti: KeyMBTIMap[index]!, title: Post[index]['title']!, content: Post[index]['content']!, imagePath: Post[index]['image']!, );
                    }
                  ),
            ),
              ):
              NewsArea(),
            Positioned(
              top: -40,
              right: 40,
              child: ToggleButtons(
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text('BBS', style: TextStyle(fontSize: 18))),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text('ISSUE', style: TextStyle(fontSize: 18))),
                ],
                isSelected: isSelected,
                onPressed: (index) {
                  if (index == 0) {
                    BBS = true;
                    Issues = false;
                  } else {
                    BBS = false;
                    Issues = true;
                  }
                  setState(() {
                    isSelected = [BBS, Issues];
                  });
                },
              ),
            ),
          ]
        )
    );
  }
  final NewsApiKey = Uri.parse(
    'https://newsapi.org/v2/top-headlines?country=us&category=health&apiKey=ac16a4074b8544e2b47e66017cf77dab',
  );

  //Future.delayed(Duration(seconds:2)
  //뉴스 앱 구현 하기
  Future<List<News>> _getNews() async{
    var data = await Future.delayed(Duration(seconds:2),(){ http.get(NewsApiKey);});
    var jsonData = json.decode(data.body);
    print('Response status: ${data.statusCode}');

    for(int i=0; i<10; i++)print ('${jsonData['articles'][i]['title']},${jsonData['articles'][i]['description']}');

    List<News> newses = [];

    for(int i=0; i<3; i++) {
      News newNews = News(publishedAt: jsonData['articles'][i]["publishedAt"], urlToImage: jsonData['articles'][i]["urlToImage"],
          title: jsonData['articles'][i]["title"], url: jsonData['articles'][i]["url"], description: jsonData['articles'][i]["description"]);
      print('${jsonData['articles'][i]['title']},${jsonData['articles'][i]['description']}');
      newses.add(newNews);
      print(newses[i].title);
    }

    return newses;
  }

  Widget NewsArea() {
    return Container(
      child: FutureBuilder(
        future: _getNews(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if(snapshot.data==null){
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              )
            );
          }else {
            return ListView. builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  isThreeLine: true,
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      snapshot.data[index].urlToImage
                    ),
                  ),
                  title: Text(snapshot.data[index].title),
                  subtitle: Column(
                    children:[
                      Text(snapshot.data[index].publishedAt),
                     Text(snapshot.data[index].description),
                  ]
                  ),
                  onTap: () async {
                    final url = Uri.parse('${snapshot.data[index].url}');
                    launchUrl(url, mode: LaunchMode.externalApplication);
                  },
                );
              },
            );
          }
        },
      )
    );
  }

}

//PostCard({required int num, required userName, required mbti, required title, required content, required imagePath}) ;
List<Map<String, dynamic>> Post = [
{
  'num': '0',
  'userName' : 'johndoe87',
  'title' : 'A day in the park',
  'content' : 'Yesterday, I spent the day in the park and it was so much fun! I played frisbee with my friends, had a picnic, and even went for a swim in the lake. I can\'t wait to do it again soon.',
  'image' : 'park.jpg'
},
  {
    'num': '1',
    'userName' : 'sarahjane99',
    'title' : 'The Power of Superfoods',
    'content' : ' Superfoods are nutrient-dense foods that can provide a variety of health benefits. From blueberries to kale, here are some of the best superfoods to add to your diet',
    'image' : 'pasta.jpg'
  },
  {
    'num': '2',
    'userName' : 'fitnesslover23',
    'title' : 'My morning workout routine',
    'content' : 'I always start my day with a workout to get energized and ready for the day. Here\'s my morning workout routine',
    'image' : 'workout.jpg'
  },
  {
    'num': '3',
    'userName' : 'healthyhabits22',
    'title' : 'The Benefits of Regular Exercise',
    'content' : 'Exercise is one of the best things you can do for your health. It can help prevent chronic diseases, boost your mood, and even improve brain function. Here are some of the benefits of regular exercise',
    'image' : 'workout2.jpg'
  },
  {
    'num': '4',
    'userName' : 'medicalstudent99',
    'title' : 'The Importance of Sleep',
    'content' : 'Getting enough sleep is crucial for our health. Lack of sleep can lead to a variety of health problems, including obesity, diabetes, and heart disease. Here are some tips for getting a good night\'s sleep',
    'image' : 'sleep.jpg'
  },
  {
    'num': '5',
    'userName' : 'mentalhealthawareness22',
    'title' : 'The Benefits of Mindfulness Meditation',
    'content' : 'Mindfulness meditation is a practice that can help reduce stress, improve focus, and boost well-being. Here are some tips for practicing mindfulness meditation',
    'image' : 'mind.jpg'
  },
  {
    'num': '6',
    'userName' : 'healthcarepro555',
    'title' : ' The Importance of Vaccinations',
    'content' : 'Yesterday, I spent the day in the park and it was so much fun! I played frisbee with my friends, had a picnic, and even went for a swim in the lake. I can\'t wait to do it again soon.',
    'image' : 'example.jpg'
  },
  {
    'num': '7',
    'userName' : ': healthylifestyle99',
    'title' : ' The Dangers of Sitting Too Much',
    'content' : 'Sitting for long periods of time can have negative effects on our health, including an increased risk of obesity, diabetes, and heart disease. Here are some tips for reducing sitting time',
    'image' : 'sitting.jpg'
  },
];

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double barHeight = 10.0;
  MainAppBar({required this.title});
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 80.0);
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        child: ClipPath(
          clipper: WaveClipper(),
          child: Container(
            color: Colors.indigo,
            child: SizedBox(
              height: 160,
              child: Stack(
                children:[
                  Container(
                    padding: EdgeInsets.all(35),
                    child: Text('$title',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                  ),
                ]
              )
            ),
          ),
        ),
        preferredSize: Size.fromHeight(kToolbarHeight + 80));
  }
}

class News {
  final String publishedAt;
  final String urlToImage;
  final String title;
  final String url;
  final String description;

  News({required this.publishedAt, required this.urlToImage ,required this.title, required this.url, required this.description});
}

//Costom CLipper class with Path
class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(
        0, size.height - 20); //start path with this if you are making at bottom

    var firstStart = Offset(size.width / 5, size.height);
    //fist point of quadratic bezier curve
    var firstEnd = Offset(size.width / 2.5, size.height - 55.0);
    //second point of quadratic bezier curve
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    var secondStart = Offset(size.width - (size.width / 2.5), size.height - 130);
    //third point of quadratic bezier curve
    var secondEnd = Offset(size.width, size.height - 45);
    //fourth point of quadratic bezier curve
    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);

    path.lineTo(
        size.width, 0); //end with this path if you are making wave at bottom
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true; //if new instance have different instance than old instance
    //then you must return true;
  }
}
