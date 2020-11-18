class User {
  String firstName;
  String lastName;
  String mobileNumber;
  String emailId;
  String password;

  User() {
    firstName = "";
    lastName = "";
    mobileNumber = "";
    emailId = "";
    password = "";
  }
  Map<String, dynamic> toJson() => {
        'firstName': this.firstName,
        'lastName': this.lastName,
        'mobileNumber': this.mobileNumber,
        'emailId': this.emailId,
        'password': this.password
      };
}
