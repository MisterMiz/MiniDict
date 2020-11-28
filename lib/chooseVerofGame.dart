import 'package:flutter/material.dart';

class MainPageGame extends StatefulWidget {
  @override
  _MainPageGameState createState() => _MainPageGameState();
}

class _MainPageGameState extends State<MainPageGame> {
  @override
  Widget build(BuildContext context) {
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
        title: Text('Play game'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg2.jpg'), fit: BoxFit.cover),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/game.png',
                  width: 450,
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Choose the game',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 70,
                ),
                ButtonTheme(
                  minWidth: 180,
                  height: 50,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/ins_thtoen',
                        (route) => false,
                      );
                    },
                    child: Text(
                      'Thai vocabulary',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    color: Color.fromRGBO(123, 47, 213, 1),
                    textColor: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ButtonTheme(
                  minWidth: 180,
                  height: 50,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/ins_entoth',
                        (route) => false,
                      );
                    },
                    child: Text(
                      'English vocabulary',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    color: Color.fromRGBO(123, 47, 213, 1),
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
