class EventModel {
  String ownerName;
  String projectName;
  String campaginDiscription;
  int campaginDays;
  int goalAmount;
  String category;
  String createdDate;
  String pictureLocation;
  String userId;

  EventModel() {
    ownerName = "";
    projectName = "";
    campaginDiscription = "";
    campaginDays = 0;
    goalAmount = 0;
    category = '';
    createdDate = '';
    pictureLocation = "";
    userId = "";
  }
  EventModel.fromJson(Map<String, dynamic> json)
      : ownerName = json['ownerName'],
        projectName = json['projectName'],
        campaginDiscription = json['campaginDiscription'],
        campaginDays = json['campaginDays'],
        goalAmount = json['goalAmount'],
        category = json['category'],
        createdDate = json['createdDate'],
        userId = json['userId'];

  Map<String, dynamic> toJson() => {
        'ownerName': this.ownerName,
        'projectName': this.projectName,
        'campaginDiscription': this.campaginDiscription,
        'createdDate': this.createdDate,
        'goalAmount': this.goalAmount,
        'category': this.category,
        'campaginDays': this.campaginDays,
        'userId': this.userId
      };
}
