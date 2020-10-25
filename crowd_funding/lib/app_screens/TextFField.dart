  import 'package:flutter/material.dart'; 
  class TextFField extends StatelessWidget{
  String lableTextField ;
   String hintTextField;
  IconButton suffixIcons;
    TextFField({
      this.lableTextField,
      this.hintTextField,
      this.suffixIcons
    });
   
    Widget build(BuildContext context){
             return TextFormField(
                    decoration: InputDecoration(
                     labelText: lableTextField,
                      suffixIcon:this.suffixIcons,
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
                              color: Theme.of(context).focusColor,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(5)),
                      //border:  : OutlineInputBorder
                       enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor, 
                              style: BorderStyle.solid)),),
                      
                       
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },);
    }

   
  }
