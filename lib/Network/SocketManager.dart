import 'package:adhara_socket_io/adhara_socket_io.dart';
class SocketManager{
  SocketIOManager manager;
  SocketIO socket;
  bool isSocketConnected = false;
  InitializeSockets(){
  }
  void initSocket() async {
    manager = SocketIOManager();
    socket = await manager
        .createInstance(SocketOptions("https://quickdropbeta.herokuapp.com"));
    socket.onConnect((data) {
      print("connected...");
      isSocketConnected = true;
      testServer();
    });
    socket.on("response", (data) => {print(data)});
    socket.connect();
  }
  void testServer() {
    socket.on("pong", (data) => print(data));
    socket.emit("ping", ["Hello World"]);
  }
  void disconnect() async {
    await manager.clearInstance(socket);
    isSocketConnected = false;
  }
}