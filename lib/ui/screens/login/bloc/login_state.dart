part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginSuccessState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginErrorState extends LoginState {
  final String message;

  const LoginErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

class LoginLoadingState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginShowPasswordState extends LoginState {
  final bool obscureText;

  const LoginShowPasswordState({required this.obscureText});

  @override
  List<Object> get props => [obscureText];
}
