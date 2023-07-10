class CategoriesModel {
  CategoriesModel({
    this.cid,
    this.cname,
    this.cimage,});

  CategoriesModel.fromJson(dynamic json) {
    cid = json['id'];
    cname = json['name'];
    cimage = json['image'];
  }
  int? cid;
  String? cname;
  String? cimage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = cid;
    map['name'] = cname;
    map['image'] = cimage;
    return map;
  }

}