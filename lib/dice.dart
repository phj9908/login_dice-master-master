import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Dice extends StatefulWidget {
  @override
  _DiceState createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  
  int leftDice=1;
  int rightDice=1;
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Dice game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,  // column의 중간에 이미지가 놓이게
          children: <Widget>[

            Padding(    // 주사위가 있는 row위젯을 화면 가운데 놓기위해 padding으로 감싼다.
              padding: EdgeInsets.all(32.0),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.center,  // row의 중간에 이미지가 놓이게
                children: <Widget>[

                  Expanded(child: Image.asset('image/dice$leftDice.png')),    //Expanded(): row위젯 내 이면 row 내 최대 면적 차지, column이면 column방향 최대 면적 차지
                  SizedBox(
                    width: 32.0,
                  ),
                  Expanded(child: Image.asset('image/dice$rightDice.png')),    //Image(image: AssetImage('image/dice1.png'),

                ],
              ),
            ),
            SizedBox(
              height: 70.0,
            ),
            ButtonTheme(
              minWidth: 200.0,
              height: 60.0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.orangeAccent
                ),
                  onPressed:(){
                  setState(() { // 어떤 변수따위의 값이 바뀌어 화면에 갱신해야 할 때 쓰는 메서드
                    
                    leftDice =Random().nextInt(6)+1;  // dart.math내 Random클래스의 메서드 nextInt(n)로 0~(n-1)까지 랜덤 숫자 도출 
                    rightDice =Random().nextInt(6)+1;

                  });
                  showToast("Left dice: {$leftDice}, Right dice : {$rightDice}");
                  print("Left dice: {$leftDice}, Right dice : {$rightDice}");

                  },
                  child:Icon(
                      Icons.play_arrow,
                      color:Colors.white,
                      size: 70.0,
                  ) ,

              ),
            )
          ],
        ),
      ),
    );
  }
}

void showToast(String message){
  Fluttertoast.showToast(
      msg: message,
  backgroundColor: Colors.white,
  toastLength: Toast.LENGTH_SHORT,
  gravity: ToastGravity.BOTTOM
  );
}