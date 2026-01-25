import 'package:dio/dio.dart';
import 'package:e_commerce_learning_app/core/auth/sign_up/sign_up_model.dart';
import 'package:e_commerce_learning_app/core/local_storage_service.dart';
import 'package:e_commerce_learning_app/core/auth/login/login_model.dart';
import 'package:e_commerce_learning_app/core/auth/login/user_model.dart';
import 'package:e_commerce_learning_app/core/network/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepoProvider = Provider<AuthRepo>((ref) {
  return AuthRepo(
    dio: ref.read(dioProvider),
    localStorageService: ref.read(localstorageServiceProvider),
  );
});

class AuthRepo {
  final Dio dio;

  final LocalStorageService localStorageService;

  AuthRepo({required this.dio, required this.localStorageService});

  Future<UserModel> singUp(SignUpModel model) async {
    try {
      final res = await dio.post('/signup', data: model.toJson());

      final user = UserModel.fromJson(res.data['customer'] ?? res.data);

      localStorageService.saveUser(user);

      // return UserModel.fromJson(res.data);
      return user;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<UserModel> login(LoginModel loginModel) async {
    final res = await dio.post('/login', data: loginModel.toJson());
    final user = UserModel.fromJson(res.data['customer']);

    localStorageService.saveUser(user);

    return user;
  }

  Future<void> logout() async {
    localStorageService.removeUser();
  }

  UserModel? get getUser => localStorageService.getUser();
}
