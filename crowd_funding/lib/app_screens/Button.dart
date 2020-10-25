// import 'package:flutter/material.dart';

// class button extends StatelessWidget{
//   String elevation;
//   String text;
//   String loginFormKey;
//   button({
//     @required
//    this.elevation,
//    this.text,
//    this.loginFormKey
//   });
//   Widget build(BuildContext context){
//     return RaisedButton(
//               textColor: Color.fromRGBO(0, 0, 0, 1),
//               elevation: 10,
//               shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//               padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
//               child: Text('Submit',
//               style: TextStyle(
//                 fontSize:14,
//                 fontWeight: FontWeight.w400
//                 ),),
//                 onPressed: () {
//                 // Validate returns true if the form is valid, or false
//                 // otherwise.
//                 if (loginFormKey.context.validate()) {
//                   // If the form is valid, display a Snackbar.
//                   Scaffold.of(context)
//                       .showSnackBar(SnackBar(content: Text('Processing Data')));
//                 }
//               }
//             );
//   }
// }