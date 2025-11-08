class UserModel {
  final int id;
  final String name;
  final String username;
  final String email;
  final String joinDate;
  final String phone;
  final int billingAddressId;
  final int shippingAddressId;
  final String avatar;
  final String password;

  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.joinDate,
    required this.phone,
    required this.billingAddressId,
    required this.shippingAddressId,
    required this.avatar,
    required this.password,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json['id'],
    name: json['name'],
    username: json['username'],
    email: json['email'],
    joinDate: json['joinDate'],
    phone: json['phone'],
    billingAddressId: json['billingAddressId'],
    shippingAddressId: json['shippingAddressId'],
    avatar: json['avatar'],
    password: json['password'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'username': username,
    'email': email,
    'joinDate': joinDate,
    'phone': phone,
    'billingAddressId': billingAddressId,
    'shippingAddressId': shippingAddressId,
    'avatar': avatar,
    'password': password,
  };
}
