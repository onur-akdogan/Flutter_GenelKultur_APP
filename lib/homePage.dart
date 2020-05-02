import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:genel_kultur/utils/database_helper.dart';

import 'models/genelkultur.dart';

class SoruListesi extends StatelessWidget {
  DatabaseHelper databaseHelper = DatabaseHelper();
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Genel Kültür Soruları",
            style: TextStyle(fontSize: 22, fontFamily: "fredokaOne")),
        elevation: 0,
        centerTitle: true,
      ),
      key: _scaffoldKey,
      body: Notlar(),
    );
  }
}

class Notlar extends StatefulWidget {
  @override
  _NotlarState createState() => _NotlarState();
}

class _NotlarState extends State<Notlar> {
  List<Soru> tumSorular;
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
    tumSorular = List<Soru>();
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
        future: databaseHelper.soruListesiniGetir(),
        builder: (context, AsyncSnapshot<List<Soru>> snapShot) {
          if (snapShot.connectionState == ConnectionState.done) {
            tumSorular = snapShot.data;
            sleep(Duration(milliseconds: 2000));
            return PageView.builder(
              controller: _controller,
              itemCount: tumSorular.length,
              itemBuilder: (context, index) {
                debugPrint(tumSorular[index].soru);
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
                                tumSorular[index].soru,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 3,
                                  wordSpacing: 8,
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              width: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(32),
                                ),
                              ),
                              child: RaisedButton(
                                onPressed: () {
                                  showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text(
                                            tumSorular[index].cevap,
                                            style: TextStyle(
                                              fontFamily: "bangers",
                                              color: Color(0xff1b1e44),
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 3,
                                              wordSpacing: 8,
                                            ),
                                          ),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(28.0))),
                                          // backgroundColor:Colors.deepOrange ,

                                          actions: <Widget>[
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  50,
                                              child: FlatButton(
                                                color: Colors.green,
                                                child: Text("Soruya Dön"),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ),
                                          ],
                                        );
                                      });
                                },
                                color: Color(0xff1b1e44),
                                child: Text(
                                  "CEVAP",
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.white,
                                    fontFamily: "fredokaOne",
                                  ),
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
