import 'dart:io';
import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:genel_kultur/utils/database_helper.dart';
import 'models/genelkulturbilgi.dart';

class BilgiListesi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Genel Kültür Bilgileri",
            style: TextStyle(fontSize: 22, fontFamily: "fredokaOne")),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Color(0xff2d3447),
      ),
      body: Kartlar(),
    );
  }
}

class Kartlar extends StatefulWidget {
  @override
  _KartlarState createState() => _KartlarState();
}

class _KartlarState extends State<Kartlar> {
 
  List<Bilgi> tumBilgiler;
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
    tumBilgiler = List<Bilgi>();
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
        builder: (context, snapShot) {
          if (snapShot.connectionState == ConnectionState.done) {
            tumBilgiler = snapShot.data;
            sleep(Duration(milliseconds: 2000));
            return PageView.builder(
              controller: _controller,
              itemCount: tumBilgiler.length,
              itemBuilder: (context, index) {

                debugPrint(tumBilgiler[index].bilgi);
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 50, bottom: 75, left: 20, right: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Colors.deepOrange,
                            Colors.amber,
                          ]),
                          borderRadius: BorderRadius.all(Radius.circular(32))),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                           
                             AdmobBanner(
                                adUnitId: "ca-app-pub-2062750101933669/4624701797",
                                adSize: AdmobBannerSize.BANNER,
                                listener: (AdmobAdEvent event,
                                    Map<String, dynamic> args) {
                                  handleEvent(event, args, 'Banner');
                                },
                                onBannerCreated:
                                    (AdmobBannerController controller) {
                                },
                              ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                tumBilgiler[index].bilgi,
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
                "Yükleniyor\nONUR AKDOĞAN\n",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            );
          }
        },
      ),
    );
  }

 GlobalKey<ScaffoldState> scaffoldState = GlobalKey();

     AdmobBannerSize bannerSize;
   AdmobInterstitial interstitialAd;
   AdmobReward rewardAd;
     void handleEvent(
      AdmobAdEvent event, Map<String, dynamic> args, String adType) {
    switch (event) {
      case AdmobAdEvent.loaded:
    
        break;
      case AdmobAdEvent.opened:
    
        break;
      case AdmobAdEvent.closed:
       
        break;
      case AdmobAdEvent.failedToLoad:
  
        break;
      case AdmobAdEvent.rewarded:
}
}
}



