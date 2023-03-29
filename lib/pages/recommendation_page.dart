//추천하기/ 받기 페이지
import 'package:flutter/material.dart';
import 'package:wero/objects/mbti_key_value.dart';
import 'package:wero/objects/mbti_result.dart';

class RecommendPage extends StatefulWidget {
  @override
  _RecommendPageState createState() => _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MusicRecommendationsScreen(),
    );
  }
}

class MusicRecommendationsScreen extends StatefulWidget {
  @override
  State<MusicRecommendationsScreen> createState() => _MusicRecommendationsScreenState();
}

class _MusicRecommendationsScreenState extends State<MusicRecommendationsScreen> {
  List<Map> musicRecommendList = [
    //플레이 리스트 변수
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: false,
          titleSpacing: 0.0,
          title: Text(
            'For you',
            style: TextStyle(
              color: Colors.black,
              fontSize: 47,
            ),
          ),
          toolbarHeight: 90,
        ),
        body: SingleChildScrollView(
          child: Container(

            margin: EdgeInsets.all(15),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.green[800],
                    border: Border.all(color: Colors.grey[200]!),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center ,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Your PATI type and today emotion is',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),

                      Container(
                        //Center Column contents horizontally,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(width: 60,),
                            Text(
                              'EMSF',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Image.asset(
                          'assets/emoticons/happy.png',
                          //'assets/emoticons/${dailyTestList[idx]['dailyEmotion']}.png',
                          //7개짜리 리스트에 맞는 인덱스로 접근해서 이에 맞는 이모티콘을 가져옴
                          width: 45.0,
                            height: 45.0),
                            SizedBox(width: 60),

                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[200]!),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  padding: EdgeInsets.all(15),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Recommended Playlist',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                              ),
                            ),
                            SizedBox(width: 40,),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  Song.shuffle();
                                });
                              },
                            icon: Icon(Icons.replay_circle_filled_rounded, color: Colors.grey[600],),)
                          ],
                        ),
                        Column(
                            children: List.generate(5, (index) {
                              return Music(title: Song[index]['title']!, artist: Song[index]['artist']!, songURL: Song[index]['songURL']!);
                            }
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }

  Widget Music({required String title, required String artist, required String songURL}){
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[400]!),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(songURL, width: 70, height: 70,),
              SizedBox(width: 20,),
              Column(
                children: [
                  Text(title, style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),),
                  SizedBox(height: 10,),
                  Text(artist,  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class SongListScreen extends StatelessWidget {
  final String playlist;
  final List<String> songs;

  SongListScreen({required this.playlist, required this.songs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(playlist),
      ),
      body: ListView.builder(
        itemCount: songs.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(songs[index]),
          );
        },
      ),
    );
  }
}


// Music(title: '위잉위잉', artist: '혁오', songURL: ''),
var Song =  [
  {
    'title': 'Paris in the rain',
    'artist' : 'Lauv',
    'songURL' : 'assets/album/cover1.jpg'
  },
  {
    'title': 'Hype boy',
    'artist' : 'New jeans',
    'songURL' : 'assets/album/cover2.jpg'
  },
  {
    'title': 'Stay',
    'artist' : 'Justin Bieber',
    'songURL' : 'assets/album/cover3.jpg'
  },
  {
    'title': 'Chandlier',
    'artist' : 'Sia',
    'songURL' : 'assets/album/cover4.jpg'
  },
  {
    'title': 'Someone Like You',
    'artist' : 'Adele',
    'songURL' : 'assets/album/cover5.jpg'
  },
  {
    'title': 'LOVE.',
    'artist' : 'Kendrick Lemar',
    'songURL' : 'assets/album/cover6.jpg'
  },
  {
    'title': 'Empire State of Mind ',
    'artist' : 'Jay-Z',
    'songURL' : 'assets/album/cover7.jpg'
  },
  {
    'title': 'Halo',
    'artist' : 'Beyonce',
    'songURL' : 'assets/album/cover8.jpg'
  },
  {
    'title': 'Sugar',
    'artist' : 'Maroon5',
    'songURL' : 'assets/album/cover9.jpg'
  },
  {
    'title': 'Attention',
    'artist' : 'Charlie Puth',
    'songURL' : 'assets/album/cover10.jpg'
  },
];