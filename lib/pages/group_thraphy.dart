//추천하기/ 받기 페이지
import 'package:flutter/material.dart';
import 'package:wero/objects/mbti_key_value.dart';

class GroupTheraphy extends StatefulWidget {
  @override
  State<GroupTheraphy> createState() => _GroupTheraphyState();
}

class _GroupTheraphyState extends State<GroupTheraphy> {
  int screenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //색변경
        ),
        backgroundColor: Colors.white,
        title: Text(
          'GROUP THERAPHY',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        toolbarHeight: 80,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15),
          child: Column(children: [
            Container(
              // 버튼 선택 영역
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey[200]!),
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          screenIndex = 1;
                          setState(() {

                          });
                        },
                        child: Container(
                          width: 160,
                          height: 160,
                          //Psychological Test
                          //Solving the problem through consultation with a professional counselor
                          child: Flexible(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [Text('Psychological \n Test',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 19.0,
                                     ),
                              ),
                            SizedBox(height: 10,),
                            Text('Solving the problem through consultation with a professional counselor',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10.0,
                              ),
                            ),]
                            )
                          ),
                          decoration: BoxDecoration(
                              color: screenIndex==1 ? Colors.lightGreen[900]: Colors.lightGreen[400],
                              border: Border.all(color: Colors.grey[200]!),
                              borderRadius: BorderRadius.all(Radius.circular(10.0))),
                          padding: EdgeInsets.all(15),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          screenIndex = 2;
                          setState(() {

                          });
                        },
                        child: Container(
                          //Group
                          //Share and communicate with people with similar concerns
                          height: 160,
                          width: 160,
                          child: Flexible(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Group           ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 19.0,
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Text('Share and communicate with people with similar concerns',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                              color:  screenIndex==2 ? Colors.teal[900]: Colors.teal[400],
                              border: Border.all(color: Colors.grey[200]!),
                              borderRadius: BorderRadius.all(Radius.circular(10.0))),
                          padding: EdgeInsets.all(15),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    //Psychological Counseling
                    //Assess your psychological state through a psychological test
                    GestureDetector(
                      onTap: () {
                        screenIndex = 3;
                        setState(() {

                        });
                      },
                      child: Container(
                        height: 160,
                        width: 160,
                        child: Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Psychological \nCounseling',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19.0,
                                ),
                              ),
                              SizedBox(height: 10,),
                              Text('Assess your psychological state through a psychological test',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                            color:  screenIndex==3 ? Colors.brown[900]: Colors.brown[300],
                            border: Border.all(color: Colors.grey[200]!),
                            borderRadius: BorderRadius.all(Radius.circular(10.0))),
                        padding: EdgeInsets.all(15),
                      ),
                    ),
                    //Coaching
                    //Suggest ways to achieve the goals
                    GestureDetector(
                      onTap: () {
                        screenIndex = 4;
                        setState(() {

                        });
                      },
                      child: Container(
                        height: 160,
                        width: 160,
                        child: Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Coaching          ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19.0,
                                ),
                              ),
                              SizedBox(height: 10,),
                              Text('Suggest ways to achieve the goals',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: screenIndex==4 ? Colors.lime[900]: Colors.lime[600],
                            border: Border.all(color: Colors.grey[200]!),
                            borderRadius: BorderRadius.all(Radius.circular(10.0))),
                        padding: EdgeInsets.all(15),
                      ),
                    ),
                  ]),
                ],
              ),

            ),
            //버튼 아래 선택영역
            SizedBox(height: 20),
            UnderScreen(screenIndex)!
          ]
          ),
        ),
      ),
    );
  }

  Widget? UnderScreen(int num) {
    switch (num) {
      case 0:
        return BasicScreen();
      case 1:
        return PsychoTest();
      case 2:
        return Group();
      case 3:
        return PsychoCounseling();
      case 4:
        return Coaching();
      default:
        BasicScreen();
    }
  }
}


var specialList = [
  {
    'name' : 'SarahThompson ',
    'introduction' : 'I am a licensed counselor with experience in helping clients manage anxiety and depression.'
  },
  {
    'name' : 'Michael Lee',
    'introduction' : 'I specialize in working with couples to improve communication and build stronger relationships.'
  },
  {
    'name' : 'Jennifer Chen',
    'introduction' : 'As a grief counselor, I help clients navigate the difficult emotions and challenges that come with loss'
  },
  {
    'name' : 'David Kim',
    'introduction' : ' I have expertise in working with children and adolescents who struggle with behavioral issues or ADHD.'
  },
  {
    'name' : 'Lisa Patel',
    'introduction' : 'My focus as a counselor is on empowering clients to overcome personal obstacles and achieve their goals.'
  },
];

Widget BasicScreen() {

  return Container(
    child: Column(
      children: [
        Text('Referral Specialist',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        SizedBox(height: 20),
        Container(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: specialList.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: 150,
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      width: 3.0,
                    color: Colors.grey,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person),
                    SizedBox(height: 10),
                    Center(
                      child: Text(
                        specialList[index]['name']!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      specialList[index]['introduction']!,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.call),
                        Icon(Icons.video_call),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ]
      )
      );
}

Widget PsychoTest() {
  return Container(
    margin: EdgeInsets.all(12),
    child: Column(
      children: [
        Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[400]!),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            padding: EdgeInsets.all(12),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.red[200]!
                  ),
                  child: Text(
                    'MMPI: Minnesota Multiphasic Personality Inventory',
                    style: TextStyle(
                    fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  )
                ),
                SizedBox(height: 10,),
                Text('he MMPI is a widely used personality test that assesses a wide range of psychological symptoms and disorders, including depression, anxiety, and personality disorders.')
              ]
            )
        ),
        Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[400]!),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            padding: EdgeInsets.all(12),
            child: Column(
                children: [
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.orange[200]!
                      ),
                      child: Text(
                        'Wechsler Intelligence Scale for Children (WISC)',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                  ),
                  SizedBox(height: 10,),
                  Text('The WISC is a standardized intelligence test designed for children between the ages of 6 and 16.')
                ]
            )
        ),
        Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[400]!),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            padding: EdgeInsets.all(12),
            child: Column(
                children: [
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.green[200]!
                      ),
                      child: Text(
                        'Rorschach Inkblot Test',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      )
                  ),
                  SizedBox(height: 10,),
                  Text('The Rorschach test is a projective test that uses inkblot images to assess personality and emotional functioning. ')
                ]
            )
        ),
        Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[400]!),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            padding: EdgeInsets.all(12),
            child: Column(
                children: [
                  Container(
                      decoration: BoxDecoration(
                       color: Colors.blue[200]!
                      ),
                      child: Text(
                        'Thematic Apperception Test (TAT)',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      )
                  ),
                  SizedBox(height: 10,),
                  Text('The TAT is another projective test that uses a series of ambiguous pictures to elicit responses about a person\'s thoughts, feelings, and motivations. ')
                ]
            )
        ),
      ],
    ),
  );
}

Widget Group() {
  return Container(
    margin:EdgeInsets.all(0),
    width: 330,
    child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/group/1.png', fit: BoxFit.cover),
            SizedBox(height: 10,),
            Image.asset('assets/group/2.png', fit: BoxFit.cover),
            SizedBox(height: 10,),
            Image.asset('assets/group/3.png', fit: BoxFit.cover),
            SizedBox(height: 10,),
            Image.asset('assets/group/1.png', fit: BoxFit.cover),
          ],
        )
    ),
  );
}

Widget PsychoCounseling() {
  return Container(
    margin:EdgeInsets.all(0),
    width: 330,
    child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/group/4.png', fit: BoxFit.cover),
            SizedBox(height: 10,),
            Image.asset('assets/group/4.png', fit: BoxFit.cover),
          ],
        )
    ),
  );
}

Widget Coaching() {
  return Container(
    margin:EdgeInsets.all(0),
    width: 330,
    child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/group/4.png', fit: BoxFit.cover),
            SizedBox(height: 10,),
            Image.asset('assets/group/4.png', fit: BoxFit.cover),
          ],
        )
    ),
  );
}