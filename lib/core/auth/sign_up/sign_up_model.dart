class SignUpModel {
  final String username;
  final String password;
  final String name;
  final String email;
  final String phone;
  final String? avatar;
  SignUpModel({
    required this.username,
    required this.password,
    required this.name,
    required this.email,
    required this.phone,
    this.avatar,});

  Map<String, dynamic> toJson() {
    return 
    
    {
      'username': username,
        'password': password,
        'name': name,
        'email': email,
        'phone': phone,
        'avatar': avatar,
    };
  }
}
