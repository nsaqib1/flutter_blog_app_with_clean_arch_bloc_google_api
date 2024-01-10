part of 'post_bloc.dart';

@immutable
sealed class PostState {}

final class PostInitial extends PostState {}

final class PostLoadInProgressState extends PostState {}

final class PostLoadSuccessState extends PostState {
  final List<PostEntity> _posts;
  List<PostEntity> get posts => _posts;

  PostLoadSuccessState({
    required List<PostEntity> posts,
  }) : _posts = posts;
}

final class PostLoadFailedState extends PostState {
  final AppFailure failure;

  PostLoadFailedState({required this.failure});
}
