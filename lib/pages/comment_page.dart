
//댓글창

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wero/pages/bulletin_board_page.dart';

class CommentScreen extends StatefulWidget {
  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  List<Comment> _comments = [
    Comment('HealthEnthusiast23', 'I completely agree with you! Exercise has done wonders for my mental and physical health. !'),
    Comment('FitnessJunkie88', 'Thank you for sharing these tips! I struggle with getting enough sleep'),
    Comment('WellnessWarrior11', 'I love incorporating superfoods into my meals!'),
    Comment('HealthyEats99', 'It\'s so important to get vaccinated to protect ourselves and those around us'),
    Comment('ActiveAdventurer77', 'I\'ve been practicing mindfulness meditation for a few months now and I can\'t believe how much it\'s helped me manage my stress and anxiety'),
    Comment('MindfulMeditator22', 'I used to be intimidated by strength training, but now it\'s one of my favorite types of exercise. '),
    Comment('HappyHeart33', 'I think mental health is often overlooked, but it\'s just as important as physical health.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar(
      //   backgroundColor: Colors.white,
      //   centerTitle: false,
      //   titleSpacing: 0.0,
      //   title: Text(
      //     'For you',
      //     style: TextStyle(
      //       color: Colors.black,
      //       fontSize: 47,
      //     ),
      //   ),
      //   toolbarHeight: 90,
      // ),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,//색변경
        ),
        backgroundColor: Colors.white,
        title: Text('Comments', style: TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),),
        toolbarHeight: 70,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _comments.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Icon(
                    Icons.person
                  ),
                  title: Text(_comments[index].user),
                  subtitle: Text(_comments[index].comment),
                );
              },
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          FloatingActionButton(
            onPressed: () => _showCommentDialog(context),
            child: Icon(Icons.add),
            backgroundColor: Colors.purple[100],
          ),
          SizedBox(height: 20,)
        ],
      ),
    );
  }

  void _showCommentDialog(BuildContext context) {
    String _user;
    String _comment = ' ';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Comment'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('user default name'),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your comment',
                ),
                onChanged: (value) {
                  _comment = value;
                },
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple[200])
            ),
            ElevatedButton(
             style: ElevatedButton.styleFrom(backgroundColor: Colors.purple[200]),
              onPressed: () {
                setState(() {
                  _comments.add(Comment('user default', _comment)); // 댓글 추가 하기
                });
                Get.back();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}

class Comment {
  String user;
  String comment;

  Comment(this.user, this.comment);
}
