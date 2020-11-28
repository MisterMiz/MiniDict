import 'package:flutter/material.dart';
import 'dart:async';

//game q eng ans th wait page
class MiniWordgame02en2thw extends StatefulWidget {
  @override
  _MiniWordgame02en2thwState createState() => _MiniWordgame02en2thwState();
}

class _MiniWordgame02en2thwState extends State<MiniWordgame02en2thw> {
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
        title: Text('Word Game English to Thai'),
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
                    child: Image.asset('assets/images/united-kingdom (2).png'),
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
                    child: Image.asset('assets/images/thailand (2).png'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'English To Thai',
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
                'Show English words and choose correct Thai word.',
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
                        '/fifth',
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

class MiniWordgame02_11 extends StatefulWidget {
  @override
  _MiniWordgame02_11State createState() => _MiniWordgame02_11State();
}

class _MiniWordgame02_11State extends State<MiniWordgame02_11> {
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
          '/sixth',
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
