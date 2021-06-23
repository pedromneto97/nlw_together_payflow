part of 'auth_bloc.dart';

@immutable
abstract class AuthState {
  const AuthState();
}

class InitialAuthState extends AuthState {
  const InitialAuthState();
}

class InProgressAuthState extends AuthState {
  const InProgressAuthState();
}

class SuccessAuthState extends AuthState {
  final User user;

  const SuccessAuthState({
    required this.user,
  });

  Map<String, dynamic> toMap() => {
        'user': user.toMap(),
      };
}
