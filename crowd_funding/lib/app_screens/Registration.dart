import 'package:flutter/material.dart';
import 'TextFField.dart';
import 'Dashboard.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrartionForm createState() {
    return _RegistrartionForm();
  }
}

class _RegistrartionForm extends State<Registration> {
  final registrationFormKey = GlobalKey<FormState>();

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
                child: new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width -
                        MediaQuery.of(context).size.width / 8,
                    height: MediaQuery.of(context).size.height / 10,
                    child: TextFField(
                      lableTextField: "First Name",
                      hintTextField: "Enter The First Name",
                      errorText: "Please Enter First Name",
                      suffixIcons: IconButton(
                          icon: Icon(
                        null,
                      )),
                    ),
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width -
                          MediaQuery.of(context).size.width / 8,
                      height: MediaQuery.of(context).size.height / 10,
                      child: TextFField(
                        lableTextField: "Last Name",
                        hintTextField: "Enter The Last Name",
                        errorText: "Please Enter Last Name",
                        suffixIcons: IconButton(
                            icon: Icon(
                          null,
                        )),
                      )),
                  SizedBox(
                    width: MediaQuery.of(context).size.width -
                        MediaQuery.of(context).size.width / 8,
                    height: MediaQuery.of(context).size.height / 10,
                    child: TextFField(
                      lableTextField: "Email Id",
                      hintTextField: "Enter The Email Id",
                      errorText: "Please Enter Email Id",
                      suffixIcons: IconButton(
                          icon: Icon(
                        null,
                      )),
                    ),
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width -
                          MediaQuery.of(context).size.width / 8,
                      height: MediaQuery.of(context).size.height / 10,
                      child: TextFField(
                        lableTextField: "Mobile Number",
                        hintTextField: "Enter Mobile Number",
                        errorText: "Please Enter Mobile Number",
                        suffixIcons: IconButton(
                            icon: Icon(
                          null,
                        )),
                      )),
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
                        )),
                      )),
                  SizedBox(
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
                        )),
                      )),
                  SizedBox(
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Dashboard(),
                                ),
                              );
                              Scaffold.of(context).showSnackBar(
                                  SnackBar(content: Text('Processing Data')));
                            }
                          })),
                ]))));
  }
}
