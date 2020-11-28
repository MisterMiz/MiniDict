import 'dart:io';

import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqliteHelper {
  String dbFile = 'lexitron.sqlite';
  Database _db;

  //Copy db to app
  void openDB() async {
    //find db abb floder
    String dbPath = await getDatabasesPath();
    String fullPath = join(dbPath, dbFile);
    // print(fullPath);

    //DB existed?
    bool existedDB = await databaseExists(fullPath);
    if (!existedDB) {
      //no DB
      //copy DB
      //Check whether the DB floder exists
      try {
        Directory(dirname(fullPath)).create(recursive: true);
      } catch (_) {
        print('cannot find floder');
      }

      // copy from assets floder
      ByteData data = await rootBundle.load(join('assets/db', dbFile));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(fullPath).writeAsBytes(bytes, flush: true);
      print('DB copies');
    } else {
      print('DB existed');
    }

    //open DB
    _db = await openDatabase(fullPath, readOnly: true, singleInstance: true);
  }

  void closeDB() async {
    await _db.close();
    print('DB closed');
  }

  searchEng2Th(String ese) async {
    // List list = await _db.rawQuery(
    //     'SELECT * FROM eng2th WHERE  esearch = ?2 AND ecat =?1',
    //     ['N', 'abandon']);
    var list = await _db.query(
      'eng2th',
      columns: ['tentry', 'ethai', 'esearch', 'ecat'],
      where: '"esearch" = ?',
      whereArgs: [ese],
    );
    if (list.length > 0) {
      // print(list);
      return list;
    } else {
      // print('not found');
      return [
        {'tentry': '', 'ethai': '', 'esearch': 'Not Found', 'ecat': ''},
      ];
    }
  }

  searchTh2Eng(String tse) async {
    // List list = await _db.rawQuery(
    //     'SELECT * FROM eng2th WHERE  esearch = ?2 AND ecat =?1',
    //     ['N', 'abandon']);
    var list = await _db.query(
      'th2eng',
      columns: ['tsearch', 'eentry', 'tcat'],
      where: '"tsearch" = ?',
      whereArgs: [tse],
    );
    if (list.length > 0) {
      // print(list);
      return list;
    } else {
      // print('not found');
      return [
        {'tsearch': 'Not Found', 'eentry': '', 'tcat': ''},
      ];
    }
  }

  //answer english
  gameEng2Th() async {
    // List list = await _db.rawQuery(
    //     'SELECT * FROM eng2th WHERE  esearch = ?2 AND ecat =?1',
    //     ['N', 'abandon']);
    var list = await _db.query(
      'eng2th',
      columns: ['tentry', 'ethai', 'esearch', 'ecat'],
      orderBy: 'Random()',
      where: '"ecat" = "N"',
      limit: 3,
    );
    if (list.length > 0) {
      // print(list);
      return list;
    } else {
      // print('not found');
      return [
        {'tentry': 'null', 'ethai': 'null', 'esearch': 'null', 'ecat': 'null'},
      ];
    }
  }
}
