import 'package:flutter/material.dart';
import 'dice.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dice game',
      home: LogIn(),
    );
  }
}

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  TextEditingController controller = TextEditingController(); // 텍스트 필드에 입력된 데이터를 가져옴
  TextEditingController controller2 = TextEditingController(); // 텍스트 필드에 입력된 데이터를 가져옴

  // TextEditingController는 사용하지 않을땐 데이터 리소스 낭비를 막기 위해 'dispose method'를 사용하면 좋음

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:AppBar(
        title: Text('Log in'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: (){

          },
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed:() {

          }),
        ],
      ),
      body: Builder(           // 여러 조건문에 따른 결과로 snackBar을 띄우기 위해 body를 Builder로 감싸야함
        builder:(context) {
          return GestureDetector(  // 화면의 터치을 이용한 다양한 이벤트 구현( 길게 탭, 두번 탭, 등등)
            onTap: (){
              FocusScope.of(context).unfocus(); // 텍스트 필드와 연결된 focusScope에 unfocus()적용해서 사용자가 로그인 정보를 입력 후 화면에 터치를 했다면 키보드가 사라지게끔
            },
            child: SingleChildScrollView( // 키보드가 올라왔을 때 위젯이 오버플로우되지 않도록 스크롤뷰로 만듦
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top:50)), // 이미지의 위치 조정 (위쪽으로 부터 50픽셀 간격 확보)
                  Center(
                    child: Image(image: AssetImage('image/chef.gif'),
                      width: 170.0,
                      height: 190.0,
                    ),
                  ),
                  Form(   // 위젯으로부터 어떤 정보를 받아냄
                    child: Theme(
                        data: ThemeData(
                            primaryColor: Colors.teal, // 텍스트 필드(Edit TextView) 클릭 시 teal색 으로 강조
                            inputDecorationTheme: InputDecorationTheme( // decoration theme 설정
                                labelStyle: TextStyle(
                                  color: Colors.teal,
                                  fontSize: 15.0,
                                )
                            )
                        ),
                        child: Container( // 텍스트 필드 놓을 container
                          padding: EdgeInsets.all(40.0), // 사방으로 간격 확보
                          child: Column(
                            children: <Widget>[
                              TextField( // 텍스트 필드(edit textView)
                                //autofocus: true, // 말그대로 입력하도록 강조(커서 깜빡임 등등)
                                decoration: InputDecoration( // 여기서 decoration : 텍스트 필드 상단에 표시되는 작은 문구
                                  labelText: 'Enter "dice"',
                                ),
                                keyboardType: TextInputType.emailAddress, // 텍스트 필드를 누르면 올라오는 자판 타입 지정, 저건 자판에 @나타남

                                controller: controller, // 각 텍스트 필드에 TextEditingcontroller 객체 할당
                              ),
                              TextField( // 텍스트 필드(edit textView)
                                decoration: InputDecoration(
                                  labelText: 'Enter Password',
                                ),
                                keyboardType: TextInputType.text,
                                obscureText: true,    // 비밀번호 안보이게 지정

                                controller: controller2,
                              ),
                              SizedBox(height: 40.0,),  // 화면 모서리쪽 이면 padding, 위젯 사이 간격띄울려면 SizedBox
                              ButtonTheme(  // 버튼 테마 지정
                                minWidth: 100.0,
                                height: 50.0,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(    // elevatedbutton 은 색 지정시 style 위젯 안에 써야함
                                      primary: Colors.orangeAccent
                                  ),
                                  child: Icon(Icons.arrow_forward,
                                    color: Colors.white,
                                    size: 35.0,
                                  ),
                                  onPressed: (){
                                    if(controller.text == 'dice' && controller2.text == '1007'){  // 조건이 맞으면
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (BuildContext context) => Dice())); // Dice() 페이지로 이동
                                    }else if(controller.text != 'dice' && controller2.text == '1007'){
                                      showSnackBar3(context);
                                    }else if(controller.text == 'dice' && controller2.text != '1007'){
                                      showSnackBar2(context);
                                    }else {
                                      showSnackBar(context);
                                    }
                                  },
                                ),
                              )
                            ],
                          ),
                        )
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

void showSnackBar(BuildContext context){

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
        content:Text('Confirm login information',
        textAlign: TextAlign.center
        ),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.blue,
        )
    );
}

void showSnackBar2(BuildContext context){

  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content:Text('Confirm password information',
            textAlign: TextAlign.center
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.blue,
      )
  );
}

void showSnackBar3(BuildContext context){

  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content:Text('Confirm "dice" alphabet',
            textAlign: TextAlign.center
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.blue,
      )
  );
}