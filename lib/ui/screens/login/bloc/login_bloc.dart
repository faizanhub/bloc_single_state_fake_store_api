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

  LoginBloc() : super(LoginState.initial()) {
    on<LoginTogglePasswordVisibilityEvent>((event, emit) {
      emit(state.copyWith(isShowPassword: !state.isShowPassword));
    });

    on<LoginButtonEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      String url = AppConfigs.signInUrl;

      final data = {
        "username": event.email,
        "password": event.password,
      };

      await networkService.getPostApiResponse(url, data).then((value) {
        debugPrint("response $value");
        emit(state.copyWith(isLoggedIn: true, isLoading: false));

      }).catchError((e) {
        emit(state.copyWith(isLoading: false, errorMsg: e.toString()));

      });
    });
  }
}
