import 'package:flutter/material.dart';
import 'package:dictionary_app/sqlite.dart';

class Minitran extends StatefulWidget {
  @override
  _MinitranState createState() => _MinitranState();
}

class _MinitranState extends State<Minitran> {
  SqliteHelper helper = SqliteHelper();
  TextEditingController _textE2T = TextEditingController();
  List<Map<String, dynamic>> data = [
    {
      'word': 'Home',
      'adj': 'ภายในครัวเรือน',
      'noun': 'บ้าน',
      'adverb': 'มุ่งไปที่บ้าน'
    },
  ];
  // String word = '';
  String adjM = '';
  String adj = '';
  String nounM = '';
  String noun = '';
  String adverbM = '';
  String adverb = '';
  // void search() {
  //   setState(() {
  //     word = 'home';
  //     adjM = 'adjective';
  //     adj = 'ภายในครัวเรือน';
  //     nounM = 'noun';
  //     noun = 'บ้าน';
  //     adverbM = 'adverb';
  //     adverb = 'มุ่งไปที่บ้าน';
  //   });
  // }

  String word = '';
  List _query;
  List t2e;

  String eword = '';
  String tword = '';

  String eng = 'assets/images/united-kingdom (2).png';
  String th = 'assets/images/thailand (2).png';

  bool eng2th = true;

  int sw = 0;

  int indexSearch = 0;
  int indext2e = 0;
  int indexe2t = 0;

  String status = 'Eng to Th';

  @override
  void initState() {
    helper.openDB();
    super.initState();
    // cLang();
  }

  search() async {
    _query = await helper.searchEng2Th(_textE2T.text);
    // print(_query);
    setState(() {
      indexe2t = _query.length;
      word = _query[0]['esearch'];
      eword = word;
    });
  }

  searcht2e() async {
    t2e = await helper.searchTh2Eng(_textE2T.text);
    // print(t2e);
    setState(() {
      indext2e = t2e.length;
      word = t2e[0]['tsearch'];
      tword = word;
    });
  }

  switchLang() {
    // print(eng2th);
    if (eng2th == true) {
      eng2th = false;
      status = 'Th to Eng';
      word = tword;
    } else if (eng2th == false) {
      eng2th = true;
      status = 'Eng to Th';
      word = eword;
    }
    setState(() {
      cLang();
    });
  }

  Icon cLang() {
    if (eng2th == true) {
      // sw++;
      return Icon(Icons.arrow_forward_ios);
    } else if (eng2th == false) {
      // sw--;
      return Icon(Icons.arrow_back_ios);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size sizeS = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF273043),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/first',
                (route) => false,
              );
            }),
        title: Text('Translate English to Thai'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  flex: 9,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      // color: Colors.red,
                    ),
                    child: TextField(
                      controller: _textE2T,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () => _textE2T.clear(),
                            icon: Icon(Icons.clear),
                          ),
                          // enabledBorder: OutlineInputBorder(
                          //   borderSide: BorderSide(
                          //     color: Color(0xFF273043),
                          //     width: 2.0,
                          //   ),
                          //   borderRadius: BorderRadius.all(
                          //     Radius.circular(
                          //       10.0,
                          //     ),
                          //   ),
                          // ),
                          hintText: "Search english to thai"),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: eng2th == true ? search : searcht2e,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  //TODO:
                  onTap: switchLang,
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        child: Image.asset(
                          eng,
                        ),
                      ),
                      Container(
                        width: 50,
                        child: cLang(),
                      ),
                      Container(
                        width: 50,
                        child: Image.asset(
                          th,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(status),
          ),
          Container(
            margin: EdgeInsets.all(20),
            alignment: Alignment.topLeft,
            child: Text(
              word,
              style: TextStyle(fontSize: 50),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            height: sizeS.height / 1.7,
            // decoration: BoxDecoration(color: Colors.grey),
            child: isWhat(),
          ),
        ],
      ),
    );
  }

  Widget e2t() {
    return Container(
      // color: Colors.yellow,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: indexe2t,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _query[index]['ecat'],
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              Text(
                _query[index]['tentry'],
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget t2eng() {
    return Container(
      // color: Colors.red,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: indext2e,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                t2e[index]['tcat'],
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              Text(
                t2e[index]['eentry'],
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget isWhat() {
    if (eng2th == true) {
      return e2t();
    }
    if (eng2th == false) {
      return t2eng();
    }
  }
}
