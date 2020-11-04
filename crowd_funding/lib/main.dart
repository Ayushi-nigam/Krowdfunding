import 'package:flutter/material.dart';
import 'app_screens/Logo.dart';

void main() => runApp(CrowdfundApp());

class CrowdfundApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          focusColor: Color(0xffCFD8DC),
          primaryColor: Color(0xffCFD8DC),
          appBarTheme: new AppBarTheme(
            color: new Color(0xff718792),
          ),
          iconTheme: new IconThemeData(color: Colors.white),
          textTheme: TextTheme(bodyText1: TextStyle(color: Color(0xffFFFFFF))),
          buttonColor: Color(0xffEA8724),
          scaffoldBackgroundColor: Color(0xff607D8B)),
      title: "Crowd Funding",
      home: new Logo(),
    );
  }
}
