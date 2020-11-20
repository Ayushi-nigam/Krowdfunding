class EventModel {
  String ownerName;
  String projectName;
  String campaginDiscription;
  int campaginDays;
  int goalAmount;
  String category;

  EventModel() {
    ownerName = "";
    projectName = "";
    campaginDiscription = "";
    campaginDays = 0;
    goalAmount = 0;
    category = '';
  }
  EventModel.fromJson(Map<String, dynamic> json)
      : ownerName = json['ownerName'],
        projectName = json['projectName'],
        campaginDiscription = json['campaginDiscription'],
        campaginDays = json['campaginDays'],
        goalAmount = json['goalAmount'],
        category = json['category'];


  Map<String, dynamic> toJson() => {
        'ownerName': this.ownerName,
        'projectName': this.projectName,
        'campaginDiscription': this.campaginDiscription,
        'campaginDays': this.campaginDays,
        'goalAmount': this.goalAmount,
        'category': this.category
      };
}
