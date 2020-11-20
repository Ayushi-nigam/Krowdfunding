import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;


class downloadImage {
  
  Future<Widget> getProfileImage(String uid, String folderName ,String fileName) async {
    Image aImage;
    var completer = new Completer<Widget>();
    firebase_storage.Reference photosReference = firebase_storage
        .FirebaseStorage.instance
        .ref().child(uid)
        .child(folderName)
        .child(fileName);
    try {
      String downloadAddress = await photosReference.getDownloadURL();
      aImage = Image.network(
        downloadAddress,
        fit: BoxFit.fill,
      );
      completer.complete(aImage);
    } catch (e) {}
    return completer.future;
  }
}
