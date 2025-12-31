class SignUpModel {
  String username;
  String password;

  SignUpModel(this.username, this.password);

  Map<String, dynamic> toJson() {
    return {'email': username , 'password': password};
  }
}
