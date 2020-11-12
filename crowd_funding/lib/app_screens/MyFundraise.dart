import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crowd_funding/app_screens/TextFField.dart';
import 'package:crowd_funding/model/User.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyFundraise extends StatefulWidget {
  @override
  MyFundraiseState createState() => new MyFundraiseState();
}

class MyFundraiseState extends State<MyFundraise> {
  int currentStep = 0;
  bool complete = false;
  User user = new User();
  final List<DropdownMenuItem> items = [];
  final List<DropdownMenuItem> yearsOfExp = [];
  String selectedValueCity;
  String selectedValueResidence;
  CollectionReference firebaseUsers =
      FirebaseFirestore.instance.collection('UserProfile');
  @override
  void initState() {
    items.add(DropdownMenuItem(
      child: Text("Bhopal"),
      value: "Bhopal",
    ));
  }

  next() {
    if (currentStep == 2) {
      firebaseUsers.add(this.user.toJson()).then((value) {
        currentStep + 1 != steps.length
            ? goTo(currentStep + 1)
            : setState(() => complete = true);
      });
    } else {
      currentStep + 1 != steps.length
          ? goTo(currentStep + 1)
          : setState(() {
              complete = true;
            });
    }
  }

  cancel() {
    if (currentStep > 0) {
      goTo(currentStep - 1);
    }
  }

  goTo(int step) {
    setState(() => currentStep = step);
  }

  bool isActive(index) {
    if (currentStep == index) {
      return true;
    } else {
      return false;
    }
  }

  StepState isComplete(index) {
    if (currentStep > index) {
      return StepState.complete;
    } else if (currentStep == index) {
      return StepState.editing;
    } else {
      return StepState.disabled;
    }
  }

  createSteps(BuildContext context) {
    return this.steps = [
      Step(
          title: const Text(
            'Campagin info',
            style: TextStyle(color: Colors.white),
          ),
          isActive: isActive(0),
          state: isComplete(0),
          content: new Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height -
                MediaQuery.of(context).size.height / 4,
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                new Container(
                    width: MediaQuery.of(context).size.width -
                        MediaQuery.of(context).size.width / 3,
                    child: new TextFField(
                      lableTextField: "Owner Name",
                      hintTextField: "Enter The Owner Name",
                      suffixIcons: null,
                      obscureTexts: false,
                      aTextInputType: TextInputType.name,
                      validInput: (value) {
                        if (value.isEmpty) {
                          return "Please Enter Owner Name";
                        }
                        return null;
                      },
                    )),
                new Container(
                    width: MediaQuery.of(context).size.width -
                        MediaQuery.of(context).size.width / 3,
                    child: new TextFField(
                      lableTextField: "Project Name",
                      hintTextField: "Enter The Project Name",
                      suffixIcons: null,
                      obscureTexts: false,
                      aTextInputType: TextInputType.name,
                      validInput: (value) {
                        if (value.isEmpty) {
                          return "Please Enter Project Name";
                        }
                        return null;
                      },
                    )),
                new Container(
                    width: MediaQuery.of(context).size.width -
                        MediaQuery.of(context).size.width / 3,
                    child: new TextFField(
                      lableTextField: "Campagin Discription",
                      hintTextField: "Enter The Campagin Discription",
                      suffixIcons: null,
                      maxLine: 8,
                      minLine: 100,
                      aTextInputType: TextInputType.multiline,
                      obscureTexts: false,
                      validInput: (value) {
                        if (value.isEmpty) {
                          return "Please Enter Campagin Discription";
                        }
                        return null;
                      },
                    )),
                new Container(
                    width: MediaQuery.of(context).size.width -
                        MediaQuery.of(context).size.width / 3,
                    child: new TextFField(
                      lableTextField: "City",
                      hintTextField: "Enter The City",
                      suffixIcons: null,
                      obscureTexts: false,
                      validInput: (value) {
                        if (value.isEmpty) {
                          return "Please Enter City";
                        }
                        return null;
                      },
                    )),
              ],
            ),
            decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).primaryColorLight),
          )),
      Step(
          isActive: isActive(1),
          state: isComplete(1),
          title: const Text(
            'Goals',
            style: TextStyle(color: Colors.white),
          ),
          content: new Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height -
                MediaQuery.of(context).size.height / 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                new Container(
                    width: MediaQuery.of(context).size.width -
                        MediaQuery.of(context).size.width / 3,
                    child: new TextFField(
                      lableTextField: "Campagin Days",
                      hintTextField: "Enter The Campagin Days",
                      suffixIcons: null,
                      obscureTexts: false,
                      aTextInputType: TextInputType.number,
                      validInput: (value) {
                        if (value.isEmpty) {
                          return "Please Enter Campagin Days";
                        }
                        return null;
                      },
                    )),
                new Container(
                    width: MediaQuery.of(context).size.width -
                        MediaQuery.of(context).size.width / 3,
                    child: new TextFField(
                      lableTextField: "Goal Amount",
                      hintTextField: "Enter The Goal Amount",
                      suffixIcons: null,
                      obscureTexts: false,
                      aTextInputType: TextInputType.number,
                      validInput: (value) {
                        if (value.isEmpty) {
                          return "Please Enter Goal Amount";
                        }
                        return null;
                      },
                    )),
                new Container(
                    width: MediaQuery.of(context).size.width -
                        MediaQuery.of(context).size.width / 3,
                    child: new TextFField(
                      lableTextField: "Goal Amount",
                      hintTextField: "Enter The Goal Amount",
                      suffixIcons: null,
                      obscureTexts: false,
                      aTextInputType: TextInputType.number,
                      validInput: (value) {
                        if (value.isEmpty) {
                          return "Please Enter Goal Amount";
                        }
                        return null;
                      },
                    )),
                new Container(
                    width: MediaQuery.of(context).size.width -
                        MediaQuery.of(context).size.width / 3,
                    child: new TextFField(
                      lableTextField: "Sub Category",
                      hintTextField: "Enter The Sub Category",
                      suffixIcons: null,
                      obscureTexts: false,
                      aTextInputType: TextInputType.number,
                      validInput: (value) {
                        if (value.isEmpty) {
                          return "Please Enter Sub Category";
                        }
                        return null;
                      },
                    )),
              ],
            ),
            decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).primaryColorLight),
          )),
      Step(
          state: isComplete(2),
          isActive: isActive(2),
          title: const Text('Documents', style: TextStyle(color: Colors.white)),
          content: new Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).size.height / 2,
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: [
                  new Align(
                      alignment: Alignment.topLeft,
                      child: new Text("Upload Photos")),
                  new Container(
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            new Container(
                              width: 20,
                              child: new Icon(Icons.person),
                            ),
                            new Container(
                              width: 20,
                              child: new Icon(Icons.person),
                            ),
                            new Container(
                              width: 20,
                              child: new Icon(Icons.person),
                            )
                          ],
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            new Container(
                              width: 20,
                              child: new Icon(Icons.person),
                            ),
                            new Container(
                              width: 20,
                              child: new Icon(Icons.person),
                            ),
                            new Container(
                              width: 20,
                              color: Colors.white,
                              child: new Icon(Icons.person),
                            )
                          ],
                        )
                      ],
                    ),
                    width: MediaQuery.of(context).size.width -
                        MediaQuery.of(context).size.width / 4,
                    decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).primaryColorLight),
                  ),
                  new Divider(
                    thickness: 5,
                  ),
                  new Align(
                      alignment: Alignment.topLeft,
                      child: new Text("Upload Documents")),
                  new Container(
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            new Container(
                              child: new Icon(Icons.person),
                            ),
                            new Container(
                              child: new Icon(Icons.person),
                            ),
                            new Container(
                              child: new Icon(Icons.person),
                            )
                          ],
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            new Container(
                              child: new Icon(Icons.person),
                            ),
                            new Container(
                              child: new Icon(Icons.person),
                            ),
                            new Container(
                              child: new Icon(Icons.person),
                            )
                          ],
                        )
                      ],
                    ),
                    width: MediaQuery.of(context).size.width -
                        MediaQuery.of(context).size.width / 4,
                    decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).primaryColorLight),
                  ),
                ],
              )))
    ];
  }

  List<Step> steps;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Fundraise"),
        ),
        body: Theme(
            data: ThemeData(
                canvasColor: Theme.of(context).scaffoldBackgroundColor),
            child: Column(children: <Widget>[
              Expanded(
                child: Stepper(
                  steps: createSteps(context),
                  type: StepperType.horizontal,
                  currentStep: currentStep,
                  onStepContinue: next,
                  onStepCancel: cancel,
                ),
              ),
            ])));
  }
}
