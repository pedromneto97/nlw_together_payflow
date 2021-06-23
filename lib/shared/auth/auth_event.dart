part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {
  const AuthEvent();
}

class AuthLoginEvent extends AuthEvent {
  const AuthLoginEvent();
}

class AuthLogoutEvent extends AuthEvent {
  const AuthLogoutEvent();
}
