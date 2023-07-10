class TshirtsModel {
  TshirtsModel({
    this.tid,
    this.tname,
    this.tdescription,
    this.tprice,
    this.timage,});

  TshirtsModel.fromJson(dynamic json) {
    tid = json['id'];
    tname = json['name'];
    tdescription = json['description'];
    tprice = json['price'];
    timage = json['image'];
  }
  int? tid;
  String? tname;
  String? tdescription;
  double? tprice;
  String? timage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = tid;
    map['name'] = tname;
    map['description'] = tdescription;
    map['price'] = tprice;
    map['image'] = timage;
    return map;
  }

}