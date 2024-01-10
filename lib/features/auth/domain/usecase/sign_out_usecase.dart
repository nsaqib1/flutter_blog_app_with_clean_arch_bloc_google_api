import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/features/auth/domain/repos/auth_repo.dart';

class SignOutUsecase {
  final AuthRepo _repo;
  SignOutUsecase({required AuthRepo repo}) : _repo = repo;

  Future<void> execute() async {
    return await _repo.signOut();
  }
}
