import 'package:flutter/material.dart';

//score
class MiniWordgame04 extends StatefulWidget {
  @override
  _MiniWordgame04State createState() => _MiniWordgame04State();
}

class _MiniWordgame04State extends State<MiniWordgame04> {
  int score = 0;
  @override
  Widget build(BuildContext context) {
    score = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF14551),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/third',
                (route) => false,
              );
            }),
        title: Text('Word Game Score'),
      ),
      body: Center(
          child: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
            child: Text(
              'Your Scores',
              style: TextStyle(fontSize: 40),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 80, 0, 0),
            child: Text(
              '$score',
              style: TextStyle(fontSize: 60),
            ),
          ),
          // Container(
          //   height: 150,
          //   width: 150,
          //   margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
          //   child: Image.asset('assets/images/fireworks.png'),
          // ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
            width: 100,
            height: 50,
            child: RaisedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                context,
                '/third',
                (route) => false,
              );
              },
              color: Color(0xFFF14551),
              child: Text(
                'Try again',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      )),
    );
  }
}
