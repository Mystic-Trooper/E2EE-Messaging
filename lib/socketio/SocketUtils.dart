import 'dart:io';

import 'package:adhara_socket_io/adhara_socket_io.dart';
import 'package:e2ee_messaging/socketio/ChatMessageModel.dart';
import 'package:e2ee_messaging/socketio/User.dart';

class SocketUtils {
  //
  static String _serverIP =
      Platform.isIOS ? 'http://localhost' : 'http://10.0.2.2';
  static const int SERVER_PORT = 7070;
  static String _connectUrl =
      "https://e2eechat.herokuapp.com/"; // '$_serverIP:$SERVER_PORT';

  // Events
  static const String ON_MESSAGE_RECEIVED = 'receive_message';
  static const String SUB_EVENT_MESSAGE_SENT = 'message_sent_to_user';
  static const String IS_USER_CONNECTED_EVENT = 'is_user_connected';
  static const String IS_USER_ONLINE_EVENT = 'check_online';
  static const String SUB_EVENT_MESSAGE_FROM_SERVER = 'message_from_server';

  // Status
  static const int STATUS_MESSAGE_NOT_SENT = 10001;
  static const int STATUS_MESSAGE_SENT = 10002;
  static const int STATUS_MESSAGE_DELIVERED = 10003;
  static const int STATUS_MESSAGE_READ = 10004;

  // Type of Chat
  static const String SINGLE_CHAT = 'single_chat';

  User _fromUser;

  SocketIO _socket;
  SocketIOManager _manager;

  initSocket(User fromUser) async {
    print('Connecting user: ${fromUser.name}');
    this._fromUser = fromUser;
    await _init();
  }

  _init() async {
    _manager = SocketIOManager();
    _socket = await _manager.createInstance(_socketOptions());
  }

  _socketOptions() {
    final Map<String, String> userMap = {
      'from': _fromUser.id.toString(),
    };
    return SocketOptions(
      _connectUrl,
      enableLogging: true,
      transports: [Transports.webSocket],
      query: userMap,
    );
  }

  sendSingleChatMessage(ChatMessageModel chatMessageModel, User toChatUser) {
    print('Sending Message to: ${toChatUser.name}, ID: ${toChatUser.id}');
    if (null == _socket) {
      print("Socket is Null, Cannot send message");
      return;
    }
    _socket.emit("single_chat_message", [chatMessageModel.toJson()]);
  }

  setOnMessageBackFromServer(Function onMessageBackFromServer) {
    _socket.on(SUB_EVENT_MESSAGE_FROM_SERVER).listen((event) {
      onMessageBackFromServer(event[0]);
    });
  }

  checkOnline(ChatMessageModel chatMessageModel) {
    print('Checking Online: ${chatMessageModel.to}');
    if (null == _socket) {
      print("Socket is Null, Cannot send message");
      return;
    }
    _socket.emit(IS_USER_ONLINE_EVENT, [chatMessageModel.toJson()]);
  }

  connectToSocket() {
    if (null == _socket) {
      print("Socket is Null");
      return;
    }
    print("Connecting to socket...");
    _socket.connect();
  }

  setConnectListener(Function onConnect) {
    _socket.onConnect.listen((event) {
      onConnect(event);
    });
  }

  setOnConnectionErrorListener(Function onConnectError) {
    _socket.onConnectError.listen((event) {
      onConnectError(event);
    });
  }

  setOnConnectionErrorTimeOutListener(Function onConnectTimeout) {
    _socket.onConnectTimeout.listen((event) {
      onConnectTimeout(event);
    });
  }

  setOnErrorListener(Function onError) {
    _socket.onError.listen((event) {
      onError(event);
    });
  }

  setOnDisconnectListener(Function onDisconnect) {
    _socket.onDisconnect.listen((data) {
      print("onDisconnect $data");
      onDisconnect(data);
    });
  }

  setOnChatMessageReceivedListener(Function onChatMessageReceived) {
    _socket.on(ON_MESSAGE_RECEIVED).listen((data) {
      print("Received $data");
      onChatMessageReceived(data[0]);
    });
  }

  setOnMessageSentToChatUserListener(Function onMessageSentListener) {
    _socket.on(SUB_EVENT_MESSAGE_SENT).listen((data) {
      print("onMessageSentListener $data");
      onMessageSentListener(data);
    });
  }

  setOnUserConnectionStatusListener(Function onUserConnectionStatus) {
    _socket.on(IS_USER_CONNECTED_EVENT).listen((event) {
      print(event[0]);
      onUserConnectionStatus(event[0]);
    });
  }

  closeConnection() {
    if (null != _socket) {
      print("Close Connection");
      _manager.clearInstance(_socket);
    }
  }
}
