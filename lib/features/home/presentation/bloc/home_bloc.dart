import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/core/error/app_failure.dart';
import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/features/home/domain/entities/post_entity.dart';
import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/features/home/domain/usecases/get_all_post.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetAllPosts _getAllPosts;
  HomeBloc({required GetAllPosts getAllPosts})
      : _getAllPosts = getAllPosts,
        super(HomeInitial()) {
    on<HomeGetAllPostEvent>(homeGetAllPostEvent);
  }

  FutureOr<void> homeGetAllPostEvent(event, emit) async {
    emit(HomePostLoadInProgressState());
    final response = await _getAllPosts.execute("https://www.googleapis.com/blogger/v3/blogs/2399953/posts");
    response.fold(
      (l) => emit(HomePostLoadFailedState(failure: l)),
      (r) => emit(HomePostLoadSuccessState(posts: r)),
    );
  }
}
