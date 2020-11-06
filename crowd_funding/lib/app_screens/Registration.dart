import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crowd_funding/common/successTick.dart';
import 'package:crowd_funding/model/User.dart';
import 'package:flutter/material.dart';
import 'TextFField.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrartionForm createState() {
    return _RegistrartionForm();
  }
}

class _RegistrartionForm extends State<Registration> {
  final registrationFormKey = GlobalKey<FormState>();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final mobileNumber = TextEditingController();
  final emailId = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  CollectionReference firebaseUsers =
      FirebaseFirestore.instance.collection('UserProfile');

  User aUser = new User();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          backgroundColor: Theme.of(context).appBarTheme.color,
          iconTheme: Theme.of(context).iconTheme,
          title: new Text(
            "Registration",
            style: new TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: new Form(
            key: registrationFormKey,
            child: new Center(
                child: new ListView(children: [
              SizedBox(height: MediaQuery.of(context).size.height / 20),
              new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width -
                          MediaQuery.of(context).size.width / 8,
                      height: MediaQuery.of(context).size.height / 10,
                      child: TextFField(
                          lableTextField: "First Name",
                          hintTextField: "Enter The First Name",
                          errorText: "Please Enter First Name",
                          suffixIcons: null,
                          myController: this.firstName),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 40),
                    Container(
                        width: MediaQuery.of(context).size.width -
                            MediaQuery.of(context).size.width / 8,
                        height: MediaQuery.of(context).size.height / 10,
                        child: TextFField(
                            lableTextField: "Last Name",
                            hintTextField: "Enter The Last Name",
                            errorText: "Please Enter Last Name",
                            suffixIcons: null,
                            myController: this.lastName)),
                    SizedBox(height: MediaQuery.of(context).size.height / 40),
                    Container(
                      width: MediaQuery.of(context).size.width -
                          MediaQuery.of(context).size.width / 8,
                      height: MediaQuery.of(context).size.height / 10,
                      child: TextFField(
                          lableTextField: "Email Id",
                          hintTextField: "Enter The Email Id",
                          errorText: "Please Enter Email Id",
                          suffixIcons: null,
                          myController: this.emailId),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 40),
                    Container(
                        width: MediaQuery.of(context).size.width -
                            MediaQuery.of(context).size.width / 8,
                        height: MediaQuery.of(context).size.height / 10,
                        child: TextFField(
                            lableTextField: "Mobile Number",
                            hintTextField: "Enter Mobile Number",
                            errorText: "Please Enter Mobile Number",
                            suffixIcons: null,
                            myController: this.mobileNumber)),
                    SizedBox(height: MediaQuery.of(context).size.height / 40),
                    Container(
                        width: MediaQuery.of(context).size.width -
                            MediaQuery.of(context).size.width / 8,
                        height: MediaQuery.of(context).size.height / 10,
                        child: TextFField(
                            lableTextField: "Enter Password",
                            hintTextField: "Enter your password",
                            errorText: "Please Enter Password",
                            suffixIcons: IconButton(
                              icon: new Icon(
                                Icons.remove_red_eye,
                                //color: this._showPassword ? Colors.blue : Colors.grey,
                              ),
                              onPressed: null,
                            ),
                            myController: this.password)),
                    SizedBox(height: MediaQuery.of(context).size.height / 40),
                    Container(
                        width: MediaQuery.of(context).size.width -
                            MediaQuery.of(context).size.width / 8,
                        height: MediaQuery.of(context).size.height / 10,
                        child: TextFField(
                            lableTextField: "Enter Re-Password",
                            hintTextField: "Enter your Re-Password",
                            errorText: "Please Enter Re-Password",
                            suffixIcons: IconButton(
                              icon: Icon(
                                Icons.remove_red_eye,
                                //color: this._showPassword ? Colors.blue : Colors.grey,
                              ),
                              onPressed: null,
                            ),
                            myController: this.confirmPassword)),
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
                              'CREATE ACCOUNT',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                            onPressed: () {
                              if (registrationFormKey.currentState.validate()) {
                                this.setUserDetail();
                                firebaseUsers
                                    .add(this.aUser.toJson())
                                    .then((value) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => new SuccessTick(),
                                    ),
                                  );
                                });
                              }
                            })),
                  ])
            ]))));
  }

  void setUserDetail() {
    this.aUser.firstName = this.firstName.text;
    this.aUser.lastName = this.lastName.text;
    this.aUser.mobileNumber = this.mobileNumber.text;
    this.aUser.emailId = this.emailId.text;
    this.aUser.password = this.password.text;
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    this.firstName.dispose();
    this.lastName.dispose();
    this.mobileNumber.dispose();
    this.emailId.dispose();
    this.password.dispose();
    this.confirmPassword.dispose();
    super.dispose();
  }
}
