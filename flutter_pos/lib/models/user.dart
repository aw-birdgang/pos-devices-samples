class User {
  String? id, pwd;

  User({this.id, this.pwd});

  User.fromJson(Map<dynamic, dynamic> Map) {
    id = Map["id"];
    pwd = Map["pwd"];
  }

  toJson() {
    return {
      'id': id,
      'pwd': pwd,
    };
  }
}