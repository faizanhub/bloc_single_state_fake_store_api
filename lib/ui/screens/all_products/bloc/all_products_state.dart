part of 'all_products_bloc.dart';

abstract class AllProductsState extends Equatable {
  const AllProductsState();
}

class AllProductsInitialState extends AllProductsState {
  @override
  List<Object> get props => [];
}


class AllProductsLoadedState extends AllProductsState {
  final List<Product> productsList;

  const AllProductsLoadedState({required this.productsList});

  @override
  List<Object> get props => [productsList];
}

class AllProductsErrorState extends AllProductsState {
  final String message;

  const AllProductsErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

class AllProductsLoadingState extends AllProductsState {
  @override
  List<Object> get props => [];
}
