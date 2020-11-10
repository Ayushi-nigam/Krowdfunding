// import 'dart:async';
import 'dart:async';

import 'package:crowd_funding/app_screens/Login.dart';
import 'package:flutter/material.dart';

import 'EditProfile.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    new Timer(const Duration(seconds: 5), () => onClose(context));
    return new Scaffold(
      backgroundColor: Colors.black,
      body: new Center(
          child: new Container(
        child: new Text("Krowd Funding",
            style: new TextStyle(
                fontFamily: 'ArchitectsDaughter-Regular',
                color: Colors.white,
                fontSize: 50)),
      )),
    );
  }

  void onClose(context) {
    Navigator.of(context).pushReplacement(new PageRouteBuilder(
        maintainState: true,
        opaque: true,
        pageBuilder: (context, _, __) => new Login(),
        transitionDuration: const Duration(seconds: 1),
        transitionsBuilder: (context, anim1, anim2, child) {
          return new FadeTransition(
            child: child,
            opacity: anim1,
          );
        }));
  }
}
