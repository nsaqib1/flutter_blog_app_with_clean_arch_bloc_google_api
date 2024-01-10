import 'dart:convert';

import 'package:google_sign_in/google_sign_in.dart';

import '../../domain/entities/current_user_entity.dart';

class CurrentUserModel extends CurrentUserEntity {
  CurrentUserModel({
    required super.name,
    required super.avatarUrl,
    required super.token,
  });

  static Future<CurrentUserModel> fromGoogleSignInAccount(GoogleSignInAccount account) async {
    final token = await account.authHeaders;
    return CurrentUserModel(
      name: account.displayName,
      avatarUrl: account.photoUrl,
      token: token,
    );
  }

  String toJsonString() {
    return jsonEncode({
      "name": name,
      "avatarUrl": avatarUrl,
      "token": token,
    });
  }

  factory CurrentUserModel.fromJsonString(String value) {
    final Map<String, dynamic> json = jsonDecode(value);
    return CurrentUserModel(
      name: json["name"],
      avatarUrl: json["avatarUrl"],
      token: json["token"],
    );
  }
}
