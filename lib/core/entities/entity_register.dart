class EntityRegister {
  String? username;
  String? email;
  String? password;
  String? token;
  int? id;

  EntityRegister({this.username, this.email, this.password, this.token, this.id});

  EntityRegister.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    password = json['password'];
    token = json['token'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['username'] = username;
    data['email'] = email;
    data['password'] = password;
    data['token'] = token;
    data['id'] = id;
    return data;
  }
}