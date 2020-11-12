import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crowd_funding/app_screens/Dashboard.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';

import 'app_screens/MyFundraise.dart';

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
          primaryColorLight: Color(0xffCFD8DC),
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
      home: new MyFundraise(),
    );
  }
}

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await firebase_core.Firebase.initializeApp();
//    WidgetsFlutterBinding.ensureInitialized();
// //   await Firebase.initializeApp();
// //   if (USE_FIRESTORE_EMULATOR) {
// //     FirebaseFirestore.instance.settings = Settings(
// //         host: 'localhost:8080', sslEnabled: false, persistenceEnabled: false);
// //   }
//   runApp(MyFundraise());
// }

/// Enum representing the upload task types the example app supports.
