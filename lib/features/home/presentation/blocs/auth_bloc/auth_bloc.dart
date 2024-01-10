import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/core/error/app_failure.dart';
import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/features/auth/domain/entities/current_user_entity.dart';
import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/features/auth/domain/usecase/check_auth_status_usecase.dart';
import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/features/auth/domain/usecase/sign_in_with_google_usecase.dart';
import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/features/auth/domain/usecase/sign_out_usecase.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInWithGoogleUsecase _signInWithGoogleUsecase;
  final CheckAuthStatusUsecase _checkAuthStatusUsecase;
  final SignOutUsecase _signOutUsecase;
  AuthBloc({
    required SignInWithGoogleUsecase signInWithGoogleUsecase,
    required CheckAuthStatusUsecase checkAuthStatusUsecase,
    required SignOutUsecase signOutUsecase,
  })  : _checkAuthStatusUsecase = checkAuthStatusUsecase,
        _signInWithGoogleUsecase = signInWithGoogleUsecase,
        _signOutUsecase = signOutUsecase,
        super(AuthInitial()) {
    on<SignInEvent>(signInEvent);
    on<CheckAuthStatusEvent>(checkAuthStatusEvent);
    on<SignOutEvent>(signOutEvent);
  }

  FutureOr<void> signInEvent(SignInEvent event, Emitter<AuthState> emit) async {
    emit(AuthInProgress());
    final response = await _signInWithGoogleUsecase.execute();
    response.fold(
      (l) => emit(AuthFailureState(appFailure: l)),
      (r) => emit(
        AuthSuccessTrueState(currentUserEntity: r),
      ),
    );
  }

  FutureOr<void> checkAuthStatusEvent(CheckAuthStatusEvent event, Emitter<AuthState> emit) async {
    final user = await _checkAuthStatusUsecase.execute();
    if (user == null) {
      emit(AuthSuccessFalseState());
    } else {
      emit(AuthSuccessTrueState(currentUserEntity: user));
    }
  }

  FutureOr<void> signOutEvent(SignOutEvent event, Emitter<AuthState> emit) async {
    await _signOutUsecase.execute();
    emit(AuthSuccessFalseState());
  }
}
