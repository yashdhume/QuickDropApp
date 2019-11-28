import 'dart:convert';

import 'package:quickdrop/User.dart';
import 'HttpManager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
class AuthService {
  HTTPManager _httpManager = new HTTPManager();
  final String url;
  String token;

  AuthService({this.url});

  Future<bool> login(String username, String password) {
    Map<String, dynamic> json = {
      "requestType": "signIn",
      "account": {"username": username, "password": password}
    };
    print("FUCKIN WORK YOU CUNT");
    return _httpManager.post(url, json).then((dynamic res) {
      print(res.toString());
      if (res["errorCode"] != 0) throw new Exception(res["errorMessage"]);
      token = jsonDecode(res.body)['token'];
      return true;//new User.map(res["username"]);
    });
  }
  Future<bool> storeToken()async {
    if (token != null){
      final storage = new FlutterSecureStorage();
      await storage.write(key: 'token', value: this.token);
      return true;
    }
    return false;
  }
  Future<bool> removeToken()async{
    final storage = new FlutterSecureStorage();
    await storage.deleteAll();
    return true;
  }
  Future<bool> hasToken() async{
    final storage = new FlutterSecureStorage();
    String t =  await storage.read(key: 'token');
    if (t != null){
      token = t;
      return true;
    }
    return false;
  }
}
