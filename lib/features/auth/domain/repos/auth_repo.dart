import 'package:fpdart/fpdart.dart';
import '../../../../core/error/app_failure.dart';
import '../entities/current_user_entity.dart';

abstract class AuthRepo {
  Future<Either<AppFailure, CurrentUserEntity>> signInWithGoogle();
  Future<void> signOut();
  Future<CurrentUserEntity?> checkAuthState();
}
