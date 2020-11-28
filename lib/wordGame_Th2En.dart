import 'package:flutter/material.dart';
import 'dart:async';

// game q th ans en wait page
class WordGameTh2EnW extends StatefulWidget {
  @override
  _WordGameTh2WEnState createState() => _WordGameTh2WEnState();
}

class _WordGameTh2WEnState extends State<WordGameTh2EnW> {
  @override
  Widget build(BuildContext context) {
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
        title: Text('Word Game Thai to English'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 150, 0, 10),
                child: Text('You choose', style: TextStyle(fontSize: 30)),
              ),
              Row(
                children: [
                  Container(
                    height: 100,
                    margin: EdgeInsets.all(15),
                    child: Image.asset('assets/images/thailand (2).png'),
                  ),
                  Container(
                    height: 100,
                    margin: EdgeInsets.all(10),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    height: 100,
                    margin: EdgeInsets.all(10),
                    child: Image.asset('assets/images/united-kingdom (2).png'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Thai To English',
                    style: TextStyle(color: Colors.black, fontSize: 30),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Text(
                  'Ready ?',
                  style: TextStyle(color: Colors.black, fontSize: 30),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Show Thai words and choose correct English word.',
                style: TextStyle(color: Colors.red),
              ),
              Container(
                  margin: EdgeInsets.all(80),
                  width: 100,
                  height: 50,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/fifth1',
                        (route) => false,
                      );
                    },
                    color: Color(0xFFF14551),
                    child: Text(
                      'Start',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}

class MiniWordgame02_1 extends StatefulWidget {
  @override
  _MiniWordgame02_1State createState() => _MiniWordgame02_1State();
}

class _MiniWordgame02_1State extends State<MiniWordgame02_1> {
  int _num = 3;
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _num--;
      });
      if (_num == 0) {
        timer.cancel();
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/gameE2T',
          (route) => false,
        );
      }
    });
    // timer.cancel();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF14551),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_num.toString(),
                style: TextStyle(color: Colors.white, fontSize: 60)),
          ],
        ),
      ),
    );
  }
}
