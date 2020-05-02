import 'dart:io';
import 'package:flutter/services.dart';
import 'package:genel_kultur/models/genelkultur.dart';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:synchronized/synchronized.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  static Database _database;

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._internal();
      return _databaseHelper;
    } else {
      return _databaseHelper;
    }
  }

  DatabaseHelper._internal();

  Future<Database> _getDatabase() async {
    if (_database == null) {
      _database = await _initializeDatabase();
      return _database;
    } else {
      return _database;
    }
  }

  Future<Database> _initializeDatabase() async {
    var lock = Lock();
    Database _db;

    if (_db == null) {
      await lock.synchronized(() async {
        if (_db == null) {
          var databasesPath = await getDatabasesPath();
          var path = join(databasesPath, "appDB.db");
          print("OLUSACAK DBNIN PATHI : $path");
          var file = new File(path);

          // check if file exists
          if (!await file.exists()) {
            // Copy from asset
            ByteData data = await rootBundle.load(
                join("assets", "genelkultur.db"));
            List<int> bytes =
            data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
            await new File(path).writeAsBytes(bytes);
          }
          // open the database
          _db = await openDatabase(path);
        }
      });
    }

    return _db;
  }


  Future<List<Map<String, dynamic>>> sorulariGetir() async {
    var db = await _getDatabase();
    var sonuc = await db.query("sorular");
    return sonuc;
  }

  Future<List<Soru>> soruListesiniGetir() async {
    var sorularMapListesi = await sorulariGetir();
    var soruListesi = List<Soru>();
    for (Map map in sorularMapListesi) {
      soruListesi.add(Soru.fromMap(map));
    }
    return soruListesi;
  }
    
    
    
    Future<List<Map<String, dynamic>>> sorulariGetir() async {
    var db = await _getDatabase();
    var sonuc = await db.query("bilgiler");
    return sonuc;
  }

  Future<List<Bilgi>> bilgiListesiniGetir() async {
    var bilgilerMapListesi = await bilgileriGetir();
    var bilgiListesi = List<Soru>();
    for (Map map in bilgilerMapListesi) {
      bilgiListesi.add(Bilgi.fromMap(map));
    }
    return bilgiListesi;
  }
}
