import 'package:quickdrop/Network/Authetication.dart';
import 'package:quickdrop/Network/SocketManager.dart';
import 'package:scoped_model/scoped_model.dart';
class ViewModel extends Model {
  SocketManager socketManager;
  AuthService authService;
  final url = "https://quickdropbeta.herokuapp.com";
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
  Future<bool> hasToken()async{
    return await authService.hasToken();
  }
  Future<bool> login(String email, String password) async{
   // print(authService.hasToken());
    print(authService);
    await authService.login(email, password);
    return true;
  }
}
