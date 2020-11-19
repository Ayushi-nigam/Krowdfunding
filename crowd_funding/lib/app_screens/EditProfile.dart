import 'dart:typed_data';
import 'package:crowd_funding/app_screens/My_Donation.dart';
import 'package:flutter/material.dart';
import 'TextFField.dart';
import 'camera.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:crowd_funding/common/successTick.dart';
import 'My_Donation.dart';
class EditProfile extends StatefulWidget {
  
  @override
  _EditProfile createState() {
    return _EditProfile();
  }
}
class _EditProfile extends State<EditProfile> {
   File _image;
  // Uint8List imageFile;
  final editFormKey = GlobalKey<FormState>();
  TextEditingController name;
  TextEditingController email;
  TextEditingController mobileNo;
  final firestoreInstance = FirebaseFirestore.instance;
  camera cameraa= new camera();
  //firebase_storage.Reference photosReference = firebase_storage.FirebaseStorage.instance.ref().child("ProfilePhotos");
  //   Future getProfileImage() async{
  //   int maxSize=7*1024*1024;
  //   await photosReference.child("1nucdckUSJvLLa93pSZ4.jpg").getData(maxSize).then((data) {
  //     imageFile=data;
  //   }).catchError((error){

  //   });
  // }
  // Widget decideProfileImage(){
  //   if(imageFile==null){
  //     return Image(image: AssetImage('assets/Images/profile.png',),fit: BoxFit.fill,);
  //   }
  //   else{
  //     return Image.memory(imageFile,fit: BoxFit.fill,);
  //   }}
  // @override
  // void initState(){
  //   super.initState();
  //   getProfileImage();
  // }
  @override
  Widget build(BuildContext context) {
        // Future getImageFromCamera() async{
        //   var image = await ImagePicker.pickImage(
        //        source: ImageSource.camera, 
        //        );
        //   setState(() {
        //     _image = image;
        //     print('Image Pathssdggjhl $_image');
        //   });

        // }

  
  // Future uploadPic(BuildContext context) async{
  //     String fileName = basename(_image.path);
  //     photosReference= firebase_storage.FirebaseStorage.instance.ref().child("ProfilePhotos").child("1nucdckUSJvLLa93pSZ4");
  //     firebase_storage.UploadTask uploadTasks= photosReference.putFile(_image);
  //     firebase_storage.TaskSnapshot taskSnapshot= await uploadTasks.whenComplete(() => null);
  //     taskSnapshot.ref.getDownloadURL().then((value) => print("Done : $value"));
  // }
    return new FutureBuilder(
      future:firestoreInstance.collection('UserProfile').doc("1nucdckUSJvLLa93pSZ4").get(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
      name=TextEditingController(text:snapshot.data["firstName"]+snapshot.data["lastName"]);
      email=TextEditingController(text:snapshot.data["emailId"]);
      mobileNo=TextEditingController(text:snapshot.data["mobileNumber"]);
    
       return Scaffold(
      appBar: new AppBar(
        backgroundColor: Theme.of(context).appBarTheme.color,
        iconTheme: Theme.of(context).iconTheme,
        title: new Text("Edit Profile",
                  style: TextStyle(
                    color:Theme.of(context).textTheme.bodyText1.color,
                  ),
                ),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body:  new Form(
            key: editFormKey,
            child: new Center(
              child:ListView(children: [
            SizedBox(height: MediaQuery.of(context).size.height/30),
            Center(
            child: Stack(
              children: [
                 Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius:MediaQuery.of(context).size.width/5,   
                      child: ClipOval(
                        child: new SizedBox(
                           width: MediaQuery.of(context).size.width,           
                           height: MediaQuery.of(context).size.height/5,
                           child: (_image!=null)?Image.file(
                            _image,
                            fit: BoxFit.fill,
                          ):Image(image:AssetImage('assets/Images/profile.png',),fit: BoxFit.fill,)
                        ),
                      ),
                    ),
                  ),
                Positioned(
                  bottom: 0,
                  right: MediaQuery.of(context).size.width / 3.5,
                  child: Container(
                    width:MediaQuery.of(context).size.width / 8,
                      height: MediaQuery.of(context).size.height / 16,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width:2,
                    color:Colors.black12
                    ),
                    color: Colors.grey[700] ),
                child: cameraak()
                ))
              ],)),
             Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    SizedBox(height: MediaQuery.of(context).size.height / 40),
                    Container(
                      width: MediaQuery.of(context).size.width -
                          MediaQuery.of(context).size.width / 8,
                      height: MediaQuery.of(context).size.height / 8,
                      child: TextFField(
                        suffixIcons: IconButton(
                               icon: Icon(
                                 Icons.edit,
                                 color: Theme.of(context).iconTheme.color,
                                 size: 30,
                             ),
                             ),
                             myController:name,
                          obscureTexts: false,
                          aTextInputType: TextInputType.name,
                          maxLenthOfTextField: null,
                         // validInput: RegExp(r'[a-zA-Z]'),
                          lableTextField: "Full Name",
                          hintTextField: "Enter Full Name",
                          //myController: this.firstName,
                          validInput:(value){
                               if (value.isEmpty) {
                                  return "Please Enter Full Name";
                                }
                                return null;
                          }
                          ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 40),
                     Container(
                      width: MediaQuery.of(context).size.width -
                          MediaQuery.of(context).size.width / 8,
                      height: MediaQuery.of(context).size.height / 8,
                      child: TextFField(
                         suffixIcons: IconButton(
                               icon: Icon(
                                 Icons.edit,
                                 color: Theme.of(context).iconTheme.color,
                                 size: 30,
                             )),
                             myController: email,
                          obscureTexts: false,
                          aTextInputType: TextInputType.emailAddress,
                          maxLenthOfTextField: null,
                           validInput:(value){
                               if (value.isEmpty) {
                                  return "Please Enter Email Id";
                                }
                            Pattern pattern=r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                              RegExp regex = new RegExp(pattern);
                              if (!regex.hasMatch(value))
                                {return 'Enter Valid Email';}
                                return null;
                          },
                          lableTextField: "Email Id",
                          hintTextField: "Enter The Email Id",
                          //myController: this.emailId
                          ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 40),
                    Container(
                        width: MediaQuery.of(context).size.width -
                            MediaQuery.of(context).size.width / 8,
                        height: MediaQuery.of(context).size.height /8,
                        child: TextFField(
                          suffixIcons: IconButton(
                               icon: Icon(
                                 Icons.edit,
                                 color: Theme.of(context).iconTheme.color,
                                 size: 30,
                             ),
                                ),
                          obscureTexts: false,
                          aTextInputType: TextInputType.number,
                          maxLenthOfTextField: 10,
                         validInput:(value) {
                              if (value.isEmpty) {
                                  return "Please Enter Mobile Number";
                                }
                              if (value.length != 10)
                                 {return 'Mobile Number must be of 10 digit';}
                                return null;},
  
                            lableTextField: "Mobile Number",
                            hintTextField: "Enter Mobile Number",
                           
                        myController: mobileNo
                        )),
                        SizedBox(height: MediaQuery.of(context).size.height / 40),
                    Container(
                        width: MediaQuery.of(context).size.width -
                            MediaQuery.of(context).size.width / 4,
                        height: MediaQuery.of(context).size.height / 15,
                        child: RaisedButton(
                            color: Theme.of(context).buttonColor,
                            textColor: Color.fromRGBO(0, 0, 0, 1),
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              'SAVE',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                            onPressed: () {
                               cameraa.uploadPic(context,"ProfilePhotos","1nucdckUSJvLLa93pSZ4");
                              
                              Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => new My_Donation(),
                                    ),
                                  );
                                
                              
                            })),
                    ] )
      ])
            ))
    );}
    else
    return CircularProgressIndicator();
    });
  }
  Widget cameraak() {
    return FutureBuilder(future:cameraa.getImageFromCamera(),builder: (context, snapshot) {
      if (snapshot.hasData) {
        return IconButton(
                  icon:Icon(Icons.camera_enhance_rounded,
                  color: Colors.black,),
                  onPressed: () {
                    setState(()  {
                       {this._image=snapshot.data;} 
                    });
                                   
                  } ,
                  );
      }else{
        return CircularProgressIndicator();
      }});
  }
}
