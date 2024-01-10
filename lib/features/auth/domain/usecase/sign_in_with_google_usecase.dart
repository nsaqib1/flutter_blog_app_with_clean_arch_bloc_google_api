import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/core/error/app_failure.dart';
import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/features/auth/domain/entities/current_user_entity.dart';
import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/features/auth/domain/repos/auth_repo.dart';
import 'package:fpdart/fpdart.dart';

class SignInWithGoogleUsecase {
  final AuthRepo _repo;
  SignInWithGoogleUsecase({required AuthRepo repo}) : _repo = repo;

  Future<Either<AppFailure, CurrentUserEntity>> execute() async {
    return await _repo.signInWithGoogle();
  }
}
