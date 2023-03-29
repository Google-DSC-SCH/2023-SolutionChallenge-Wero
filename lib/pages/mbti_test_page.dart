//mbti검사 기능
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wero/objects/animal_explanation.dart';
import 'package:wero/objects/mbti_key_value.dart';
import 'package:wero/objects/mbti_result.dart';
import 'package:wero/pages/mbti_testing_page.dart';

class MbtiTestPage extends StatefulWidget {
  @override
  _MbtiTestPageState createState() => _MbtiTestPageState();
}

class _MbtiTestPageState extends State<MbtiTestPage> {
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
       child:Column(
         children: [
           Container(
             margin: EdgeInsets.all(15),
             decoration: BoxDecoration(
                 color: Colors.white,
                 border: Border.all(color: Colors.grey[200]!),
                 borderRadius: BorderRadius.all(Radius.circular(10.0))
             ),
             child: Container(
               padding: EdgeInsets.all(15),
               child: Center(
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     SizedBox(height: 40),
                     Image.asset('assets/mbti/mbti_3.png'),//mbti사진 보여주기 mbti_${MBTIKeyMap[내가 받아올 mbti값]}로 받아와야함
                     SizedBox(height: 20),
                     Text('Your PATI is ${KeyMBTIMap[3]}',
                       style: TextStyle(
                         fontSize: 25,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                     SizedBox(height: 15),
                     Divider(thickness: 2, height: 2, color: Colors.grey[300]),
                     SizedBox(height: 15),
                     Text(MBTIInfo[3]['explanation']!,
                       style: TextStyle(
                         fontSize: 16,
                       ),
                     ),
                     SizedBox(height: 15),
                     Divider(thickness: 2, height: 2, color: Colors.grey[300]),
                   ],
                 ),
               ),
             ),
           ),
            Container(
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey[200]!),
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  children: [
                    Center(child: Text('ANIMAL DESCRIPTION',style: TextStyle(
                      fontSize: 17,
                    ),),),
                    SizedBox(height: 40,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            print('elephant clicked');
                            Get.to(AnimalDescription('elephant'));
                          }, // Image tapped
                          child: Image.asset('assets/animals/elephant.png',
                            fit: BoxFit.cover, // Fixes border issues
                            width: 100.0,
                            height: 100.0,
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            Get.to(AnimalDescription('hamster'));
                          }, // Image tapped
                          child: Image.asset('assets/animals/hamster.png',
                            fit: BoxFit.cover, // Fixes border issues
                            width: 100.0,
                            height: 100.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(AnimalDescription('meerkat'));
                          }, // Image tapped
                          child: Image.asset('assets/animals/meerkat.png',
                            fit: BoxFit.cover, // Fixes border issues
                            width: 100.0,
                            height: 100.0,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(AnimalDescription('lion'));
                          }, // Image tapped
                          child: Image.asset('assets/animals/lion.png',
                            fit: BoxFit.cover, // Fixes border issues
                            width: 100.0,
                            height: 100.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(AnimalDescription('beagle'));
                          }, // Image tapped
                          child: Image.asset('assets/animals/beagle.png',
                            fit: BoxFit.cover, // Fixes border issues
                            width: 100.0,
                            height: 100.0,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(AnimalDescription('sloth'));
                          }, // Image tapped
                          child: Image.asset('assets/animals/sloth.png',
                            fit: BoxFit.cover, // Fixes border issues
                            width: 100.0,
                            height: 100.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(AnimalDescription('fox'));
                          }, // Image tapped
                          child: Image.asset('assets/animals/fox.png',
                            fit: BoxFit.cover, // Fixes border issues
                            width: 100.0,
                            height: 100.0,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(AnimalDescription('capybara'));
                          }, // Image tapped
                          child: Image.asset('assets/animals/capybara.png',
                            fit: BoxFit.cover, // Fixes border issues
                            width: 100.0,
                            height: 100.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50,),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to(MbtiTestingPage());
                        },
                        child: Text('RETEST', style: TextStyle(fontSize: 17, color: Colors.black),),
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(168, 38),
                          primary: Colors.purple[200], // Background color
                        ),
                      ),
                    )
                  ],
                ),
              )
            ),

          ],
        ),
     ),
   );
  }
}

class AnimalDescription extends StatelessWidget{
  String animal;
  AnimalDescription(this.animal);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightGreen[100],
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.all(35),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: Column(
                    children: [
                      Image.asset('assets/animals/$animal.png',
                        fit: BoxFit.cover, // Fixes border issues
                        width: 200.0,
                        height: 200.0,
                      ),
                      SizedBox(height: 30,),
                      Center(
                        child: Text('$animal',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 30,),
                      Divider(thickness: 2, height: 2, color: Colors.grey[300]),
                      SizedBox(height: 10,),
                      Text('${AnimalExplanation[animal]}',
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(height: 10,),
                      ElevatedButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text('OK', style: TextStyle(fontSize: 17, color: Colors.black),),
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(168, 38),
                          primary: Colors.blue[200], // Background color
                        ),
                      ),
                    ],
                  )
                )
            )
        )
    );
  }
}
