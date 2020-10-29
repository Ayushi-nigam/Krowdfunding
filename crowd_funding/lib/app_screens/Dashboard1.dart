import 'package:flutter/material.dart';
import 'Menu.dart';

class Dashboard1 extends StatelessWidget{
  GlobalKey<ScaffoldState> _dashboardKey= GlobalKey<ScaffoldState>();
  @override
  Widget build (BuildContext context){
    return new Scaffold(
      key:_dashboardKey,
      appBar:AppBar(
        title:Text("DASHBOARD",
          style: TextStyle(
            color: Colors.white70,
            fontSize:16,
            fontWeight: FontWeight.w700,
          )
        ),
        backgroundColor:Color(0xff455A64),
        leading: IconButton(
          icon: Icon(Icons.menu), 
           color: Colors.white70,
           onPressed: (){
             _dashboardKey.currentState.openDrawer();
           },
          ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications),
           onPressed:(){
              print("notification");
           },
           color: Colors.white70,
           ),
           IconButton(
            icon: Icon(Icons.share),
           onPressed:(){
              print("share");
           },
           color: Colors.white70),
           IconButton(
            icon: Icon(Icons.search),
           onPressed:(){
              print("search");
           },
           color: Colors.white70
           )
        ],
        elevation: 15,
      ),
       drawer: Menu(),
      backgroundColor:Theme.of(context).scaffoldBackgroundColor,
      body:new Container(

      ),
    );
  }
}