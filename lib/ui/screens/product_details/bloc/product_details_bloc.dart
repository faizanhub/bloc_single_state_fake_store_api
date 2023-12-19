import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'product_details_event.dart';
part 'product_details_state.dart';

class ProductDetailsBloc extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  ProductDetailsBloc() : super(ProductDetailsInitialState()) {
    on<ProductDetailsToggleExpandedEvent>((event, emit) {


      if (state is ProductDetailsIsExpandedState) {
        final currentState = state as ProductDetailsIsExpandedState;
        emit(ProductDetailsIsExpandedState(isExpanded: !currentState.isExpanded));
      } else {
        emit(const ProductDetailsIsExpandedState(isExpanded: true));
      }
    });
  }
}
