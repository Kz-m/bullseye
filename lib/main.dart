import 'package:flutter/material.dart';//material design widget

void main() => runApp(BullsEyeApp());

class BullsEyeApp extends StatelessWidget{ //build関数をoverrideしbuild関数内で描画するwidgetを返すことで描画を行う。= 不変なwidgetを描画する場合用いる(静的)
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'BullsEye',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: GamePage(title: 'BullsEye'),
    );
  }
}

class GamePage extends StatefulWidget{ //自分の関数を更新することで自分自身を再ビルドすることができる。(動的) ①overrideが必須
  GamePage({Key key, this.title}) : super(key: key); //・GamePageが自分のinstanceにkeyとtitleを設定する。・GamePageがsuperを呼ぶ。
  final String title;

  @override
  _GamePageState createState() => _GamePageState(); //created "createState" object. _GamePageState means "private this file"
}

class _GamePageState extends State<GamePage>{
  bool _alertIsVisible = false; //_alertIsVisible propaty is private to this class

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Are you sure?",
              style: 
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
            ), //Text
            TextButton(
              child: Text('Hit Me!', style: TextStyle(color: Colors.blue)),
              onPressed: (){
                this._alertIsVisible = true;
                _showAlert(context); //this context came from 28 line (hit me buttonの色？)
                print("Button pressed!");
              },
            ),
          ],
        ),
      ), //Center (body needs child)
    ); //(Scaffold widgetを使用することで基盤となるレイアウトを指定できる)
  } //user interface for GamePage widget

  void _showAlert(BuildContext context){
    Widget okButton = TextButton( 
      child: Text("Awesome?"),
      onPressed: (){
        Navigator.of(context).pop();
        this._alertIsVisible = false;
        print("Awesome pressed! $_alertIsVisible"); // TODO $=これ何
      }); //definition of TextButton
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text("C'mon"),
          content: Text("How many times did you hit it ? lol"),
          actions: <Widget>[
            okButton,
          ], //<Widget>[]
          elevation: 5,
        ); //AlertDialog
      },
    );
  } //_showAlert needs what's code BuildContext
}