import 'package:flutter/material.dart';
import 'app_screens/Login.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
void main() => runApp(CrowdfundApp());

  class CrowdfundApp extends StatelessWidget {
    @override
          Widget build(BuildContext context){
            return new MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                focusColor: Color(0xffCFD8DC),
                primaryColor:Color(0xffCFD8DC),
                textTheme: TextTheme(
                  bodyText1: TextStyle(
                    color : Color(0xffFFFFFF) )
                ),     
                buttonColor : Color(0xffEA8724),
                scaffoldBackgroundColor :Color(0xff607D8B)
             ),
            title:"Crowd Funding",
            home: Logo(),   
            );
            
        }
      }
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