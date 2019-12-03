import 'HttpManager.dart';

class AuthService {
  HTTPManager _httpManager = new HTTPManager();
  final String url;
  String token;

  AuthService({this.url});

  Future<Map<String, dynamic>> login(String username, String password) {
    Map<String, dynamic> json = {
      "requestType": "signIn",
      "account": {"username": username, "password": password}
    };
    return _httpManager.post(url, json).then((dynamic response) {
      print("Login: " + response.toString());
      return response;
    });
  }

  Future<Map<String, dynamic>> createAccount(
      String username, String email, String password) {
    Map<String, dynamic> json = {
      "requestType": "createAccount",
      "account": {"username": username, "password": password, "email": email}
    };
    print(json);
    return _httpManager.post(url, json).then((dynamic response) {
      print("Create Account: " + response.toString());
      return response;
    });
  }
}
