//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'TextFField.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class Login extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: LoginForm(),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginForm createState() {
    return _LoginForm();
  }
}

class _LoginForm extends State<LoginForm> {
   bool _isLoggedIn = false;
   GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
  
    return Form(
      
        key: _loginFormKey,
        child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 100),
            child: ListView(
              children: <Widget>[
                Padding(
                  
                  padding: EdgeInsets.only(top: 10),
                  child: TextFField(
                    lableTextField:"Enter Email",
                     hintTextField :"Enter you email Id",
                    suffixIcons:IconButton(
                        icon: Icon(
                        Icons.remove_red_eye,
                        //color: this._showPassword ? Colors.blue : Colors.grey,
                        ))
                )),
                Padding(
                  padding: EdgeInsets.only(top: 60),
                  child: TextFormField(
                    decoration: InputDecoration(
                      //errorText: "Enter password",
                      labelText: "Password",
                      suffixIcon: IconButton(
                        icon: Icon(
                        Icons.remove_red_eye,
                        //color: this._showPassword ? Colors.blue : Colors.grey,
                        )),
                      labelStyle: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontSize: 16.0,
                        fontFamily: "Roboto", 
                        fontWeight: FontWeight.w400,
                      ),
                      hintText: "Enter your Password",
                      /*errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:  BorderSide(
                          color: Colors.red[600],
                        ) 
                        )*/
                        /*focusedErrorBorder:OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).focusColor,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(5)), */
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).focusColor,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(5)),
                      //border:  : OutlineInputBorder
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor, 
                              style: BorderStyle.solid)),
                    ),
                    
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
            Padding(
            padding:  EdgeInsets.only(top :60),
            child: RaisedButton(
              textColor: Color.fromRGBO(0, 0, 0, 1),
              elevation: 10,
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
              child: Text('Submit',
              style: TextStyle(
                fontSize:14,
                fontWeight: FontWeight.w400
                ),),
                onPressed: () {
                // Validate returns true if the form is valid, or false
                // otherwise.
                if (_loginFormKey.currentState.validate()) {
                  // If the form is valid, display a Snackbar.
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
              }
            ),
          ),

          Padding(
             padding:EdgeInsets.only(left:160, right:100, top:40),
            child: Container(
              child:Text("OR",
                  style:TextStyle(
                    fontSize:14,
                    fontWeight:FontWeight.w400,
                    color:Color.fromRGBO(255, 255, 255, 1),
                  ) 
              )
            
          )),
          Padding(
            padding:  EdgeInsets.only(left:30,top :30,right:30),
            child: RaisedButton(
              textColor: Color.fromRGBO(255, 255, 255, 1),
              elevation: 10,
              color: Colors.blue,
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(10.0),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding( 
                    padding: EdgeInsets.only(left:15),
                    child:Icon(FontAwesomeIcons.google , color : Color(0xffFFFFFF) ,size: 35.0,),
                  ),
                Padding(
                  
                  padding: EdgeInsets.only(left:50),
                child:Text('Sign In with Google',
                style: TextStyle(
                fontSize:14,
                fontWeight: FontWeight.w400
                ),),
                )
               
              ],),
              
                 onPressed: () {
                   _login();
                   }
                // if (_loginFormKey.currentState.validate()) {
                //   Scaffold.of(context)
                //       .showSnackBar(SnackBar(content: Text('Processing Data')));
                // }
              
            ),
            ),
          Padding(
           padding: EdgeInsets.only(top: 30),
            child: RaisedButton(
              textColor: Color.fromRGBO(255, 255, 255, 1),
              elevation: 10,
              color: Colors.blue[900],
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(10.0),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                Padding( 
                    padding: EdgeInsets.only(left:15),
                    child:Icon(FontAwesomeIcons.facebookSquare , color : Color(0xffFFFFFF) ,size: 40,),
                  ),
                Padding(
                  padding: EdgeInsets.only(left:40),
                child:Text('Sign In with Facebook',
                style: TextStyle(
                fontSize:14,
                fontWeight: FontWeight.w400
                ),),
                )
               
              ],),
              
                 onPressed: () {
                // Validate returns true if the form is valid, or false
                // otherwise.
                if (_loginFormKey.currentState.validate()) {
                  // If the form is valid, display a Snackbar.
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
              }
            ), 
            ),
            
          Padding(
            padding: EdgeInsets.only(left:100,right:100 ,top: 30),
            child: RaisedButton(
              color: Theme.of(context).primaryColor,
              textColor: Color.fromRGBO(0, 0, 0, 1),
              elevation: 10,
              shape:RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
                ),
              padding: EdgeInsets.fromLTRB(30, 12, 30, 12),
              child: Text('Sign Up',
              style: TextStyle(
                fontSize:14,
                fontWeight: FontWeight.w400
                ),),
                onPressed: () {
                
                if (_loginFormKey.currentState.validate()) {
                  
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
              }
            ),
          )
              ],
            ))
            );
   


  }

 _login() async{
    try{
      await _googleSignIn.signIn();
      setState(() {
        _isLoggedIn = true;
      });
    } catch (err){
      print(err);
    }
  }
    
  
}
    