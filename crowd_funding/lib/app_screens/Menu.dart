import 'package:crowd_funding/common/CameraApp.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Dashboard.dart';
import 'EditProfile.dart';
import 'MyFundraise.dart';
import 'My_Donation.dart';
import 'Help_Support.dart';
import 'Rewards.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                      child:
                          Image(image: AssetImage('assets/Images/profile.png')),
                    ),
                    new Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.width / 8),
                        child: new Column(children: <Widget>[
                          Text("Akash Nigam",
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
                                      builder: (context) => EditProfile(),
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
                      MaterialPageRoute(builder: (context) => MyFundraise()));
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
                      MaterialPageRoute(builder: (context) => My_Donation()));
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
                      MaterialPageRoute(builder: (context) => Dashboard()));
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
                      MaterialPageRoute(builder: (context) => Dashboard()));
                },
              ),
            ],
          )),
    );
  }
}
