import 'dart:convert';

import 'package:quickdrop/Network/Authetication.dart';
import 'package:quickdrop/Network/SocketManager.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
class ViewModel extends Model {

  SocketManager socketManager;
  AuthService authService;
  String id;
  String token;
  final url = "https://quickdropbeta.herokuapp.com";
  ViewModel({this.authService});
  factory ViewModel.Initialize(){
    final url = "https://quickdropbeta.herokuapp.com";
    AuthService temp = AuthService(url: url);
    return ViewModel(authService: temp);

  }
  void initSocket(){
//    socketManager = SocketManager();
    authService = AuthService(url: url);
   // socketManager.initSocket();
    print('Initialized Viewmodel');
    notifyListeners();
  }
  bool isSignedIn(){
    if (authService.token != null){
      return true;
    }
    return false;
  }
  void testServer(){
    socketManager.testServer();
  }
  void disconnect(){
    socketManager.disconnect();
    notifyListeners();
  }
  bool isSocketConnected(){
    return socketManager.isSocketConnected;
  }
  /*void createAccount(String email, String username, String password){
    authService.createAccount(email, username, password, socketManager);
    notifyListeners();
  }*/
  Future<String> login (String username, String password)async{
    return authService.login(username, password).then((data){
      token = data['responseData']['tokenKey'];
      return data['errorMessage'];
    });

  }
  Future<String> createUser(String email, String username, String password ) async{
    return authService.createAccount(username, email, password).then((data){
      login(username, password);
      return data['errorMessage'];
    });
  }

}
