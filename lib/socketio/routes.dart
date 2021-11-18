// ignore_for_file: file_names

import 'package:e2ee_messaging/socketio/ChatScreen.dart';
import 'package:e2ee_messaging/socketio/ChatUsersScreen.dart';
import 'package:e2ee_messaging/socketio/LoginScreen.dart';

class Routes {
  static routes() {
    return {
      LoginScreen.ROUTE_ID: (context) => LoginScreen(),
      ChatUsersScreen.ROUTE_ID: (context) => ChatUsersScreen(),
      ChatScreen.ROUTE_ID: (context) => ChatScreen(),
    };
  }

  static initScreen() {
    return LoginScreen.ROUTE_ID;
  }
}
