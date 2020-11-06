import 'package:flutter/material.dart';
import 'TextFField.dart';
import 'Registration.dart';
import 'Dashboard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login extends StatefulWidget {
  @override
  _LoginForm createState() {
    return _LoginForm();
  }
}

class _LoginForm extends State<Login> {
  final loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: loginFormKey,
        child: new Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: new ListView(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new Container(
                    margin: EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: (MediaQuery.of(context).size.width - 350)),
                    child: Column(children: [
                      SizedBox(height: 40.0),
                      SizedBox(
                          width: MediaQuery.of(context).size.width - 30,
                          height: 70,
                          child: TextFField(
                            lableTextField: "Enter Email",
                            hintTextField: "Enter your email Id",
                            suffixIcons: IconButton(
                                icon: Icon(
                              null,
                            )),
                            errorText: "Please Enter Email Id",
                          )),
                      SizedBox(height: 40.0),
                      SizedBox(
                          width: MediaQuery.of(context).size.width - 30,
                          height: 50,
                          child: TextFField(
                            lableTextField: "Enter Password",
                            hintTextField: "Enter your password",
                            suffixIcons: IconButton(
                                icon: Icon(
                              Icons.remove_red_eye,
                              //color: this._showPassword ? Colors.blue : Colors.grey,
                            )),
                            errorText: "Please Enter Password",
                          )),
                      SizedBox(height: 30.0),
                      SizedBox(
                          width: MediaQuery.of(context).size.width - 30,
                          height: 50,
                          child: RaisedButton(
                              color: Theme.of(context).buttonColor,
                              textColor: Color.fromRGBO(0, 0, 0, 1),
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                              onPressed: () {
                                if (loginFormKey.currentState.validate()) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Dashboard(),
                                    ),
                                  );
                                  Scaffold.of(context).showSnackBar(SnackBar(
                                      content: Text('Processing Data')));
                                }
                              })),
                    ]),
                  ),
                  new Column(children: [
                    SizedBox(height: 30.0),
                    Text(
                      "OR",
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width - 30,
                        height: 50,
                        child: RaisedButton(
                            color: Colors.blue,
                            onPressed: () {},
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(left: 18),
                                  child: Icon(
                                    FontAwesomeIcons.google,
                                    color: Color(0xffFFFFFF),
                                    size: 25.0,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 40),
                                  child: Text(
                                    'Sign In with Google',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                )
                              ],
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)))),
                    SizedBox(height: 15),
                    SizedBox(
                        width: MediaQuery.of(context).size.width - 30,
                        height: 50,
                        child: RaisedButton(
                            color: Colors.blue[800],
                            onPressed: () {},
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(left: 18),
                                  child: Icon(
                                    FontAwesomeIcons.facebookSquare,
                                    color: Color(0xffFFFFFF),
                                    size: 30.0,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 40),
                                  child: Text(
                                    'Sign In with Facebook',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                )
                              ],
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)))),
                    SizedBox(
                      height: 15.0,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width - 150,
                        height: 50,
                        child: RaisedButton(
                            color: Theme.of(context).primaryColor,
                            textColor: Color.fromRGBO(0, 0, 0, 1),
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => new Registration(),
                                ),
                              );
                            })),
                  ]),
                ],
              )
            ],
          ),
        ));
  }
}
Akash
