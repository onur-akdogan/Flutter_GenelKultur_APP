import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:genel_kultur/homePageSoru.dart';
import 'homePageBilgi.dart';

class SelectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

      child: Column(
        children: <Widget>[
          Container(
            color:Colors.deepOrange,
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.indigo, borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100))),
              child: FlatButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SoruListesi()));
              }, child: Text("Genel Kültür Soruları",
                  style: TextStyle(fontSize: 34, fontFamily: "fredokaOne",color:Colors.white))),
            ),
          ),
          Container(
            color:Colors.indigo,
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,

              decoration: BoxDecoration(
                  color: Colors.deepOrange, borderRadius: BorderRadius.only(topRight: Radius.circular(100))),
              child: FlatButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>BilgiListesi()));
              }, child: Text("Genel Kültür Bilgileri",
                  style: TextStyle(fontSize: 34, fontFamily: "fredokaOne",color: Colors.white))),
            ),
          ),
        ],
      ),
    );
  }
}
