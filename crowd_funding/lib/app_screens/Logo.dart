import 'package:flutter/material.dart';
import 'Login.dart';
 class Logo extends StatefulWidget{
      _LogoState createState()=> _LogoState();
    }

    class _LogoState extends State<Logo> {
      @override
      void initState(){
        super.initState();
        Future.delayed(
          Duration(seconds :5),
          (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),
            ),
            );
          },
        );
      }

      @override
      Widget build(BuildContext context){
        return Scaffold(
          backgroundColor: Color.fromARGB(0xFF, 21, 21, 21),
          body: Center(
            child:Container(
                  child : LogoImage(),
            )
            )
            
            
          );
      }
    }
    class LogoImage extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    AssetImage logoAssetImage = AssetImage('images/Logo.jpg');
    Image logoImage = Image(image:logoAssetImage);
    return Container(child: logoImage,);
  }
}