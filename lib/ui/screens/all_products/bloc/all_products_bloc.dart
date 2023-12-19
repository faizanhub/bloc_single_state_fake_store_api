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

  AllProductsBloc() : super(AllProductsInitialState()) {
    on<AllProductsGetListEvent>((event, emit) async  {
      emit(AllProductsLoadingState());

      await networkService.getGetApiResponse(AppConfigs.allProductsUrl).then((jsonList) {
        final listValue = jsonList as List;
        final list = listValue.map((e) => Product.fromJson(e)).toList();

        emit(AllProductsLoadedState(productsList: list));
      }).onError((e, stackTrace) {

          debugPrint(e.toString());
          emit(AllProductsErrorState(message: e.toString()));

      });
    });
  }
}
