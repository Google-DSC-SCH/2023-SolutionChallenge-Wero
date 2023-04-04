//로그인 페이지
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wero/model/user.dart';
import 'package:wero/pages/main_page.dart';
import 'package:get/get.dart';
import 'package:wero/pages/personal_information_input_page.dart';
import 'package:http/http.dart' as http;
import 'package:wero/api/api.dart';
import 'package:wero/model/access_regen.dart';

//AccessReGen accessToken = AccessReGen(message: 'success', accessToken: accessToken);

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

// post의 사용 예시
// checkUserEmail() async {
//   try{
//     var response = await http.post(
//       Uri.parse(API.correctCommentUrl),
//       body: {
//         //원하는 데이터를 전달하는 코드를 작성 ex 'user_email':emailController.text.trim()
//       }
//     );
//     if(response.statusCode == 200) { //응답코드가 참이면
//       //제대로 응답이 왔을때의 이벤트 처리
//     }
//   }
//   catch(e) {
//
//   }
//}


class _LoginPageState extends State<LoginPage> {

  loginCheck() async{ // 로그인 메서드 통신후 결과를 받아야 할 것이므로 a
    try {
      final url = Uri.parse(API.socialLoginUrl);
       launchUrl(url, mode: LaunchMode.externalApplication);

      var response = await http.get(Uri.parse(API.hostConnectUrl),
         headers: <String,String> {"accessToken":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJwcm92aWRlciI6Imdvb2dsZSIsImVtYWlsIjoiZGlub2hqYjIzMzFAZ21haWwuY29tIiwiaWF0IjoxNjgwNjAzODUzLCJleHAiOjE2ODA2OTAyNTN9.RFePXhimssNJ-HGQpiVDcPCN_vSNTw6Z7K86L-0gv3A","refreshToken":"a095ede3-8ce1-42dc-8bc9-615bea168241"}
      );
      Get.offAll(PersonalInfoInitPage());
      var responseBody = jsonDecode(response.body);
      print('왜안돼? ${response.headers}');
      
      if(response.statusCode == 200) {//로그인이 정상적으로 되면 페이지 이동이 발생하도록 함
        print('User has been logined ');
        Get.offAll(PersonalInfoInitPage());
      }
    }
    catch(e) {
      print('error');
    }
  }

  @override
  Widget build(BuildContext context ) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image(image: AssetImage('assets/app_icon/Wero.png')),
                SizedBox(height: 20,),
                SizedBox(height: 50,
                  child: ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.white)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.all(5.0),child: Image.asset('assets/app_icon/google_icon.png')),
                      SizedBox(width: 20),
                      Text('Login with Google', style: TextStyle(color: Colors.black, fontSize: 16)),
                      Opacity(opacity: 0.0, child:Image.asset('assets/app_icon/google_icon.png'),),
                    ],
                  ),
                  onPressed: () {
                     loginCheck();
                    // Get.offAll(PersonalInfoInitPage());
                  },
                ),
                ),
              ],
            ),
        ),
      )
    );
  }
}