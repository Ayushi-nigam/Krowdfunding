import 'package:crowd_funding/app_screens/Login.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class SuccessTick extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 8), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => new Login(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlareActor("assets/riv/sucessCheck.flr2d",
          alignment: Alignment.center, fit: BoxFit.contain, animation: "Idle"),
    );
  }
}
