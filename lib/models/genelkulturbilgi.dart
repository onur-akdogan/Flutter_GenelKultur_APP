class Bilgi {
  int bilgiID;
  String bilgi;

  Bilgi(this.bilgi); //verileri yazarken

  Bilgi.withID(this.bilgi,this.bilgiID); //verileri okurken

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    map['bilgi'] = bilgi;
    map['bilgiID']=bilgiID;

    return map;
  }

  Bilgi.fromMap(Map<String, dynamic> map) {
    this.bilgi = map['bilgi'];
    this.bilgiID = map['bilgiID'];
  }

  @override
  String toString() {
    return 'Soru{bilgi: $bilgi,bilgiID: $bilgiID}';
  }
}
