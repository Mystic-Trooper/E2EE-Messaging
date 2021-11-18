import 'package:e2ee_messaging/socketio/Routes.dart';
import 'package:e2ee_messaging/socketio/LoginScreen.dart';
import 'package:e2ee_messaging/splash.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.greenAccent,
            shadowColor: Colors.amber,
            onPrimary: Colors.black,
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
              primary: Colors.black, backgroundColor: Colors.deepOrangeAccent),
        ),
      ),
      routes: Routes.routes(),
      home: AnimatedSplashScreen(
        nextScreen:  LoginScreen(),
        splash: const Splash(),
        duration: 2000,
        splashIconSize: double.maxFinite,
      ),
    );
  }
}
