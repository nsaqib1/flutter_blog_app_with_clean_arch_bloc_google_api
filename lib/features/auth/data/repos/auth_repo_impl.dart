import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/core/error/app_exceptions.dart';
import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/features/auth/data/data_sources/auth_local_data_sources.dart';
import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/features/auth/data/models/current_user_model.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/app_failure.dart';
import '../../domain/entities/current_user_entity.dart';
import '../../domain/repos/auth_repo.dart';
import '../data_sources/auth_remote_data_sources.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSources _localDataSources;

  AuthRepoImpl({
    required AuthRemoteDataSource remoteDataSource,
    required AuthLocalDataSources localDataSources,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSources = localDataSources;

  @override
  Future<Either<AppFailure, CurrentUserEntity>> signInWithGoogle() async {
    try {
      final response = await _remoteDataSource.signInWithGoogle();
      await _localDataSources.saveCurrrentUser(response);
      return Right(response);
    } on AppExceptions catch (e) {
      return Left(AppFailure(message: e.errorMessage));
    }
  }

  @override
  Future<CurrentUserModel?> checkAuthState() async {
    final bool authState = await _remoteDataSource.checkAuthState();
    if (authState) {
      try {
        return await _localDataSources.getCurrentUser();
      } on AppExceptions catch (e) {
        print(e.type);
        print(e.errorMessage);
      }
    }

    return null;
  }

  @override
  Future<void> signOut() async {
    await _remoteDataSource.signOut();
  }
}
