// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  String? email;
  String? name;
  String? password;
  String? name2;
  UserModel({
    this.email,
    this.name,
    this.password,
    this.name2,
  });

  UserModel copyWith({
    String? email,
    String? name,
    String? password,
    String? name2,
  }) {
    return UserModel(
      email: email ?? this.email,
      name: name ?? this.name,
      password: password ?? this.password,
      name2: name2 ?? this.name2,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'name': name,
      'password': password,
      'name2': name2,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] != null ? map['email'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      name2: map['name2'] != null ? map['name2'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(email: $email, name: $name, password: $password, name2: $name2)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.email == email &&
        other.name == name &&
        other.password == password &&
        other.name2 == name2;
  }

  @override
  int get hashCode {
    return email.hashCode ^ name.hashCode ^ password.hashCode ^ name2.hashCode;
  }
}
