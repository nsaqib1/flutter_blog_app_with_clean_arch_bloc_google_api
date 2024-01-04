part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomePostLoadInProgressState extends HomeState {}

final class HomePostLoadSuccessState extends HomeState {
  final List<PostEntity> _posts;
  List<PostEntity> get posts => _posts;

  HomePostLoadSuccessState({
    required List<PostEntity> posts,
  }) : _posts = posts;
}

final class HomePostLoadFailedState extends HomeState {
  final AppFailure failure;

  HomePostLoadFailedState({required this.failure});
}
