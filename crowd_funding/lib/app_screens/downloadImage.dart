import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'dart:typed_data';

class downloadImage {
  Uint8List imageFile;
  //String downloadUrl;

  Future<Widget> getProfileImage(String folderName, String FileName) async {
    Image aImage;
    var completer = new Completer<Widget>();
    firebase_storage.Reference photosReference = firebase_storage
        .FirebaseStorage.instance
        .ref()
        .child(folderName)
        .child(FileName);
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
//    Future<Widget> _getImage(BuildContext context, String image) async {
//   Image m;
//   await FireStorageService.loadImage(context, image).then((downloadUrl) {
//     m = Image.network(
//       downloadUrl.toString(),
//       fit: BoxFit.scaleDown,
//     );
//   });
// return m;
// }
}
