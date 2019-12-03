import 'dart:convert';
import 'dart:io';
import 'HttpManager.dart';
import 'dart:typed_data';

class FileManger {
  String url;

  FileManger({this.url});

  HTTPManager _httpManager = new HTTPManager();

  Future<void> upload(File file, String token) async {
    if (file == null) return print("TOKEN: " + token);

    String _base64 = base64Encode(file.readAsBytesSync());

    Map<String, dynamic> json = {
      "requestType": "uploadFile",
      "tokenKey": token,
      "filename": "Test2.png",
      "fileData": file != null ? _base64 : '',
    };

    await _httpManager.post(url, json);
  }

  Future<Uint8List> download(String token) async {
    Map<String, dynamic> json = {
      "requestType": "downloadFile",
      "tokenKey": token,
      "filename": "Test2.png",
    };
    return _httpManager.post(url, json).then((data) {
      return base64Decode(data['responseData']['fileData']);
    });
  }
}
