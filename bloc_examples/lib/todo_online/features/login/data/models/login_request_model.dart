import 'dart:convert';

class LoginRequestModel {
  final String username;
  final String password;
  LoginRequestModel({
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'password': password,
    };
  }

  String toJson() => json.encode(toMap());
}
