import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/core/error/app_exceptions.dart';
import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/core/error/app_failure.dart';
import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/features/home/domain/entities/post_entity.dart';
import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/features/home/domain/repos/home_repo.dart';
import 'package:fpdart/fpdart.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource _dataSource;
  HomeRepoImpl({
    required HomeRemoteDataSource dataSource,
  }) : _dataSource = dataSource;

  @override
  Future<Either<AppFailure, List<PostEntity>>> getAllPost(String url) async {
    try {
      final listOfPosts = await _dataSource.getAllPosts(url);
      return Right(listOfPosts);
    } on AppExceptions catch (e) {
      return Left(AppFailure(message: e.errorMessage));
    }
  }
}
