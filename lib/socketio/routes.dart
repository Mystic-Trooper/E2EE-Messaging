// ignore_for_file: file_names

import './loginscreen.dart';
import './chatscreen.dart';
import './chatuserscreen.dart';

class Routes {
  //
  static routes() {
    return {
      LoginScreen.ROUTE_ID: (context) => const LoginScreen(),
    };
  }

  static initScreen() {
    return LoginScreen.ROUTE_ID;
  }
}
