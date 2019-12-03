import 'package:flutter/foundation.dart';

class LoginData {
  final String name;
  final String password;
  final String email;
  LoginData({
    @required this.name,
    @required this.email,
    @required this.password,
  });

  @override
  String toString() {
    return '$runtimeType($name, $password, $email)';
  }
}
