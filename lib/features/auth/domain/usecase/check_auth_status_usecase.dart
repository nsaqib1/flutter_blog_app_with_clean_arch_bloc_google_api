import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/features/auth/domain/entities/current_user_entity.dart';
import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/features/auth/domain/repos/auth_repo.dart';

class CheckAuthStatusUsecase {
  final AuthRepo _repo;
  CheckAuthStatusUsecase({required AuthRepo repo}) : _repo = repo;

  Future<CurrentUserEntity?> execute() async {
    return await _repo.checkAuthState();
  }
}
