import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/core/network/network_caller.dart';
import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/features/auth/data/data_sources/auth_local_data_sources.dart';
import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/features/auth/data/data_sources/auth_remote_data_sources.dart';
import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/features/auth/data/repos/auth_repo_impl.dart';
import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/features/auth/domain/repos/auth_repo.dart';
import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/features/auth/domain/usecase/check_auth_status_usecase.dart';
import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/features/auth/domain/usecase/sign_in_with_google_usecase.dart';
import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/features/auth/domain/usecase/sign_out_usecase.dart';
import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/features/home/data/repos/home_repo_impl.dart';
import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/features/home/domain/repos/home_repo.dart';
import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/features/home/domain/usecases/get_all_post.dart';
import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/features/home/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/home/presentation/blocs/post_bloc/post_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Feature - Home
  // Blocs
  sl.registerFactory<PostBloc>(() => PostBloc(getAllPosts: sl()));
  sl.registerFactory<AuthBloc>(
    () => AuthBloc(
      signInWithGoogleUsecase: sl(),
      checkAuthStatusUsecase: sl(),
      signOutUsecase: sl(),
    ),
  );

  // Usecases
  sl.registerLazySingleton<GetAllPosts>(() => GetAllPosts(repo: sl()));

  // Repos
  sl.registerLazySingleton<HomeRepo>(() => HomeRepoImpl(dataSource: sl()));

  // Data Sources
  sl.registerLazySingleton<HomeRemoteDataSource>(() => HomeRemoteDataSourceImpl(networkCaller: sl()));

  //! Feature - Auth
  // Usecases
  sl.registerLazySingleton<SignInWithGoogleUsecase>(() => SignInWithGoogleUsecase(repo: sl()));
  sl.registerLazySingleton<CheckAuthStatusUsecase>(() => CheckAuthStatusUsecase(repo: sl()));
  sl.registerLazySingleton<SignOutUsecase>(() => SignOutUsecase(repo: sl()));

  // Repos
  sl.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(remoteDataSource: sl(), localDataSources: sl()));

  // Data Sources
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(googleSignIn: sl()));
  sl.registerLazySingleton<AuthLocalDataSources>(() => AuthLocalDataSourcesImpl(sharedPreferences: sl()));

  //! Core
  sl.registerLazySingleton<NetworkCaller>(() => NetworkCaller());

  //! External
  // Google Sign In
  sl.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn());

  // Local Database
  final prefs = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => prefs);
}
