class users {

  String? email;
  String? password;

  users();

  users.fromJSON(Map<String, dynamic> jsonMap){
    email = jsonMap['email'] != null ? jsonMap.toString() : "";
    password = jsonMap['password'] != null ? jsonMap.toString() : "";
  }

  Map toMap(){
    var map = new Map<String, dynamic>();

    map["email"] = email;
    map["password"] = password;

    return map;
  }
}