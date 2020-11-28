import 'package:flutter/material.dart';

class MiniWordgame01 extends StatefulWidget {
  @override
  _MiniWordgame01State createState() => _MiniWordgame01State();
}

class _MiniWordgame01State extends State<MiniWordgame01> {
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
                  '/first',
                  (route) => false,
                );
              }),
          title: Text('Word Game Select'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                   Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/fourth',
                  (route) => false,
                );
                  },
                  child: Container(
                    height: 200,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Color(0xFFFFC94E),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 100,
                              margin: EdgeInsets.all(15),
                              child: Image.asset(
                                  'assets/images/united-kingdom (2).png'),
                            ),
                            Container(
                              height: 100,
                              margin: EdgeInsets.all(10),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              height: 100,
                              margin: EdgeInsets.all(10),
                              child:
                                  Image.asset('assets/images/thailand (2).png'),
                            ),
                          ],
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          padding: EdgeInsets.all(15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'English To Thai',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 InkWell(
                  onTap: () {
                     Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/gameT2Ew',
                  (route) => false,
                );
                  },
                 child:
                Container(
                  margin: EdgeInsets.all(20),
                  height: 200,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color(0xFFFFC94E),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 100,
                            margin: EdgeInsets.all(15),
                            child:
                                Image.asset('assets/images/thailand (2).png'),
                          ),
                          Container(
                            height: 100,
                            margin: EdgeInsets.all(10),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            height: 100,
                            margin: EdgeInsets.all(10),
                            child: Image.asset(
                                'assets/images/united-kingdom (2).png'),
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        padding: EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Thai To English',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                  ),

              ],
            )
          ],
        ));
  }
}
