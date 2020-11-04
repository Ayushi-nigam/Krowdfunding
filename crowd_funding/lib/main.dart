import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'app_screens/Logo.dart';

bool USE_FIRESTORE_EMULATOR = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  if (USE_FIRESTORE_EMULATOR) {
    FirebaseFirestore.instance.settings = Settings(
        host: 'localhost:8080', sslEnabled: false, persistenceEnabled: false);
  }
  runApp(new CrowdfundApp());
}

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
