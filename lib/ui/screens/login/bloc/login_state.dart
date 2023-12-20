part of 'login_bloc.dart';

class LoginState extends Equatable {
  final bool isLoggedIn;
  final String errorMsg;
  final bool isLoading;
  final bool isShowPassword;

  const LoginState({
    required this.isLoggedIn,
    required this.errorMsg,
    required this.isLoading,
    required this.isShowPassword,
  });

  factory LoginState.initial() => const LoginState(
        isLoggedIn: false,
        errorMsg: "",
        isLoading: false,
        isShowPassword: false,
      );

  LoginState copyWith({
    bool? isLoggedIn,
    String? errorMsg,
    bool? isLoading,
    bool? isShowPassword,
  }) {
    return LoginState(
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      errorMsg: errorMsg ?? this.errorMsg,
      isLoading: isLoading ?? this.isLoading,
      isShowPassword: isShowPassword ?? this.isShowPassword,
    );
  }

  @override
  List<Object?> get props => [isLoggedIn, errorMsg, isLoading, isShowPassword];
}

// class LoginInitial extends LoginState {
//   @override
//   List<Object> get props => [];
// }
//
// class LoginSuccessState extends LoginState {
//   @override
//   List<Object> get props => [];
// }
//
// class LoginErrorState extends LoginState {
//   final String message;
//
//   const LoginErrorState({required this.message});
//
//   @override
//   List<Object> get props => [message];
// }
//
// class LoginLoadingState extends LoginState {
//   @override
//   List<Object> get props => [];
// }
//
// class LoginShowPasswordState extends LoginState {
//   final bool obscureText;
//
//   const LoginShowPasswordState({required this.obscureText});
//
//   @override
//   List<Object> get props => [obscureText];
// }
