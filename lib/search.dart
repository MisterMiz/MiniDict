import 'package:flutter/material.dart';
import 'package:dictionary_app/sqlite.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  SqliteHelper helper = SqliteHelper();
  String word = 'word';
  String ecat = 'ecat';
  String mean = 'mean';
  List _query;
  int queryLength = 0;

  @override
  void initState() {
    super.initState();
    helper.openDB();
  }

  search() async {
    _query = await helper.searchEng2Th('apple');
    print(_query[0]['tentry']);
    setState(() {
      word = _query[0]['esearch'];
      ecat = _query[0]['ecat'];
      mean = _query[0]['tentry'];
      queryLength = _query.length;
    });
    print(queryLength);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Titlez'),
      ),
      body: Column(
        children: [
          RaisedButton(
            onPressed: search,
            child: Text('data'),
          ),
          Text(word),
          Text(ecat),
          Text(mean),
        ],
      ),
    );
  }
}
