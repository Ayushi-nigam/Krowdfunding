import 'package:flutter/material.dart';

class TextFField extends StatelessWidget {
  String lableTextField;
  String hintTextField;
  String errorText;
  final myController;
  IconButton suffixIcons;
  TextFField(
      {this.lableTextField,
      this.hintTextField,
      this.suffixIcons,
      this.errorText,
      this.myController});

  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
      textDirection: TextDirection.ltr,
      decoration: InputDecoration(
        labelText: lableTextField,
        suffixIcon: this.suffixIcons,
        labelStyle: TextStyle(
          color: Color(0xffFFFFFF),
          fontSize: 16.0,
          fontFamily: "Roboto",
          fontWeight: FontWeight.w400,
        ),
        hintText: hintTextField,
        hintStyle: TextStyle(
          color: Color(0xffFFFFFF),
          fontSize: 16.0,
          fontFamily: "Roboto",
          fontWeight: FontWeight.w400,
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).focusColor, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(10)),
        //border:  : OutlineInputBorder
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                style: BorderStyle.solid)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.red[600],
            )),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).focusColor, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(5)),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return errorText;
        }
        return null;
      },
    );
  }
}
