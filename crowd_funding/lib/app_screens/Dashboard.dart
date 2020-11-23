import 'dart:async';
import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crowd_funding/common/FileStorage.dart';
import 'package:crowd_funding/model/EventModel.dart';
import 'package:flutter/material.dart';
import 'Menu.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

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
      body: new CarouselWithIndicatorDemo('', this.uid),
    );
  }
}

class CarouselWithIndicatorDemo extends StatefulWidget {
  final String text, uid;
  CarouselWithIndicatorDemo(this.text, this.uid);
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState('', this.uid);
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  final String text, uid;
  _CarouselWithIndicatorState(this.text, this.uid);
  int _current = 0;
  final CollectionReference firebaseEvents =
      FirebaseFirestore.instance.collection('Event');
  FileStorage aFileStorage = new FileStorage();
  List<EventModel> aEventModel;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: retrieveEvent(),
      builder: (context, snapshot) {
        List<EventModel> aEventModel = snapshot.data;
        return Column(children: [
          SizedBox(
            height: 20,
          ),
          CarouselSlider(
            items: aEventModel.map((item) {
              EventModel aEvent = item;
              return Container(
                child: Container(
                  margin: EdgeInsets.all(5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: new Container(
                      child: new Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            new Align(
                              alignment: Alignment.centerLeft,
                              child: new Container(
                                  child: CircleAvatar(
                                radius: MediaQuery.of(context).size.width / 8,
                                child: ClipOval(
                                  child: new SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              5,
                                      child: Image.network(
                                        aEvent.pictureLocation,
                                        fit: BoxFit.fill,
                                      )),
                                ),
                              )),
                            ),
                          ]),
                      decoration: new BoxDecoration(
                        color: Theme.of(context).primaryColorLight,
                        borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.width / 8),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
            options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
        ]);
      },
    );
  }

  // Future<List<EventModel>> retrieveEvent() {
  //   var completer = new Completer<List<EventModel>>();

  //   firebaseEvents
  //       .where('userId', isEqualTo: 'akash')
  //       .get()
  //       .then((value) async {
  //     List<EventModel> aEventModelList = new List<EventModel>();
  //     for (var item in value.docs) {
  //       await aFileStorage
  //           .downloadFile(firebase_storage.FirebaseStorage.instance
  //               .ref()
  //               .child('akash')
  //               .child("image"))
  //           .then((value) {
  //         EventModel aEventModel = new EventModel();
  //         aEventModel = EventModel.fromJson(item.data());
  //         aEventModel.pictureLocation = value.first;
  //         aEventModelList.add(aEventModel);
  //       });
  //     }
  //     completer.complete(aEventModelList);
  //   });
  //   return completer.future;
  // }
  Future<List<EventModel>> retrieveEvent() {
    var completer = new Completer<List<EventModel>>();
    List<EventModel> aEventModelList = new List<EventModel>();
    EventModel aEventModel = new EventModel();
    aEventModel.campaginDays = 15;
    aEventModel.campaginDiscription = 'Help is needed';
    aEventModel.category = 'Medical';
    aEventModel.createdDate = '2020-11-21 11:05:26.134260';
    aEventModel.ownerName = 'sunny';
    aEventModel.goalAmount = 50000;
    aEventModel.projectName = 'Cancer';
    aEventModel.userId = '';
    aEventModel.pictureLocation =
        'https://i.picsum.photos/id/9/250/250.jpg?hmac=tqDH5wEWHDN76mBIWEPzg1in6egMl49qZeguSaH9_VI';
    aEventModelList.add(aEventModel);
    aEventModel.campaginDays = 25;
    aEventModel.campaginDiscription = 'Help is needed';
    aEventModel.category = 'Medical';
    aEventModel.createdDate = '2020-11-19 11:05:26.134260';
    aEventModel.ownerName = 'Akash';
    aEventModel.goalAmount = 1000;
    aEventModel.projectName = 'Covid';
    aEventModel.userId = '';
    aEventModel.pictureLocation =
        'https://i.picsum.photos/id/9/250/250.jpg?hmac=tqDH5wEWHDN76mBIWEPzg1in6egMl49qZeguSaH9_VI';
    aEventModelList.add(aEventModel);
    aEventModel.campaginDays = 25;
    aEventModel.campaginDiscription = 'Marketing stratgies';
    aEventModel.category = 'Equity';
    aEventModel.createdDate = '2020-11-19 11:05:26.134260';
    aEventModel.ownerName = 'yash';
    aEventModel.goalAmount = 15000;
    aEventModel.projectName = 'Aay works';
    aEventModel.userId = '';
    aEventModel.pictureLocation =
        'https://i.picsum.photos/id/9/250/250.jpg?hmac=tqDH5wEWHDN76mBIWEPzg1in6egMl49qZeguSaH9_VI';
    aEventModelList.add(aEventModel);
    completer.complete(aEventModelList);

    return completer.future;
  }
}
