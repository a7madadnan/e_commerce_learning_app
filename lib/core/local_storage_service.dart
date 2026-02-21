import 'dart:convert';

import 'package:e_commerce_learning_app/core/dependencies_injection.dart';
import 'package:e_commerce_learning_app/core/model/user_model.dart';
import 'package:riverpod/riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final localstorageServiceProvider = Provider(
  (ref) => LocalStorageService(
    sharedPreferences: ref.read(sharedPreferenceProvider).requireValue,
  ),
);

class LocalStorageService {
  final SharedPreferences sharedPreferences;

  LocalStorageService({required this.sharedPreferences});

  void saveUser(UserModel userModel) {
    /// حتى نخزن داتا داخل الذاكرة الداخلية لازم نحول المودل الى json
    /// لانه الذاكرة الداخلية تخزن فقط البيانات
    sharedPreferences.setString('user', jsonEncode(userModel.toJson()));
  }

  UserModel? getUser() {
    final String? userJson = sharedPreferences.getString('user');
    if (userJson == null) {
      return null;
    }
    return UserModel.fromJson(jsonDecode(userJson));
  }

  void removeUser() {
    sharedPreferences.remove('user');
  }
}
