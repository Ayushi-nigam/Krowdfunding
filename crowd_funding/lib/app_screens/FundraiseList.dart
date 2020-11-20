import 'package:crowd_funding/app_screens/MyFundraise.dart';
import 'package:crowd_funding/model/EventModel.dart';
import 'package:flutter/material.dart';

class FundraiseList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text(
        "My Fundraise",
        style: new TextStyle(color: Colors.white),
      )),
      body: FutureBuilder(
        future: null,
        builder: (context, snapshot) {
          return new Text("Akash");
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
      
    }
  }
  

