// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// import 'package:flutter/material.dart';
// import 'dart:io';
// import 'package:crowd_funding/common/FileStorage.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:path/path.dart';

// class cameraImageUpload{
  
//   Future uploadPic(BuildContext context,File _image,String FolderName,String docId) async{
//     String fileName = basename(_image.path);
//     firebase_storage.Reference fireBaseStorageRef= firebase_storage.FirebaseStorage.instance.ref().child(FolderName).child(docId);
//    firebase_storage.UploadTask uploadTasks= fireBaseStorageRef.putFile(_image);
//    firebase_storage.TaskSnapshot taskSnapshot= await uploadTasks.whenComplete(() => null);
//    taskSnapshot.ref.getDownloadURL().then((value) => print("Done : $value"));
//   }
// }