import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_fake_store_api/core/constants/app_configs.dart';
import 'package:bloc_fake_store_api/core/services/network_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final networkService = NetworkService();

  LoginBloc() : super(LoginInitial()) {
    on<LoginTogglePasswordVisibilityEvent>((event, emit) {
      log(state.runtimeType.toString());

      if (state is LoginShowPasswordState) {
        final currentState = state as LoginShowPasswordState;
        emit(LoginShowPasswordState(obscureText: !currentState.obscureText));
      } else {
        emit(const LoginShowPasswordState(obscureText: false));
      }
    });

    on<LoginButtonEvent>((event, emit) async {
      emit(LoginLoadingState());

      String url = AppConfigs.signInUrl;

      final data = {
        "username": event.email,
        "password": event.password,
      };

      await networkService.getPostApiResponse(url, data).then((value) {
        debugPrint("response $value");
        emit(LoginSuccessState());
      }).catchError((e) {
        emit(LoginErrorState(message: e.toString()));
      });
    });
  }
}
