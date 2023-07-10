class UsersModel {
  UsersModel({
      this.id, 
      this.name, 
      this.email, 
      this.password, 
      this.phonenumber,});

  UsersModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    phonenumber = json['phone_number'];
  }
  int? id;
  String? name;
  String? email;
  String? password;
  String? phonenumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['password'] = password;
    map['phone_number'] = phonenumber;
    return map;
  }

}