import 'package:e_commerce_learning_app/core/auth/controller/auth_controller.dart';
import 'package:e_commerce_learning_app/core/auth/sign_up/sign_up_model.dart';
import 'package:e_commerce_learning_app/core/auth/sign_up/sing_up_status.dart';
import 'package:e_commerce_learning_app/core/repo/auth_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signUpControllerProvider =
    NotifierProvider<SignUpController, SignUpState>(SignUpController.new);

class SignUpController extends Notifier<SignUpState> {
  @override
  SignUpState build() {
    return SignUpState();
  }

  Future<void> signUp(SignUpModel model) async {
    state = state.copyWith(isLoading: true, error: null, isSuccess: true);

    try {
      await ref.read(authRepoProvider).singUp(model);

      ref.invalidate(authControllerProvider);

      state = state.copyWith(isLoading: false, isSuccess: true);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
        isSuccess: false,
      );
    }
  }
}
