import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/core/network/network_caller.dart';
import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/features/home/data/repos/home_repo_impl.dart';
import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/features/home/domain/repos/home_repo.dart';
import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/features/home/domain/usecases/get_all_post.dart';
import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/features/home/presentation/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Feature - Home
  // Blocs
  sl.registerFactory<HomeBloc>(() => HomeBloc(getAllPosts: sl()));

  // Usecases
  sl.registerLazySingleton<GetAllPosts>(() => GetAllPosts(repo: sl()));

  // Repos
  sl.registerLazySingleton<HomeRepo>(() => HomeRepoImpl(dataSource: sl()));

  // Data Sources
  sl.registerLazySingleton<HomeRemoteDataSource>(() => HomeRemoteDataSourceImpl(networkCaller: sl()));

  //! Core
  sl.registerLazySingleton<NetworkCaller>(() => NetworkCaller());
}
