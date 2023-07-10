class ProductsModel {
  ProductsModel({
      this.id,
      this.name,
      this.description,
      this.price,
      this.image,});

  ProductsModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    image = json['image'];
  }
  int? id;
  String? name;
  String? description;
  double? price;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['price'] = price;
    map['image'] = image;
    return map;
  }

}