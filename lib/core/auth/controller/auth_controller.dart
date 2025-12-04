import 'package:e_commerce_learning_app/core/auth/login/login_model.dart';
import 'package:e_commerce_learning_app/core/auth/login/user_model.dart';
import 'package:e_commerce_learning_app/core/repo/auth_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authControllerProvider = NotifierProvider<AuthController, UserModel?>(
  AuthController.new,
);

class AuthController extends Notifier<UserModel?> {
  @override
  UserModel? build() {
    return ref.read(authRepoProvider).getUser;
  }

  Future<void> login(LoginModel loginModel) async {
    await ref.read(authRepoProvider).login(loginModel);
    ref.invalidateSelf();
  }
}



final loggedInProvider = Provider((ref) {
  final changeNotifier = ValueNotifier(false);
  ref.listen(authControllerProvider, (pre, next) {
    changeNotifier.value = next != null;
  });

  return changeNotifier;
});
