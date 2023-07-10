class ShoesModel {
  ShoesModel({
    this.shid,
    this.shname,
    this.shdescription,
    this.shprice,
    this.shimage,});

  ShoesModel.fromJson(dynamic json) {
    shid = json['id'];
    shname = json['name'];
    shdescription = json['description'];
    shprice = json['price'];
    shimage = json['image'];
  }
  int? shid;
  String? shname;
  String? shdescription;
  double? shprice;
  String? shimage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = shid;
    map['name'] = shname;
    map['description'] = shdescription;
    map['price'] = shprice;
    map['image'] = shimage;
    return map;
  }

}