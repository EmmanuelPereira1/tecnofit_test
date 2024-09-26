class EntityLogin {
  String? username;
  String? email;
  String? password;
  String? token;

  EntityLogin({this.username, this.email, this.password, this.token});

  EntityLogin.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    password = json['password'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['username'] = username;
    data['email'] = email;
    data['password'] = password;
    data['token'] = token;
    return data;
  }
}