import 'package:e_commerce_learning_app/core/auth/login/login_model.dart';
import 'package:e_commerce_learning_app/core/auth/login/user_model.dart';
import 'package:e_commerce_learning_app/core/auth/sign_up/sign_up_model.dart';
import 'package:e_commerce_learning_app/core/repo/auth_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// المسؤول الرئيسي عن حاله المستخدم
final authControllerProvider = NotifierProvider<AuthController, UserModel?>(
  AuthController.new,
);

// المسؤول عن حفظ حاله المستخدم
// اذا المستخدم سجل بياناته يخزنهن اذا لا يكول null
class AuthController extends Notifier<UserModel?> {
  @override
  // الbuild معناها كل مايشتغل التطبيق روح جيك معلومات اليورز محفزظ بالريبو
  // وهي مسؤولة عن إرجاع الحالة الابتدائية (initial state).
  UserModel? build() {
    // اقرأ من authRepo → هل يوجد مستخدم محفوظ سابقًا
    return ref.read(authRepoProvider).getUser;
    // return null ;
  }

  Future<void> login(LoginModel loginModel) async {
    await ref.read(authRepoProvider).login(loginModel);
    ref.invalidateSelf();
  }

  Future<void> signUp(SignUpModel signUpModel) async {
    await ref.read(authRepoProvider).singUp(signUpModel);
    ref.invalidateSelf();
  }

  Future<void> logout() async {
    await ref.read(authRepoProvider).logout();
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
