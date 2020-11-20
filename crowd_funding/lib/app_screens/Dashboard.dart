import 'package:flutter/material.dart';
import 'Menu.dart';
class Dashboard extends StatefulWidget {
  final String uid;

  Dashboard({Key key, @required this.uid}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState(uid);
}

class _DashboardState extends State<Dashboard> {
  final String uid;
  _DashboardState(this.uid);
  GlobalKey<ScaffoldState> _dashboardKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _dashboardKey,
      appBar: AppBar(
        title: Text("DASHBOARD",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            )),
        backgroundColor: Color(0xff455A64),
        leading: IconButton(
          icon: Icon(Icons.menu),
          color: Colors.white70,
          onPressed: () {
            _dashboardKey.currentState.openDrawer();
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              print("notification");
            },
            color: Colors.white70,
          ),
          IconButton(
              icon: Icon(Icons.share),
              onPressed: () {
                print("share");
              },
              color: Colors.white70),
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                print("search");
              },
              color: Colors.white70)
        ],
        elevation: 15,
      ),
      drawer: Menu(uid),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: new Container(),
    );
  }
}
