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
      body: CarouselWithIndicatorDemo(),
    );
  }
}

class CarouselWithIndicatorDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
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
                                      child: Image.file(
                                        new File(aEvent.pictureLocation),
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

  Future<List<EventModel>> retrieveEvent() {
    var completer = new Completer<List<EventModel>>();

    firebaseEvents
        .where('userId', isEqualTo: 'akash')
        .get()
        .then((value) async {
      List<EventModel> aEventModelList = new List<EventModel>();
      for (var item in value.docs) {
        await aFileStorage
            .downloadFile(firebase_storage.FirebaseStorage.instance
                .ref()
                .child('akash')
                .child("image"))
            .then((value) {
          EventModel aEventModel = new EventModel();
          aEventModel = EventModel.fromJson(item.data());
          aEventModel.pictureLocation = value.first;
          aEventModelList.add(aEventModel);
        });
      }
      completer.complete(aEventModelList);
    });
    return completer.future;
  }
}

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];
final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.cover, width: 1000.0),
                  ],
                )),
          ),
        ))
    .toList();
