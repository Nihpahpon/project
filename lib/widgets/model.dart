// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  String? email;
  String? name;
  String? password;
  String? phone;
  String? province;
  String? typesex;
  String? urlpictuer;

  static var myUser;
  UserModel({
    this.email,
    this.name,
    this.password,
    this.phone,
    this.province,
    this.typesex,
    this.urlpictuer,
  });

  UserModel copyWith({
    String? email,
    String? name,
    String? password,
    String? phone,
    String? province,
    String? typesex,
    String? urlpictuer,
  }) {
    return UserModel(
      email: email ?? this.email,
      name: name ?? this.name,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      province: province ?? this.province,
      typesex: typesex ?? this.typesex,
      urlpictuer: urlpictuer ?? this.urlpictuer,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'name': name,
      'password': password,
      'phone': phone,
      'province': province,
      'typesex': typesex,
      'urlpictuer': urlpictuer,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] != null ? map['email'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      province: map['province'] != null ? map['province'] as String : null,
      typesex: map['typesex'] != null ? map['typesex'] as String : null,
      urlpictuer:
          map['urlpictuer'] != null ? map['urlpictuer'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(email: $email, name: $name, password: $password, phone: $phone, province: $province, typesex: $typesex, urlpictuer: $urlpictuer)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.email == email &&
        other.name == name &&
        other.password == password &&
        other.phone == phone &&
        other.province == province &&
        other.typesex == typesex &&
        other.urlpictuer == urlpictuer;
  }

  @override
  int get hashCode {
    return email.hashCode ^
        name.hashCode ^
        password.hashCode ^
        phone.hashCode ^
        province.hashCode ^
        typesex.hashCode ^
        urlpictuer.hashCode;
  }
}
