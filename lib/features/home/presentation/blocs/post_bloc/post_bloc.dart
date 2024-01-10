import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/core/error/app_failure.dart';
import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/features/home/domain/entities/post_entity.dart';
import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/features/home/domain/usecases/get_all_post.dart';
import 'package:meta/meta.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final GetAllPosts _getAllPosts;
  PostBloc({required GetAllPosts getAllPosts})
      : _getAllPosts = getAllPosts,
        super(PostInitial()) {
    on<PostGetAllPostEvent>(homeGetAllPostEvent);
  }

  FutureOr<void> homeGetAllPostEvent(event, emit) async {
    emit(PostLoadInProgressState());
    final response = await _getAllPosts.execute("https://www.googleapis.com/blogger/v3/blogs/3206430660214608075/posts");
    response.fold(
      (l) => emit(PostLoadFailedState(failure: l)),
      (r) => emit(PostLoadSuccessState(posts: r)),
    );
  }
}
