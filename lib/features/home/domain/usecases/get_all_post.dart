import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/core/error/app_failure.dart';
import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/features/home/domain/entities/post_entity.dart';
import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/features/home/domain/repos/home_repo.dart';
import 'package:fpdart/fpdart.dart';

class GetAllPosts {
  final HomeRepo _reop;
  GetAllPosts({required HomeRepo repo}) : _reop = repo;

  Future<Either<AppFailure, List<PostEntity>>> execute(String url) async {
    return await _reop.getAllPost(url);
  }
}
