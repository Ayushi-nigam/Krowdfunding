import 'dart:ui';
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:crowd_funding/app_screens/FundraiseList.dart';
import 'package:crowd_funding/common/FileStorage.dart';
import 'package:crowd_funding/model/EventModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyFundraiseDetailView extends StatefulWidget {
  final String uid;
   String currentProjectName='';

  MyFundraiseDetailView({Key key, @required this.uid,this.currentProjectName}) : super(key: key);

  @override
  _myFundraiseDetailViewState createState() => _myFundraiseDetailViewState(uid,currentProjectName);
}

class _myFundraiseDetailViewState extends State<MyFundraiseDetailView> {
  final String uid;
  String currentProjectName='';
  final CollectionReference firebaseEvents =
      FirebaseFirestore.instance.collection('Event');
  FileStorage aFileStorage = new FileStorage();
  EventModel aEventModel;
  int _current = 0;
  _myFundraiseDetailViewState(this.uid,this.currentProjectName);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text(
            "Campaign Days",
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white70,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      new FundraiseList("My Fundraise", this.uid),
                ),
              );
            },
          )),
      body: FutureBuilder(
        future: retrieveEvent(currentProjectName),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            this.aEventModel = snapshot.data;
            print("indide snapsh,,ot");
            return ListView(children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.5,
                  child:CarouselSlider(
                    items: imagePath( this.aEventModel.multiplePictureLocation  ),
                    options: CarouselOptions(
                        height: MediaQuery.of(context).size.height / 2.8,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        aspectRatio: 2.0,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        }),
                  )),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                color: Theme.of(context).focusColor,
                child: ListView(
                  children: [
                    Row(children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 14,
                      ),
                      Text(this.aEventModel.projectName,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 20)),
                    ]),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 80,
                    ),
                    Row(children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 14,
                      ),
                      Text(
                        "Created By",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 14),
                      ),
                    ]),
                    Row(children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 14,
                      ),
                      Text(
                        this.aEventModel.ownerName,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 14),
                      ),
                    ]),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 50,
                    ),
                    Row(children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 14,
                      ),
                      Text(this.aEventModel.campaginDiscription,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 18)),
                    ]),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 150,
                    ),
                    Row(children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 14,
                      ),
                      Text(
                        this.aEventModel.city,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 14),
                      ),
                    ]),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 100,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 130,
                      child: Container(
                          color: Theme.of(context).scaffoldBackgroundColor),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 80,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 14,
                        ),
                        Text(this.aEventModel.goalAmount.toString(),
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 16)),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 6,
                        ),
                        Text("20 ",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 16)),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 6,
                        ),
                        Text(
                            ((this.aEventModel.campaginDays) -
                                        DateTime.now()
                                            .difference((DateTime.parse(
                                                this.aEventModel.createdDate)))
                                            .inDays)
                                    .toString() +
                                " Days",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 16)),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 14,
                        ),
                        Text("pledged of",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 16)),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 8,
                        ),
                        Text("Donors",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 16)),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 10,
                        ),
                        Text("Left",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 16)),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 14,
                        ),
                        Text("80,000",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 16)),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 9),
                    Container(
                        width: MediaQuery.of(context).size.width -
                            MediaQuery.of(context).size.width / 4,
                        height: MediaQuery.of(context).size.height / 15,
                        child: RaisedButton(
                            color: Theme.of(context).buttonColor,
                            textColor: Color.fromRGBO(0, 0, 0, 1),
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              'Donate',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                            onPressed: () {
                              
                            })),
                  ],
                ),
              ),
            ]);
          } else
            return CircularProgressIndicator();
        },
      ),
    );
  }

  Future<String> customAlertbox(BuildContext context){
    return showDialog(
      context:context,
      builder:(context){
        return AlertDialog();
      }
    );
  }
  List<Image> imagePath(List<String> aIMage)  {
   
    List<Image> img =new List<Image>();
    for (var item in aIMage) {
      img.add(Image.network(item,filterQuality:FilterQuality.medium,width: MediaQuery.of(context).size.width,fit:BoxFit.fill));
    }
    
    return img;
  }

  Future<EventModel> retrieveEvent(String currentProjectName) {
    var completer = new Completer<EventModel>();
    EventModel aEventModel = new EventModel();
    FirebaseFirestore.instance
        .collection("EventDocument")
        .doc("events")
        .collection(uid)
        .where("projectName", isEqualTo: currentProjectName)
        .get()
        .then((value) async {
      print(value.docs.first.id);
      await aFileStorage
          .downloadFile(firebase_storage.FirebaseStorage.instance
              .ref()
              .child(uid)
              .child("Documents")
              .child("event" + (value.docs.first.id).toString()))
          .then((value1) {
        print("value1 in download");
        print(value1.first);

        aEventModel = EventModel.fromJson(value.docs.first.data());
        aEventModel.multiplePictureLocation = value1;
      });
      completer.complete(aEventModel);
    });
    return completer.future;
  }
}
