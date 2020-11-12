import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crowd_funding/app_screens/TextFField.dart';
import 'package:crowd_funding/common/CameraApp.dart';
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
  List<RadioModel> sampleData = new List<RadioModel>();
  @override
  void initState() {
    items.add(DropdownMenuItem(
      child: Text("Bhopal"),
      value: "Bhopal",
    ));
    sampleData.add(new RadioModel(true, 'english'));
    sampleData.add(new RadioModel(false, 'hindi'));
    sampleData.add(new RadioModel(false, 'marathi'));
    sampleData.add(new RadioModel(false, 'odiya'));
    sampleData.add(new RadioModel(false, 'bengali'));
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
          content: new Column(children: [
            new Container(
              height: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width -
                  MediaQuery.of(context).size.width / 4,
              decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).primaryColorLight),
              alignment: Alignment.center,
              child: new Scrollbar(
                  child: new Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    child: new Text("Upload Photos",
                        style: new TextStyle(fontSize: 18)),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height /
                        3, // constrain height
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemCount: sampleData.length,
                      itemBuilder: (context, index) {
                        return new InkWell(
                          onTap: () {
                            setState(() {
                              sampleData.forEach(
                                  (element) => element.isSelected = false);
                              sampleData[index].isSelected = true;
                            });
                          },
                          child: new RadioItem(sampleData[index]),
                        );
                      },
                    ),
                  ),
                  new Align(
                    alignment: Alignment.bottomRight,
                    child: ClipOval(
                      child: Material(
                        color: Theme.of(context).buttonColor, // button color
                        child: InkWell(
                          splashColor: Colors.red, // inkwell color
                          child: SizedBox(
                              width: 56, height: 56, child: Icon(Icons.add)),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => new CameraApp(),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  )
                ],
              )),
            ),
          ]))
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

class RadioItem extends StatelessWidget {
  final RadioModel _item;
  RadioItem(this._item);
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.all(15.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new SizedBox(
            height: 200,
          ),
          new Container(
            child: new Center(
              child: new Icon(Icons.verified_user_sharp),
            ),
            width: MediaQuery.of(context).size.width / 6,
            height: MediaQuery.of(context).size.width / 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: _item.isSelected
                  ? Color.fromARGB(255, 26, 180, 111)
                  : Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}

class RadioModel {
  bool isSelected;
  final String buttonText;

  RadioModel(this.isSelected, this.buttonText);
}
