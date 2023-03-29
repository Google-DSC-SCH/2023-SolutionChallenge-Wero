import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wero/objects/mbti_result.dart';
import 'package:wero/pages/main_page.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'dart:typed_data';
import 'package:wero/objects/mbti_key_value.dart';

class MbtiResult extends StatelessWidget {
  var mbtiResult;

  MbtiResult(this.mbtiResult);

  var input1 =3;
  //Random().nextInt(16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      body: Column(
        children: [
          Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
            child: Text('The Score result is $mbtiResult',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(10.0))
            ),
            child: Container(
              padding: EdgeInsets.all(15),
              child: Center(

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 40),
                    Image.asset('assets/mbti/mbti_$input1.png'),//mbti사진 보여주기
                    SizedBox(height: 20),
                    Text('Your PATI is ${KeyMBTIMap[input1]}',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15),
                    Divider(thickness: 1, height: 1, color: Colors.grey[300]),
                    SizedBox(height: 15),
                    Text(MBTIInfo[input1]['explanation']!,
                      style: TextStyle(
                      fontSize: 16,
                    ),
                    ),
                    SizedBox(height: 10),

                    ElevatedButton(
                      onPressed: () {
                        Get.off(MainPage());
                      },
                      child: Text('Go to Main Page', style: TextStyle(fontSize: 17, color: Colors.black),),
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(168, 38),
                        primary: Colors.lightGreen[300], // Background color
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );


  }



  //테스트 결과값 리턴하는 함수
  //machine learning model using
  // classify(List<int> testResult) async {
  //   var interpreter = await Interpreter.fromAsset('assets/ML_model/MBTI_predcition.tflite');
  //
  //   var inputType = interpreter.getInputTensor(0).type;
  //   var outputType = interpreter.getOutputTensor(0).type;
  //   var inputShape = interpreter.getInputTensor(0).shape;
  //   var outputShape = interpreter.getOutputTensor(0).shape;
  //
  //
  //
  //   var input = List.filled(1, List.filled(4, 0), growable: false);
  //
  //   input[0] = testResult;
  //
  //
  //   // var inputTensor = Tensor.fromList(inputType, inputShape, input);
  //   // interpreter.run(inputTensor.buffer, [output.buffer]);
  //   //
  //   // var outputs = List.filled(interpreter.getOutputTensor(0).shape.reduce((a, b) => a * b), 0).reshape(interpreter.getOutputTensor(0).shape);
  //   // interpreter.run(inputs, outputs);
  //   //
  //   // var output = interpreter.getOutputTensor(0);
  //   // var outputList = output.toList().cast<double>();
  //   //
  //   // print(outputData);
  // }

}

