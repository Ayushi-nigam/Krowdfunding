import 'package:flutter/material.dart';
import 'TextFField.dart';
import 'package:crowd_funding/common/successTick.dart';
class EditProfile extends StatefulWidget {
  @override
  _EditProfile createState() {
    return _EditProfile();
  }
}
class _EditProfile extends State<EditProfile> {
  final editFormKey = GlobalKey<FormState>();
  bool enableName=false;
  bool email=false;
  bool mobile=false;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
            Container(
            child: SizedBox(
                width: MediaQuery.of(context).size.width,           
                height: MediaQuery.of(context).size.height/4,
                child:Image(image: AssetImage('assets/Images/profile.png'),
                alignment: Alignment.center,
                 fit: BoxFit.contain
              ))),
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
                          obscureTexts: false,
                          aTextInputType: TextInputType.name,
                          maxLenthOfTextField: null,
                         // validInput: RegExp(r'[a-zA-Z]'),
                          lableTextField: "Full Name",
                          hintTextField: "Enter The Full Name",
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
                             onPressed: (){
                               setState(() {                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
                                 mobile=!mobile;
                               });
                               
                             },),
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
                           
                        //myController: this.mobileNumber
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
                              if (editFormKey.currentState.validate()) {
                              Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => new SuccessTick(),
                                    ),
                                  );
                                
                              }
                            })),
                    ] )
      ])
            ))
    );
  }
}
