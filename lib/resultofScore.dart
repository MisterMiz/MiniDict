import 'package:flutter/material.dart';

class ResultScore extends StatefulWidget {
  @override
  _ResultScoreState createState() => _ResultScoreState();
}

class _ResultScoreState extends State<ResultScore> {
  int score = 0;
  @override
  Widget build(BuildContext context) {
    score = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(123, 47, 213, 1),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/firstpage',
                (route) => false,
              );
            }),
        title: Text('Finished the game'),
      ),
      body: Container(
        decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/bg2.jpg'), fit: BoxFit.cover),
      ),
        child: Center(
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
              width: 150,
              height: 50,
              child: ButtonTheme(
                minWidth: 180,
                height: 50,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  onPressed: () {Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/choosegame',
                  (route) => false,
                );},
                  child: Text(
                    'Try again',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  color: Color(0xFFF14551),
                  textColor: Colors.white,
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
