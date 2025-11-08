class SignUpModel {
  String email;
  String password;

  SignUpModel(this.email, this.password);

  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password};
  }
}
