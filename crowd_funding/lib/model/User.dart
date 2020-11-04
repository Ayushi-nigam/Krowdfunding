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
        'firstName': firstName,
        'lastName': lastName,
        'mobileNumber': mobileNumber,
        'emailId': emailId,
        'password': password
      };
}
