import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/core/error/app_failure.dart';
import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/features/home/domain/entities/post_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract class HomeRepo {
  Future<Either<AppFailure, List<PostEntity>>> getAllPost(String url);
}
