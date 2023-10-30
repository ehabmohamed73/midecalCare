class UserModel {
  String generatedID = "";
  late String id;
  late String username;
  late String email;
  late String password;

  UserModel(this.id, this.username, this.email, this.password);

  Map<String, dynamic> toMap() {
    return {
      'uid': id,
      'username': username,
      'email': email,
      "password": password,
    };
  }

  fromMap(Map<String, dynamic> map) {
    id = map['id'].toString();
    username = map['username'].toString();
    email = map['email'].toString();
    password = map['password'].toString();
  }

  setGeneratedID(String value) {
    generatedID = value;
  }

  getGeneratedID() {
    return generatedID;
  }
}
