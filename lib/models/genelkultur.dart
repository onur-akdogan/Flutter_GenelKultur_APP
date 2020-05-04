class Soru {
  int soruID;
  String soru;
  String cevap;

  Soru(this.soru, this.cevap);//verileri yazarken

  Soru.withID(this.soruID,this.soru, this.cevap, );//verileri okurken

  Map<String, dynamic> toMap(){

    var map=Map<String, dynamic>();
    map['soruID'] = soruID;
    map['soru'] = soru;
    map['cevap'] = cevap;
   

    return map;

  }

  Soru.fromMap(Map<String, dynamic> map){
    this.soruID = map['soruID'];
    this.soru = map['soru'] ;
    this.cevap = map['cevap'] ;
  }

  @override
  String toString() {
    return 'Soru{soruID: $soruID, soru: $soru, cevap: $cevap}';
  }
}
 