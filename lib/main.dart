import 'package:flutter/material.dart';//material design widget

void main() => runApp(BullsEyeApp());

class BullsEyeApp extends StatelessWidget{ //build関数をoverrideしbuild関数内で描画するwidgetを返すことで描画を行う。= 不変なwidgetを描画する場合用いる(静的)
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'BullsEye',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: GamePage(title: 'BullsEye'),
    ); //MaterialApp
  }
}

class GamePage extends StatefulWidget{ //自分の関数を更新することで自分自身を再ビルドすることができる。(動的) ①overrideが必須
  GamePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _GamePageState createState() => _GamePageState(); //crated "createState" object. _GamePageState means "private this file"
}

class _GamePageState extends State<GamePage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Happy coding!",
              style: 
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
            ), //Text
            TextButton(
              child: Text('Hit Me!', style: TextStyle(color: Colors.blue)),
              onPressed: (){},
            ),
          ],
        ),
      ), //Center (body needs child)
    ); //(Scaffold widgetを使用することで基盤となるレイアウトを指定できる)
  } //user interface for GamePage widget
}