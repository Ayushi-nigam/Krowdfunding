import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFField extends StatelessWidget {
  String lableTextField;
  String hintTextField;
  //String errorText;
  final myController;
  bool obscureTexts; 
  Function validInput;
  IconButton suffixIcons;
  TextInputType aTextInputType;
  int maxLenthOfTextField;
  int maxLine;
  int minLine;
  TextFField(
      {this.lableTextField,
      this.hintTextField,
      this.suffixIcons,
      //this.errorText,
      this.myController,
      this.aTextInputType,
      this.maxLine,
      this.minLine,
      this.maxLenthOfTextField,
      this.obscureTexts,
      this.validInput});

  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: this.aTextInputType,
      maxLines: this.maxLine,
      maxLength: this.minLine,
      controller: myController,
      obscureText: obscureTexts,
      inputFormatters: <TextInputFormatter>[
                  LengthLimitingTextInputFormatter(maxLenthOfTextField),
          //         if(validInput!=null)  
          // FilteringTextInputFormatter.allow(validInput)
        ],
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
      validator:validInput
    );
  }
}
