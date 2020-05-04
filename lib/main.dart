import 'package:flutter/material.dart';
import 'package:genel_kultur/selectPage.dart';



import 'homePageBilgi.dart';
import 'homePageSoru.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Genel Kültürüm',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color(0xff2d3447),),
      home: SelectPage(),
    );
  }
}
