import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/core/error/app_exceptions.dart';
import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/core/network/network_caller.dart';
import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/core/network/network_response.dart';
import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/features/home/data/models/post_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<PostModel>> getAllPosts(String url);
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final NetworkCaller _networkCaller;
  HomeRemoteDataSourceImpl({
    required NetworkCaller networkCaller,
  }) : _networkCaller = networkCaller;

  @override
  Future<List<PostModel>> getAllPosts(String url) async {
    final NetworkResponse response = await _networkCaller.getRequest(url);
    if (response.isSuccess) {
      try {
        final List<dynamic> list = response.response["items"];

        final postModelList = list.map((e) => PostModel.fromJson(e)).toList();
        return postModelList;
      } catch (e) {
        throw JsonToModelConversionException(errorMessage: "post model conversion failed!");
      }
    } else {
      throw NetworkRequestUnsuccessful(errorMessage: response.errorMessage!);
    }
  }
}
