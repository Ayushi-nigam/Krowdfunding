import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'dart:typed_data'; 
 class downloadImage{
   Uint8List imageFile;
   String downloadUrl;
   
     
     Future<String> getProfileImage(String folderName , String FileName) async{
       firebase_storage.Reference photosReference = firebase_storage.FirebaseStorage.instance.ref().child(folderName).child(FileName);
       String downloadAddress= await photosReference.getDownloadURL();
       downloadUrl=downloadAddress;
       return downloadUrl;
    //  int maxSize=7*1024*1024;
    //  await photosReference.child("1nucdckUSJvLLa93pSZ4.jpg").getData(maxSize).then((data) {
    //    imageFile=data;
    //  }).catchError((error){

    //  });
   }
   Widget decideProfileImage(){
     if(imageFile==null){
       return Image(image: AssetImage('assets/Images/profile.png',),fit: BoxFit.fill,);
     }
    else{
       return Image.memory(imageFile,fit: BoxFit.fill,);
     }}
 }