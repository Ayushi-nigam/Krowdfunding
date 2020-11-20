import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crowd_funding/app_screens/MyFundraise.dart';
import 'package:crowd_funding/common/FileStorage.dart';
import 'package:crowd_funding/model/EventModel.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class FundraiseList extends StatelessWidget {
  final CollectionReference firebaseEvents =
      FirebaseFirestore.instance.collection('Event');
  FileStorage aFileStorage = new FileStorage();
  List<EventModel> aEventModel;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text(
        "My Fundraise",
        style: new TextStyle(color: Colors.white),
      )),
      body: FutureBuilder(
        future: retrieveEvent(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            this.aEventModel = snapshot.data;
            return ListView.separated(
              shrinkWrap: true,
              itemCount: aEventModel.length,
              separatorBuilder: (context, index) {
                return SizedBox(
                    height: MediaQuery.of(context).size.height / 25);
              },
              itemBuilder: (context, index) {
                return new Container(
                  height: MediaQuery.of(context).size.height / 6,
                  width: MediaQuery.of(context).size.width / 6,
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
                                      MediaQuery.of(context).size.height / 5,
                                  child: Image.file(
                                    new File(this
                                        .aEventModel
                                        .elementAt(index)
                                        .pictureLocation),
                                    fit: BoxFit.fill,
                                  )),
                            ),
                          )),
                        ),
                        new Align(
                            alignment: Alignment.topCenter,
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                new Align(
                                  alignment: Alignment.topLeft,
                                  child: new Text(
                                    this
                                        .aEventModel
                                        .elementAt(index)
                                        .projectName,
                                    style: new TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 14,
                                ),
                                new Align(
                                    alignment: Alignment.bottomLeft,
                                    child: new Container(
                                      width:
                                          MediaQuery.of(context).size.width / 4,
                                      child: (new DateTime.now()
                                                  .difference(DateTime.parse(
                                                      this
                                                          .aEventModel
                                                          .elementAt(index)
                                                          .createdDate))
                                                  .inDays) ==
                                              0
                                          ? Center(child: new Text("Today"))
                                          : Center(
                                              child: new Text((new DateTime
                                                              .now()
                                                          .difference(DateTime
                                                              .parse(this
                                                                  .aEventModel
                                                                  .elementAt(
                                                                      index)
                                                                  .createdDate))
                                                          .inDays)
                                                      .toString() +
                                                  " days ago")),
                                      decoration: new BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius: BorderRadius.circular(
                                              MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  6)),
                                    ))
                              ],
                            )),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 14,
                        ),
                        new Align(
                          alignment: Alignment.bottomRight,
                          heightFactor: 5.4,
                          child: new Container(
                            height: MediaQuery.of(context).size.height / 35,
                            width: MediaQuery.of(context).size.width / 4,
                            child: Center(child: new Text("Finished")),
                            decoration: new BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(
                                    MediaQuery.of(context).size.width / 6)),
                          ),
                        )
                      ]),
                  decoration: new BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width / 8),
                  ),
                );
              },
            );
          }
          return new Text("data");
        },
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        backgroundColor: Theme.of(context).buttonColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => new MyFundraise(),
            ),
          );
        },
      ),
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
