import 'dart:async';
import 'dart:developer';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

import '../models/user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends HydratedBloc<AuthEvent, AuthState> {
  AuthBloc() : super(const InitialAuthState());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AuthLoginEvent) {
      yield const InProgressAuthState();
      GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: ['email'],
      );
      try {
        final response = await _googleSignIn.signIn();
        log(response.toString(), name: 'LOG');

        if (response != null) {
          final user = User(
            name: response.displayName ?? '',
            email: response.email,
            id: response.id,
            photoUrl: response.photoUrl ?? '',
          );
          yield SuccessAuthState(user: user);
        } else {
          yield const InitialAuthState();
        }
      } catch (e, s) {
        log('Ocorreu um erro', error: e, stackTrace: s, name: 'ERROR');
        yield const InitialAuthState();
      }
    }
  }

  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    if (json.isNotEmpty && json.containsKey('user')) {
      return SuccessAuthState(
        user: User.fromMap(
          json['user'],
        ),
      );
    }
    return null;
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    if (state is SuccessAuthState) {
      return state.toMap();
    }
    return null;
  }
}
