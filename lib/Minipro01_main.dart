import 'package:flutter/material.dart';

class Minipromain extends StatefulWidget {
  @override
  _MinipromainState createState() => _MinipromainState();
}

class _MinipromainState extends State<Minipromain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Color(0xFFFDFFFC),
      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(40),
              height: 250,
              width: 200,
              child: Image.asset('assets/images/logooo.png'),
            ),
            
            Container( 
              alignment: Alignment.bottomCenter,
              // height: 700,
              width: MediaQuery.of(context).size.width-50,
              color: Colors.red,
              child: 
            Column(
              children:[
            Container(
              width: 300,
              height: 50,
              margin: EdgeInsets.all(20),
              child: RaisedButton(
                color: Color(0xFF273043),
                onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                context, '/secound', (route) => false,
                );
                },
                child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.translate,
                      color: Colors.white,
                    ),
                    Text('TRANSLETE', style: TextStyle(color: Colors.white
                    ),
                    ),
                  ],
                ),
              ),
            ),
            
            Container(
              width: 300,
              height: 50,
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: RaisedButton(
                color: Color(0xFFF14551),
                onPressed: () {
                   Navigator.pushNamedAndRemoveUntil(
                context, '/third', (route) => false,
                );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.videogame_asset,
                      color: Colors.white,
                    ),
                    Text(
                      'WORD GAME',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            ] )),
          ],
        ),
      ),
    );
  }
}
