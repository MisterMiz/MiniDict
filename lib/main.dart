import 'package:dictionary_app/MiniGameEngAnsTh.dart';
import 'package:dictionary_app/chooseVerofGame.dart';
import 'package:dictionary_app/index.dart';
import 'package:dictionary_app/instructionEN2TH.dart';
import 'package:dictionary_app/instructionTH2EN.dart';
import 'package:dictionary_app/mainPageofTranslator.dart';
import 'package:dictionary_app/playPageEN2TH.dart';
import 'package:dictionary_app/playPageTH2EN.dart';
import 'package:dictionary_app/resultofScore.dart';
import 'package:dictionary_app/wordGame_Th2En.dart';
import 'package:flutter/material.dart';
import 'Minipro01_main.dart';
import 'Mini002_tran.dart';
import 'Mini003_wordgame.dart';
import 'Mini003.1_wordgame.dart';
import 'Mini003.2_wordgame.dart';
import 'Mini003.3_wordgame.dart';

// void main() {
//   runApp(MaterialApp(
//     // home: MiniWordgame03EaT(),
//     initialRoute: '/secound',
//     routes: {
//       '/first': (context) => Minipromain(),
//       '/secound': (context) => Minitran(),
//       '/third':(context) => MiniWordgame01(),
//       '/fourth':(context) => MiniWordgame02en2thw(),
//       '/fifth':(context) => MiniWordgame02_1(),
//       '/fifth1':(context) => MiniWordgame02_11(),
//       '/sixth':(context) => MiniWordgame03EaT(),
//       '/seventh':(context) => MiniWordgame04(),
//       '/gameT2Ew':(context) => WordGameTh2EnW(),
//       '/gameE2T':(context) => MiniWordgame03TaE(),

//     },
//     theme: ThemeData(
      
//     //   buttonTheme: ButtonThemeData(height: 46, minWidth: 300),
//     ),
//   ));
// }


// import 'package:flutter/material.dart';
// import 'package:projectmbd/chooseVerofGame.dart';
// import 'package:projectmbd/instructionEN2TH.dart';
// import 'package:projectmbd/instructionTH2EN.dart';
// import 'package:projectmbd/mainPageofTranslator.dart';
// import 'package:projectmbd/playPageEN2TH.dart';
// import 'package:projectmbd/playPageTH2EN.dart';
// import 'package:projectmbd/resultofScore.dart';
import 'firstpage.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(fontFamily: 'Montserrat'),
    //home: Firstpage(),
    initialRoute: '/firstpage',
    routes: {
      '/firstpage': (context) => Firstpage(),
      '/translator': (context) => MainPageTrans(),
      '/choosegame': (context) => MainPageGame(),
      '/ins_entoth': (context) => InsEN2TH(),
      '/ins_thtoen': (context) => InsTH2EN(),
      '/playpage_entoth': (context) => PlayPageEN2TH(),
      '/playpage_thtoen': (context) => PlayPageTH2EN(),
      '/resultscore': (context) => ResultScore(),
      //'/timer': (context) => MiniWordgame02_11(),
    },
  )); 
}
