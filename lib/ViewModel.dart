import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:quickdrop/Network/Authetication.dart';
import 'package:quickdrop/Network/FileManager.dart';
import 'package:quickdrop/Network/SocketManager.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ViewModel extends Model {
  SocketManager socketManager;
  AuthService authService;
  FileManger fileManger;
  String id;
  String token;
  final url = "https://quickdropbeta.herokuapp.com";

  ViewModel({this.authService, this.fileManger});

  factory ViewModel.Initialize() {
    final url = "https://quickdropbeta.herokuapp.com";
    AuthService authServiceTemp = AuthService(url: url);
    FileManger fileMangerTemp = FileManger(url: url);
    return ViewModel(authService: authServiceTemp, fileManger: fileMangerTemp);
  }

  void initSocket() {
//    socketManager = SocketManager();
    authService = AuthService(url: url);
    fileManger = FileManger(url: url);
    // socketManager.initSocket();
    print('Initialized Viewmodel');
    notifyListeners();
  }

  bool isSignedIn() {
    if (authService.token != null) {
      return true;
    }
    return false;
  }

  void testServer() {
    socketManager.testServer();
  }

  void disconnect() {
    socketManager.disconnect();
    notifyListeners();
  }

  bool isSocketConnected() {
    return socketManager.isSocketConnected;
  }

  /*void createAccount(String email, String username, String password){
    authService.createAccount(email, username, password, socketManager);
    notifyListeners();
  }*/
  Future<String> login(String username, String password) async {
    return authService.login(username, password).then((data) {
      token = data['responseData']['tokenKey'];
      return data['errorMessage'];
    });
  }

  Future<String> createUser(
      String email, String username, String password) async {
    return authService.createAccount(username, email, password).then((data) {
      login(username, password);
      return data['errorMessage'];
    });
  }

  Future<void> upload(File file) {
    fileManger.upload(file, token);
  }

  Future<Uint8List> download() {
    return fileManger.download(token);
  }
}
