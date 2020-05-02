import 'package:flutter/material.dart';
import 'package:genel_kultur/homePage.dart';


import 'models/genelkultur.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Genel Kültür Soruları',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color(0xff2d3447),),
      home: SoruListesi(),
    );
  }
}
