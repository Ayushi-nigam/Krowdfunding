class TransactionModel{
  String creatorUserId;
  String donorUserId;
  String projectName;
  int donateAmount;
  

  TransactionModel() {
    creatorUserId = "";
    projectName = "";
    donorUserId = "";
    donateAmount=0;
  }
  TransactionModel.fromJson(Map<String, dynamic> json)
      : creatorUserId = json['creatorUserId'],
        projectName = json['projectName'],
        donorUserId = json['donorUserId'],
        donateAmount=json['donateAmount'];

  Map<String, dynamic> toJson() => {
        'donateAmount': this.donateAmount,
        'projectName': this.projectName,
        'donorUserId': this.donorUserId,
        'creatorUserId': this.creatorUserId,
      };
}