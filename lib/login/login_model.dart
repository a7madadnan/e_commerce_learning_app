class LoginModel {
  String userName;
  String password;
  LoginModel(this.userName, this.password);

  Map<String, dynamic> toJson() {
    return {'username': userName, 'password': password};
  }
}
