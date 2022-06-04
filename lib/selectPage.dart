import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:genel_kultur/homePageSoru.dart';
import 'homePageBilgi.dart';
class SelectPage extends StatefulWidget {
  @override
  _SelectPageState createState() => _SelectPageState();
}

class _SelectPageState extends State<SelectPage> {
  AdmobInterstitial interstitialAd;

  @override
  void initState() {
    super.initState();

    interstitialAd = AdmobInterstitial(
      adUnitId: "ca-app-pub-3035511627107078/8802154253",
      listener: (AdmobAdEvent event, Map<String, dynamic> args) {
        if (event == AdmobAdEvent.closed) interstitialAd.load();
        handleEvent(event, args, 'Interstitial');
      },
    );
    interstitialAd.load();
  }

  void handleEvent(
      AdmobAdEvent event, Map<String, dynamic> args, String adType) {
    switch (event) {
      case AdmobAdEvent.loaded:
      //showSnackBar('New Admob $adType Ad loaded!');
        break;
      case AdmobAdEvent.opened:
      //showSnackBar('Admob $adType Ad opened!');
        break;
      case AdmobAdEvent.closed:
        print("Goto next page");
        break;
      case AdmobAdEvent.failedToLoad:
      //print("Goto next page");
        break;
      case AdmobAdEvent.rewarded:
        break;
      default:
    }
  }
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
                interstitialAd.show();
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
                interstitialAd.show();
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


