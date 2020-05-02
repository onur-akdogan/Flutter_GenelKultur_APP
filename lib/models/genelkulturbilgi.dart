
class Bilgi {
  int bilgiID;
  String bilgi;
  String cevap;

  Bilgi(this.bilgi, this.cevap);//verileri yazarken

  Bilgi.withID(this.bilgi,);//verileri okurken

  Map<String, dynamic> toMap(){

    var map=Map<String, dynamic>();
    map['bilgi'] = bilgi;
    return map;

  }

  Bilgi.fromMap(Map<String, dynamic> map){
    this.bilgi = map['bilgi'] ;
   
  }

  @override
  String toString() {
    return 'Bilgi{bilgi: $bilgi}';
  }
}
 