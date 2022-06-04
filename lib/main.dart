import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:genel_kultur/selectPage.dart';



import 'homePageBilgi.dart';
import 'homePageSoru.dart';

String _appID="ca-app-pub-3940256099942544~3347511713";
void main() {
   WidgetsFlutterBinding.ensureInitialized();
  // Initialize without device test ids.
  Admob.initialize(_appID);
  
runApp(MyApp());
}



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
