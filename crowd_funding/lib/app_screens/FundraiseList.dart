import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crowd_funding/app_screens/MyFundraise.dart';
import 'package:crowd_funding/model/EventModel.dart';
import 'package:flutter/material.dart';

class FundraiseList extends StatelessWidget {
  final CollectionReference firebaseEvents =
      FirebaseFirestore.instance.collection('Event');
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
          List<EventModel> aEventModel = snapshot.data;
          if (snapshot.hasData) {
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
                  child: new Row(children: [
                    new Align(
                        alignment: Alignment.centerLeft,
                        child: Image(
                          image: AssetImage(
                            'assets/Images/profile.png',
                          ),
                          fit: BoxFit.fill,
                        )),
                    new Align(
                        alignment: Alignment.topCenter,
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            new Align(
                              alignment: Alignment.topLeft,
                              child: new Text(
                                "Kerela Floods",
                                style: new TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 14,
                            ),
                            new Align(
                                alignment: Alignment.bottomLeft,
                                child: new Container(
                                  width: MediaQuery.of(context).size.width / 4,
                                  child: Center(child: new Text(" 2 Days ago")),
                                  decoration: new BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(
                                          MediaQuery.of(context).size.width /
                                              6)),
                                ))
                          ],
                        )),
                    new Align(
                      alignment: Alignment.bottomLeft,
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

    firebaseEvents.where('userId', isEqualTo: 'akash').get().then((value) {
      List<EventModel> aEventModelList = new List<EventModel>();
      for (var item in value.docs) {
        aEventModelList.add(EventModel.fromJson(item.data()));
      }
      completer.complete(aEventModelList);
    });
    return completer.future;
  }
}
