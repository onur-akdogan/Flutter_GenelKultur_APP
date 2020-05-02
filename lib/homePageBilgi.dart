import 'dart:io';
import 'package:flutter/material.dart';
import 'package:genel_kultur/utils/database_helper.dart';
import 'models/genelkulturbilgi.dart';

class BilgiListesi extends StatelessWidget {
  DatabaseHelper databaseHelper = DatabaseHelper();
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Genel Kültür Bilgisi",
            style: TextStyle(fontSize: 22, fontFamily: "fredokaOne")),
        elevation: 0,
        centerTitle: true,
      ),
      key: _scaffoldKey,
      body: Kartlar(),
    );
  }
}

class Kartlar extends StatefulWidget {
  @override
  _KartlarState createState() => _KartlarState();
}

class _KartlarState extends State<Kartlar> {
  List<Bilgi> tumBilgilar;
  DatabaseHelper databaseHelper;

  @override
  PageController _controller = PageController(
    initialPage: 0,
    viewportFraction: 0.8,
  );

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
    tumBilgilar = List<Bilgi>();
    databaseHelper = DatabaseHelper();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff1b1e44),
            Color(0xff2d3447),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: FutureBuilder(
        future: databaseHelper.bilgiListesiniGetir(),
        builder: (context, AsyncSnapshot<List<Bilgi>> snapShot) {
          if (snapShot.connectionState == ConnectionState.done) {
            tumBilgilar = snapShot.data;
            sleep(Duration(milliseconds: 2000));
            return PageView.builder(
              controller: _controller,
              itemCount: tumBilgilar.length,
              itemBuilder: (context, index) {
                debugPrint(tumBilgilar[index].bilgi);
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 50, bottom: 75, left: 20, right: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Colors.purple,
                            Colors.indigo,
                          ]),
                          borderRadius: BorderRadius.all(Radius.circular(32))),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                tumBilgilar[index].bilgi,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 3,
                                  wordSpacing: 8,
                                ),
                              ),
                            ),
                        ],       
                            ),
                        ),
                    ),
                ),
                );
              },
            );
          } else {
            return Center(
              child: Text(
                "Yükleniyor\nFrom: \n ONUR AKDOĞAN\n",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            );
          }
        },
      ),
    );
  }
}
