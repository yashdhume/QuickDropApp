import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
class HTTPManager {
  static HTTPManager _instance = new HTTPManager.internal();

  HTTPManager.internal();

  factory HTTPManager() => _instance;

  final JsonDecoder _decoder = new JsonDecoder();
  static BaseOptions options = BaseOptions(
      baseUrl: "https://quickdropbeta.herokuapp.com",
      responseType: ResponseType.plain,
      connectTimeout: 30000,
      receiveTimeout: 30000,
      validateStatus: (code) {
        if (code >= 200) {
          return true;
        }
      });
  static Dio dio = Dio(options);

  Future<dynamic> get(String url) {
    return Dio().get(url).then((Response response) {
      final String res = response.data;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      return _decoder.convert(res);
    });
  }

  Future<dynamic> post(String url, Map<String, dynamic> body) {
    print(body);

    return dio
        .post('',data: body)
        .then((Response response) {
      final String responseBody = response.data;
      print(responseBody);
      final int statusCode = response.statusCode;
      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      return _decoder.convert(responseBody);
    });
  }
}
