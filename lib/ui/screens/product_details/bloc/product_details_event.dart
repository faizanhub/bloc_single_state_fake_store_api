part of 'product_details_bloc.dart';

abstract class ProductDetailsEvent extends Equatable {
  const ProductDetailsEvent();
}

class ProductDetailsToggleExpandedEvent extends ProductDetailsEvent {
  @override
  List<Object?> get props => [];
}
