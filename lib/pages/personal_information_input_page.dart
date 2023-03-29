//사용자 정보 입력
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wero/model/user.dart';
import 'package:wero/pages/main_page.dart';
import 'package:wero/pages/mbti_testing_page.dart';
import 'package:wero/api/api.dart';
import 'package:http/http.dart' as http;

class PersonalInfoInitPage extends StatefulWidget {
  @override
  _PersonalInfoInitPageState createState() => _PersonalInfoInitPageState();
}

class _PersonalInfoInitPageState extends State<PersonalInfoInitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UserInfoPage()
    );
  }
}


class UserInfoPage extends StatefulWidget {
  @override
  _UserInfoPageState createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  TextEditingController _nicknameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  String _gender = '';

  @override
  void dispose() {
    _nicknameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  //서버에 유저 정보 보내는 함수 작성
  saveUserInfo() async {
    User userModel = User( nickname: _nicknameController.text , age: int.parse(_ageController.text), sex: _gender,);
    //user클래스로 데이터가 전달되면 이를 json 포맷으로 바꿔줌
    //post로 데이터 전달하고 response를 받아야 한다.
    try {
      var res = await http.post(Uri.parse(API.userInfoSaveUrl), body:userModel.toJson());

      if(res.statusCode == 200) {
        var resUserInfoSave = jsonDecode(res.body);
        if(resUserInfoSave['success']==true) { //body의 sucess의 값이 true라면 이를 알려줌
          print('사용자 정보 저장 완료 ');
        }
        else {
          print('에러 발생');
        }
      }
    }catch(e) {
      print('에러발생');
    }
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(iconTheme : IconThemeData(color: Colors.black), backgroundColor: Colors.white,
        title: Text('User Info',style: TextStyle(fontSize: 25, color: Colors.black),), centerTitle: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nickname',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                SizedBox(height: 8.0),
                TextFormField(
                  key: ValueKey(1),
                  controller: _nicknameController,
                  decoration: InputDecoration(
                    hintText: 'Enter nickname',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value?.length==0) {
                      return 'Nickname cannot be empty';
                    }
                    RegExp regex = RegExp(r'^[a-zA-Z0-9]+$');
                    if (!regex.hasMatch(value!)) {
                      return 'Nickname can only contain English letters and numbers';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                Text(
                  'Age',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                SizedBox(height: 8.0),
                TextFormField(
                  key: ValueKey(2),
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Enter age',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value?.length==0) {
                      return 'Age cannot be empty';
                    }
                    int? age = int.parse(value!);
                    if (age == null || age <= 0) {
                      return 'Age must be a positive integer current: $age';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30.0),
                Text(
                  'Gender',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    SizedBox(width: 15,),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            _gender = 'male';
                          });
                        },
                        icon: Icon(Icons.male),
                        label: Text('Male'),
                        style: ElevatedButton.styleFrom(
                          primary:
                          _gender == 'male' ? Colors.blue : Colors.grey[300],
                        ),
                      ),
                    ),
                    SizedBox(width: 40.0),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            _gender = 'female';
                          });
                        },
                        icon: Icon(Icons.female),
                        label: Text('Female'),
                        style: ElevatedButton.styleFrom(
                          primary: _gender == 'female'
                              ? Colors.pink
                              : Colors.grey[300],
                        ),
                      ),
                    ),
                    SizedBox(width: 15,),
                  ],
                ),
                SizedBox(height: 150.0),

                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {//폼 상태가 유효하면 제대로 됨
                        // Do something with the user information
                        String nickname = _nicknameController.text;
                        int age = int.parse(_ageController.text);
                        String gender = _gender;
                        print('Nickname: $nickname');
                        print('Age: $age');
                        print('Gender: $gender');



                        Get.to(MbtiTestingPage());
                      }
                      else{
                        print('input error happend');
                      }
                    },
                    child: Text('Submit', style: TextStyle(fontSize: 17, color: Colors.black),),
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(168, 38),
                      primary: Colors.blue[300], // Background color
                    ),
                  ),
                ),

                SizedBox(height: 20),

                Center(
                  child: ElevatedButton(onPressed: (){
                    Get.to(MainPage());
                  }, child: Text('Pass'),
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(50, 38),
                      primary: Colors.blue[300], // Background color
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}