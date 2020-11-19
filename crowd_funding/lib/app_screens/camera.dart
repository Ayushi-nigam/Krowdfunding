import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:crowd_funding/common/FileStorage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class camera{
   File _image;
  Future getImageFromCamera()async{
     var image = await ImagePicker.pickImage(
    source: ImageSource.camera, );
    _image=image;
    return  _image;
  }
  
//  @override
//   Widget build(BuildContext context) {
     
  //FileStorage aFileStorage = new FileStorage();
  
  Future uploadPic(BuildContext context,String FolderName,String docId) async{
    String fileName = basename(_image.path);
    firebase_storage.Reference fireBaseStorageRef= firebase_storage.FirebaseStorage.instance.ref().child(FolderName).child(docId);
   firebase_storage.UploadTask uploadTasks= fireBaseStorageRef.putFile(_image);
   firebase_storage.TaskSnapshot taskSnapshot= await uploadTasks.whenComplete(() => null);
   taskSnapshot.ref.getDownloadURL().then((value) => print("Done : $value"));
  }
    // return Scaffold(
    //   backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    //   body:  Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children:[
    //         SizedBox(
    //          child:ClipRRect(
    //                       borderRadius: BorderRadius.circular(30.0),
    //                       child: _image != null
    //                           ? Image.file(_image)
    //                           : FlatButton(
    //                               child: Icon(
    //                                 Icons.add_a_photo,
    //                                 size: 50,
    //                               ),
    //                               onPressed: getImageFromCamera,
    //                             ),)),
    //         SizedBox(
    //           width:  MediaQuery.of(context).size.width -
    //                       MediaQuery.of(context).size.width / 8,
    //          height: MediaQuery.of(context).size.height / 10,

    //         ),
    //         Container(
    //                     width: MediaQuery.of(context).size.width -
    //                         MediaQuery.of(context).size.width / 4,
    //                     height: MediaQuery.of(context).size.height / 15,
    //                     child: RaisedButton(
    //                         color: Theme.of(context).buttonColor,
    //                         textColor: Color.fromRGBO(0, 0, 0, 1),
    //                         elevation: 10,
    //                         shape: RoundedRectangleBorder(
    //                             borderRadius: BorderRadius.circular(10)),
    //                         child: Text(
    //                           'SAVE',
    //                           style: TextStyle(
    //                               fontSize: 14, fontWeight: FontWeight.w400),
    //                         ),
    //                         onPressed: () {
    //                            uploadPic(context);
    //                            },
    //                         ))
    //       ]),),
    //  );
  // }

  
}