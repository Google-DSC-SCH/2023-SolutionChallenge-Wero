import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wero/pages/comment_page.dart';

class PostCard extends StatefulWidget {
  String number = '1';
  String userName = '.', mbti= '.', title= '.', content= '.', imagePath= 'example.jpg';

  PostCard({ required this.number, required this.userName, required this.mbti, required this.title, required this.content, required this.imagePath}) ;

  @override
  _PostCardState createState() => _PostCardState();
}
//num 을 게시글 번호로 사용해야 할 것
//widget. 을 통해 입력 받은 변수를 사용 가능함

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [Container(
          padding: EdgeInsets.all(20),
            child: Column(
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Row(children: [
                  // CircleAvatar(
                  //   radius: 15,
                  //   backgroundImage: Image(),//사용자 사진 넣기
                  // ),
                  Icon( Icons.person ),
                  SizedBox(width: 5, ),
                  Text(widget.userName, style: TextStyle(fontSize: 16, color: Colors.black,),),
                  SizedBox(width: 10),
                  Text(widget.mbti, style: TextStyle(fontSize: 16, color: Colors.black),),
                ])),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Center(child: Image.asset('assets/image/${widget.imagePath}', fit: BoxFit.cover,)),
            ),
            Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                          'Title: ${widget.title}',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: 7),
                    IconButton(
                      icon: Icon(
                        Icons.mode_comment_outlined,
                      ),
                      onPressed: () {
                        print('Comment has been clicked ');
                        Get.to(CommentScreen());
                      },
                    ),
                  ],
                )),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Center(
                  child: Text(widget.content)),
            ),
          ],
        )),


        ]
      ),
    );
  }
}
