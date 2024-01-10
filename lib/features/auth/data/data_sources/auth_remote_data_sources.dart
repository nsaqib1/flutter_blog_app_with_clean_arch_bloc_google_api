import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/core/error/app_exceptions.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/current_user_model.dart';

abstract class AuthRemoteDataSource {
  Future<CurrentUserModel> signInWithGoogle();
  Future<void> signOut();
  Future<bool> checkAuthState();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final GoogleSignIn _googleSignIn;

  AuthRemoteDataSourceImpl({
    required GoogleSignIn googleSignIn,
  }) : _googleSignIn = googleSignIn;

  @override
  Future<CurrentUserModel> signInWithGoogle() async {
    try {
      final response = await _googleSignIn.signIn();
      if (response == null) {
        throw AuthException(errorMessage: "Sign in process was aborted");
      }

      return CurrentUserModel.fromGoogleSignInAccount(response);
    } catch (e) {
      throw AuthException(errorMessage: "An error occured during sign in");
    }
  }

  @override
  Future<void> signOut() async {
    await _googleSignIn.signOut();
  }

  @override
  Future<bool> checkAuthState() async {
    return await _googleSignIn.isSignedIn();
  }
}
