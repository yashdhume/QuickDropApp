import 'dart:convert';

import 'package:quickdrop/User.dart';
import 'HttpManager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
class AuthService {
  HTTPManager _httpManager = new HTTPManager();
  final String url;
  String token;

  AuthService({this.url});
  Future<Map<String, dynamic>> login(String username, String password){
    Map<String, dynamic> json = {
      "requestType": "signIn",
      "account": {"username": username, "password": password}
    };
    return _httpManager.post(url, json).then((dynamic response) {
      print(response.toString());
      //if (response["errorCode"] != 0) throw new Exception(response["errorMessage"]);
      //storeToken(response['responseData']['tokenKey']);
      return response;
    });
  }
  /*Future<Map<String, dynamic>> login(String username, String password) {
    Map<String, dynamic> json = {
      "requestType": "signIn",
      "account": {"username": username, "password": password}
    };
    print(json);
    return _httpManager.post(url, json).then((dynamic response) {
      print(response.toString());
      //if (response["errorCode"] != 0) throw new Exception(response["errorMessage"]);
      //token = response['tokenKey'];
      return response;
    });
  }*/
  Future<Map<String, dynamic>> createAccount(String username, String email, String password) {
    Map<String, dynamic> json = {
      "requestType": "createAccount",
      "account": {"username": username, "password": password, "email": email}
    };
    print(json);
    return _httpManager.post(url, json).then((dynamic response) {
      print(response.toString());
      //token = response['tokenKey'];
      return response;
    });
  }
}
