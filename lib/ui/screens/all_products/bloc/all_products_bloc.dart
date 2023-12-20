import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_fake_store_api/core/constants/app_configs.dart';
import 'package:bloc_fake_store_api/core/models/product.dart';
import 'package:bloc_fake_store_api/core/services/network_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'all_products_event.dart';

part 'all_products_state.dart';

class AllProductsBloc extends Bloc<AllProductsEvent, AllProductsState> {
  final networkService = NetworkService();

  AllProductsBloc() : super(AllProductsState.initial()) {
    on<AllProductsGetListEvent>((event, emit) async  {
      emit(state.copyWith(isLoading: true));

      await networkService.getGetApiResponse(AppConfigs.allProductsUrl).then((jsonList) {
        final listValue = jsonList as List;
        final productsList = listValue.map((e) => Product.fromJson(e)).toList();

        emit(state.copyWith(isLoading: false, productsList: productsList));
      }).onError((e, stackTrace) {

          debugPrint(e.toString());
          emit(state.copyWith(isLoading: false,errorMsg: e.toString()));

      });
    });
  }
}
