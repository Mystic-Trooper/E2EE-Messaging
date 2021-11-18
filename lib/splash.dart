import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Splash extends StatefulWidget {
  const Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Colors.red,
            Colors.green,
            Colors.blue,
            Colors.purple,
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 200.0,
            height: 200.0,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/images/undraw_Texting_re_l11n.png"),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const SpinKitHourGlass(
            color: Color(0xF6DF1010),
          )
        ],
      ),
    );
  }
}
