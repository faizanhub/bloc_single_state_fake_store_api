part of 'all_products_bloc.dart';

class AllProductsState extends Equatable {
  final List<Product> productsList;
  final String errorMsg;
  final bool isLoading;

  const AllProductsState({required this.productsList, required this.errorMsg, required this.isLoading});

  factory AllProductsState.initial() => const AllProductsState(productsList: [], errorMsg: "", isLoading: false);

  AllProductsState copyWith({
    List<Product>? productsList,
    String? errorMsg,
    bool? isLoading,
  }) {
    return AllProductsState(
      productsList: productsList ?? this.productsList,
      errorMsg: errorMsg ?? this.errorMsg,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [productsList, errorMsg, isLoading];
}

// abstract class AllProductsState extends Equatable {
//   const AllProductsState();
// }
//
// class AllProductsInitialState extends AllProductsState {
//   @override
//   List<Object> get props => [];
// }
//
//
// class AllProductsLoadedState extends AllProductsState {
//   final List<Product> productsList;
//
//   const AllProductsLoadedState({required this.productsList});
//
//   @override
//   List<Object> get props => [productsList];
// }
//
// class AllProductsErrorState extends AllProductsState {
//   final String message;
//
//   const AllProductsErrorState({required this.message});
//
//   @override
//   List<Object> get props => [message];
// }
//
// class AllProductsLoadingState extends AllProductsState {
//   @override
//   List<Object> get props => [];
// }
