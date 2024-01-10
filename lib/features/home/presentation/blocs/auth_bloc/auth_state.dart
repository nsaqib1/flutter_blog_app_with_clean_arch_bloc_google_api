part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

@immutable
sealed class AuthActionState extends AuthState {}

final class AuthInitial extends AuthState {}

final class AuthInProgress extends AuthState {}

final class AuthSuccessTrueState extends AuthState {
  final CurrentUserEntity currentUserEntity;
  AuthSuccessTrueState({required this.currentUserEntity});
}

final class AuthSuccessFalseState extends AuthState {}

final class AuthFailureState extends AuthState {
  final AppFailure appFailure;
  AuthFailureState({required this.appFailure});
}
