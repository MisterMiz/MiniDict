import 'package:flutter/material.dart';
import 'sqlite.dart';

class MainPageTrans extends StatefulWidget {
  @override
  _MainPageTransState createState() => _MainPageTransState();
}

class _MainPageTransState extends State<MainPageTrans> {
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

  String adjM = '';
  String adj = '';
  String nounM = '';
  String noun = '';
  String adverbM = '';
  String adverb = '';

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

  String steentry = '';
  String sttentry = '';

  String status = 'ENG TO TH';

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
      status = 'TH TO ENG';
      word = tword;
    } else if (eng2th == false) {
      eng2th = true;
      status = 'ENG TO TH';
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
        title: Text('Translator'),
      ),
      body: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(192, 148, 243, 1)),
        child: Column(
          children: [
            Container(
              height: 350,
              decoration:
                  BoxDecoration(color: Color.fromRGBO(192, 148, 243, 1)),
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Search',
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          'Vocabulary',
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      child: Image.asset(
                        'assets/images/search.png',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Container(
                height: 600,
                width: 500,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 450,
                        child: TextFormField(
                          controller: _textE2T,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: eng2th == true ? search : searcht2e,
                                icon: Icon(Icons.search),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.0))),
                              labelText: 'Type your word'),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
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
                                  alignment: Alignment.center,
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
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          status,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(15),
                        alignment: Alignment.topLeft,
                        child: Text(
                          word,
                          style: TextStyle(fontSize: 45),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 35),
                        height: sizeS.height / 4,
                        //decoration: BoxDecoration(color: Colors.grey),
                        child: isWhat(),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
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
