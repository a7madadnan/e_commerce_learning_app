import 'dart:developer';

import 'package:dio/dio.dart';
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

  Future<UserModel> login(LoginModel loginModel) async {
    final res = await dio.post('/login', data: loginModel.toJson());

    final user = UserModel.fromJson(res.data['customer']);
    log('cccccc ${user.toJson()}');

    localStorageService.saveUser(user);

    return user;
  }

UserModel? get getUser => localStorageService.getUser();
  
}
