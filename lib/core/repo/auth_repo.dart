import 'package:dio/dio.dart';
import 'package:e_commerce_learning_app/core/local_storage_service.dart';
import 'package:e_commerce_learning_app/login/login_model.dart';
import 'package:e_commerce_learning_app/login/user_model.dart';

class AuthRepo {
  final Dio dio;

final LocalStorageService localStorageService;

  AuthRepo({required this.dio, required this.localStorageService});

  Future<UserModel> login(LoginModel loginModel) async {
    final res = await dio.post('/login', data: loginModel.toJson());

    final user =  UserModel.fromJson(res.data['customer']);

    localStorageService.saveUser(user);

    return user;
  }
}
