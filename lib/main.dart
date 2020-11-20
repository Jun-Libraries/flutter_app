import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
//시작 클래스 머터리얼 디자인 앱 생성
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor:  const Color(0xff360547),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'SUN SET'),

    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool visibilityStart = false;
  bool visibilityLogin = true;

  //로그인 프레임과 스타트 프레임 변경 로직
  void _changed(bool visibility, String field) {
    setState(() {
      if (field == "start") {
        visibilityStart = visibility;
      }
      if (field == "login") {
        visibilityLogin = visibility;
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      //resizeToAvoidBottomPadding: false, //리사이징 시 자판 올라오면서 에러 처리
      /*appBar: AppBar(
        title: Text(widget.title),
      ),*/
      body:
          //전체 컨텐츠 컨테이너
          Container(
             //color: const Color(0xff360547),
            decoration: BoxDecoration(
              gradient: LinearGradient( begin: Alignment.center, end: Alignment.bottomCenter, colors: [Color(0xff360547), Color(0xff1b0225)],),
            ),
            //메인 이미지 프레임 상단, 버튼 기능 프레임 하단
            child : Column(
                children: <Widget>[
                  //메인 이미지 및 문구
                  Expanded(
                      flex: 6,
                      child: Container(
                        child: Column(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Container(),
                              ),
                              Expanded(
                                flex: 6,
                                child: Container(
                                  child : Image.asset('img/sunset_main.png'),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  margin: EdgeInsets.only(top: 0.0),
                                  child: Text(
                                    'Life is Emotion',
                                    style: TextStyle(
                                      fontSize : 40.0,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                           ],
                        ),
                      )
                  ),
                  //스타트 버튼과 로그인 or 회원가입 페이지 출력
                  Expanded(
                      flex: 5,
                      child: Column(
                      //mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          //스타트 버튼 화면
                          visibilityStart ? new Container(
                            decoration: BoxDecoration(
                              //그라이언트 적용하려 했으나 디자인적 미스로 제거
                              gradient: LinearGradient( begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color(0xff1b0225), Color(0xff1b0225)],),
                              borderRadius: BorderRadius.all(Radius.circular(15),),
                              boxShadow:[
                                BoxShadow(
                                  color: Colors.grey[500],
                                  offset: Offset(4.0, 4.0),
                                  blurRadius: 15.0,
                                  spreadRadius: 1.0,
                                ),
                                BoxShadow(
                                  color: Colors.white,
                                  offset: Offset(-4.0, -4.0),
                                  blurRadius: 15.0,
                                  spreadRadius: 1.0,
                                ),
                              ],
                            ),
                            margin: EdgeInsets.only(top: 50.0),
                            child : new ButtonTheme(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0), //모서리
                              ), //테두리
                              minWidth: 300.0,
                              height: 100.0,
                              child: MaterialButton(
                                  //enabled : true,
                                  onPressed: (){
                                    _changed(false, "start");
                                    _changed(true,  "login");
                                  },
                                  child: Text(
                                    'Start',
                                    style: TextStyle(
                                      fontSize : 40.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                            ),
                          ): new Container(),
                          //로그인 화면 아이디
                          visibilityLogin ? new Row(
                            children: <Widget>[
                              new Expanded(
                                flex: 13,
                                child: new Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10), //모서리를 둥글게
                                      color: Colors.white,
                                  ), //테두리
                                  width: 100,
                                  height: 50,
                                  margin: EdgeInsets.only(top: 10.0, left: 50.0),
                                  child: new TextField(
                                    maxLines: 1,
                                    style: TextStyle(fontSize: 22, color: Colors.black),
                                    decoration: new InputDecoration(
                                        contentPadding:EdgeInsets.all(10.0),
                                        hintText: "아이디",
                                        isDense: true
                                    ),
                                  ),
                                ),
                              ),
                              new Expanded(
                                flex: 2,
                                child: new IconButton(
                                  color: Colors.grey[400],
                                  icon: const Icon(Icons.cancel, size: 22.0,),
                                  onPressed: () {
                                    //텍스트 필드 초기화 처리 로직 구현 필요
                                  },
                                ),
                              ),
                            ],
                          ) : new Container(),
                          //패스워드
                          visibilityLogin ? new Row(
                            children: <Widget>[
                              new Expanded(
                                flex: 13,
                                child: new Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10), //모서리를 둥글게
                                    color: Colors.white,
                                  ), //테두리
                                  width: 100,
                                  height: 50,
                                  margin: EdgeInsets.only(top: 10.0, left: 50.0),
                                  child: new TextField(
                                    obscureText: true,
                                    maxLength: 10,
                                    //데이터 받아오기 및 비밀번호 숨김처리
                                    onChanged: (text) { print(text); },
                                    onSubmitted: (text) { print('Submitted:$text'); },
                                    maxLines: 1,
                                    style: TextStyle(fontSize: 22, color: Colors.black),
                                    decoration: new InputDecoration(
                                        contentPadding:EdgeInsets.all(10.0),
                                        hintText: "패스워드",
                                        isDense: true,
                                    ),
                                  ),
                                ),
                              ),
                              new Expanded(
                                flex: 2,
                                child: new IconButton(
                                  color: Colors.grey[400],
                                  icon: const Icon(Icons.cancel, size: 22.0,),
                                  onPressed: () {
                                    //텍스트필드 초기화 로직 구현
                                  },
                                ),
                              ),
                            ],
                          ) : new Container(),
                          const SizedBox(height: 30),
                          visibilityLogin ? new  ButtonTheme(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10), //모서리
                            ), //테두리
                            minWidth: 310.0,
                            height: 50.0,
                            child: MaterialButton(
                              //enabled : true,
                              onPressed: (){
                                _changed(true, "start");
                                _changed(false,"login");
                              },
                              color : const Color(0xff1b0225),
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  fontSize : 30.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ): new Container(),
                        ],
                      ),
                  ),
                ],
            ),
          ),
    );
  }
}
