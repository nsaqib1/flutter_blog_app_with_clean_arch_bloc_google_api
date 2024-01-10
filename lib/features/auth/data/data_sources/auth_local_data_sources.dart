import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/features/auth/data/models/current_user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/app_exceptions.dart';

abstract class AuthLocalDataSources {
  Future<bool> saveCurrrentUser(CurrentUserModel model);
  CurrentUserModel getCurrentUser();
}

class AuthLocalDataSourcesImpl implements AuthLocalDataSources {
  final SharedPreferences _sharedPreferences;

  AuthLocalDataSourcesImpl({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  @override
  CurrentUserModel getCurrentUser() {
    final user = _sharedPreferences.getString("currentUser");
    if (user == null) {
      throw AuthException(errorMessage: "Could not get user data");
    }

    return CurrentUserModel.fromJsonString(user);
  }

  @override
  Future<bool> saveCurrrentUser(CurrentUserModel model) async {
    return await _sharedPreferences.setString(
      "currentUser",
      model.toJsonString(),
    );
  }
}
