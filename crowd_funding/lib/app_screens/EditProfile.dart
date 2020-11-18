import 'package:flutter/material.dart';
import 'TextFField.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crowd_funding/common/successTick.dart';
class EditProfile extends StatefulWidget {
  @override
  _EditProfile createState() {
    return _EditProfile();
  }
}
class _EditProfile extends State<EditProfile> {
  final editFormKey = GlobalKey<FormState>();
  TextEditingController name;
  TextEditingController email;
  TextEditingController mobileNo;
  final firestoreInstance = FirebaseFirestore.instance;
  
  @override
  Widget build(BuildContext context) {
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
                Container(
                  width: MediaQuery.of(context).size.width,           
                height: MediaQuery.of(context).size.height/5,
                decoration: BoxDecoration(
                  boxShadow:[ BoxShadow(blurRadius: 10.0,
                  color:Colors.white60,),],
                  shape: BoxShape.circle,
                  image:  DecorationImage(
                    fit:BoxFit.fitHeight,
                    image:AssetImage('assets/Images/profile.png'))
                )),
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
                child: IconButton(
                  icon:Icon(Icons.camera_enhance_rounded,
                  color: Colors.black,),),
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
                              
                              // if (editFormKey.currentState.validate()) {
                              // Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //         builder: (context) => new SuccessTick(),
                              //       ),
                              //     );
                                
                              // }
                            })),
                    ] )
      ])
            ))
    );}
    else
    return CircularProgressIndicator();
    });
  }
}
