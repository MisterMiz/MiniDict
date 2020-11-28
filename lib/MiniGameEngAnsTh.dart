import 'dart:math';

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:dictionary_app/sqlite.dart';
import 'dart:async';

//game q eng ans th
class MiniWordgame03TaE extends StatefulWidget {
  @override
  _MiniWordgame03TaEState createState() => _MiniWordgame03TaEState();
}

class _MiniWordgame03TaEState extends State<MiniWordgame03TaE> {
  SqliteHelper helper = SqliteHelper();
  double _progress = 0;
  String answer = '';
  int time = 10;
  String txtScore = '';
  int score = 0;
  int ranNum = 0;

  bool isEnabled = true;
  bool isCount = true;

  Timer ctime;

  String buttontxt1 = '';
  String buttontxt2 = '';
  String buttontxt3 = '';

  String showWord = '';

  var obj;
  var t1, t2, t3;

  double percent = 1.0;

  initState() {
    super.initState();
    score = 0;
    time = 10;
    percent = 1.0;
    countDown();
    (() async {
      await helper.openDB();
      await randomText();
    })();
  }

  randomText() async {
    obj = await helper.gameEng2Th();
    setState(() {
      ranNum = Random().nextInt(3);
      showWord = obj[ranNum]['esearch'];
      t1 = obj[0];
      t2 = obj[1];
      t3 = obj[2];
      buttontxt1 = t1['tentry'];
      buttontxt2 = t2['tentry'];
      buttontxt3 = t3['tentry'];
    });
    print('$t1\n$t2\n$t3');
    print(showWord);
    print(ranNum);
    // print(t1['esearch']);
  }

  void countDown() {
    ctime = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        isCount = false;
        time = time - 1;
        percent = percent - 0.1;
        // print(time);
      });
      if (time <= 0) {
        txtScore = 'Time Out!';
        timer.cancel();
        Navigator.pushReplacementNamed(context, '/seventh', arguments: score);
        // buttonStatus = 'Start';
      }
    });
    time = 10;
    percent = 1.0;
    score = 0;
    // buttonStatus = 'Stop';
    // randomText();
  }

  void checkAns(value) {
    setState(() {
      if (value != obj[ranNum]['tentry']) {
        print('0');
        ctime.cancel();
        Navigator.pushReplacementNamed(context, '/seventh', arguments: score);
      } else {
        print('1');
        score++;
        time = 10;
        percent = 1.0;
        randomText();
      }
    });
  }

  @override
  //   void initState() {
  //   super.initState();
  //   Timer.periodic(Duration(seconds: 1), (timer) {
  //     setState(() {
  //       _progress--;
  //     });
  //     if (_progress == 0) {
  //       timer.cancel();
  //       Navigator.pushNamedAndRemoveUntil(
  //               context,
  //               '/sixth',
  //               (route) => false,
  //             );
  //     }
  //   }
  //   );
  //   // timer.cancel();
  // }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF14551),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              // Navigator.pushNamedAndRemoveUntil(
              //   context,
              //   '/third',
              //   (route) => false,
              // );
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('WARNING'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [Text('Do you want to exit')],
                    ),
                    actions: [
                      FlatButton(
                        onPressed: () {
                          // Navigator.pop(context);  //บางครั้งใช้ไม่ได้เพราะมี context เยอะไปเกิน
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Cancle',
                        ),
                      ),
                      FlatButton(
                          onPressed: () {
                            ctime.cancel();
                            // Navigator.pop(context);
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              '/third',
                              (route) => false,
                            );
                          },
                          child: Text('Ok'))
                    ],
                  );
                },
              );
            }),
        title: Text('Word Game English to Thai'),
      ),
      body: Column(
        children: [
          // Container(
          //   child: new LinearPercentIndicator(
          //     width: MediaQuery.of(context).size.width - 50,
          //     animation: true,
          //     lineHeight: 50.0,
          //     // animationDuration: 10000,
          //     percent: 1,
          //     // center: Text("90.0%"),
          //     linearStrokeCap: LinearStrokeCap.roundAll,
          //     progressColor: Colors.greenAccent,
          //     // value: _progress,
          //   ),
          // ),
          Container(
            padding: EdgeInsets.all(20),
            child: LinearPercentIndicator(
              width: MediaQuery.of(context).size.width - 50,
              animation: false,
              lineHeight: 30.0,
              percent: percent,
              linearStrokeCap: LinearStrokeCap.roundAll,
              backgroundColor: Colors.grey[300],
              progressColor: Colors.green,
            ),
          ),
          Text(
            'Score = $score',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 100, 0, 50),
            child: Text(
              showWord,
              style: TextStyle(fontSize: 50),
            ),
          ),
          Spacer(),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width - 50,
                  height: 50,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    onPressed: () {
                      checkAns(buttontxt1);
                    },
                    color: Color(0xFFF14551),
                    child: Text(
                      buttontxt1,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width - 50,
                  height: 50,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    onPressed: () {
                      checkAns(buttontxt2);
                    },
                    color: Color(0xFFF14551),
                    child: Text(
                      buttontxt2,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width - 50,
                  height: 50,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    onPressed: () {
                      checkAns(buttontxt3);
                    },
                    color: Color(0xFFF14551),
                    child: Text(
                      buttontxt3,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
