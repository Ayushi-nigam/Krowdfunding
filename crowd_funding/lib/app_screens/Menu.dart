import 'package:crowd_funding/app_screens/FundraiseList.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'downloadImage.dart';
import 'Dashboard.dart';
import 'EditProfile.dart';
import 'MyFundraise.dart';
import 'My_Donation.dart';
import 'Help_Support.dart';
import 'Rewards.dart';

class Menu extends StatelessWidget {
  String uid;
  String name="UserName";
  downloadImage download = new downloadImage();
  Image imagePath;
  final firestoreInstance = FirebaseFirestore.instance;
  Menu(@required this.uid);
  
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future:firestoreInstance.collection('UserProfile').doc(uid).get(),

    builder: (context,snapshot){
      if(snapshot.hasData){
         name=snapshot.data["firstName"]+snapshot.data["lastName"];
        return new Drawer(
      elevation: 5,
      child: new Container(
          color: Theme.of(context).focusColor,
          child: new ListView(
            padding: EdgeInsets.zero,
            children: [
              new DrawerHeader(
                child: Container(
                    child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width -
                          MediaQuery.of(context).size.width / 1.3,
                      height: MediaQuery.of(context).size.height / 5,
                      child:FutureBuilder(
                              future: download.getProfileImage("ProfilePhotos", uid),
                              builder: (context, snapshot) {
                                if (snapshot.hasData){
                                  return  snapshot.data;
                                }
                                else return Image(image:AssetImage('assets/Images/profile.png',),fit: BoxFit.fill,);
                              }
                        ),
                    ),
                    new Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.width / 8),
                        child: new Column(children: <Widget>[
                          Text(name,
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w600,
                              )),
                          Row(
                            children: <Widget>[
                              FlatButton(
                                child: Text("Edit Profile",
                                    textDirection: TextDirection.ltr,
                                    style: TextStyle(
                                      color: Color(0xB3FFFFFF),
                                      fontSize: 16,
                                      fontFamily: "Roboto",
                                    )),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EditProfile(uid: uid,),
                                    ),
                                  );
                                },
                              ),
                              Icon(
                                Icons.edit,
                                color: Theme.of(context).iconTheme.color,
                                size: 20,
                              )
                            ],
                          )
                        ]))
                  ],
                )),
                decoration: new BoxDecoration(
                    color: Theme.of(context).appBarTheme.color),
              ),
              new ListTile(
                leading: Icon(FontAwesomeIcons.moneyBillAlt),
                title: new Text(
                  "My Fundraise",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FundraiseList("My Donation")));
                },
              ),
              new ListTile(
                leading: Icon(FontAwesomeIcons.donate),
                title: new Text(
                  "My Donation",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => new FundraiseList("My Donation")));
                },
              ),
              new ListTile(
                leading: Icon(FontAwesomeIcons.search),
                title: new Text(
                  "Browser",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Dashboard(uid:uid)));
                },
              ),
              new ListTile(
                leading: Icon(FontAwesomeIcons.gift),
                title: new Text(
                  "Rewards",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Rewards()));
                },
              ),
              new ListTile(
                leading: Icon(Icons.help),
                title: new Text(
                  "Help And Support",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Help_Support()));
                },
              ),
              new ListTile(
                leading: Icon(Icons.exit_to_app),
                title: new Text(
                  "Logout",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Dashboard(uid: uid,)));
                },
              ),
            ],
          )),
    );
  }
      else{
        return CircularProgressIndicator();
      }
    });
  }
}
