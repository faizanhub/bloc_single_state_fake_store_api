part of 'product_details_bloc.dart';

class ProductDetailsState extends Equatable {
  final bool isExpanded;

  const ProductDetailsState({required this.isExpanded});

  factory ProductDetailsState.initial() => const ProductDetailsState(isExpanded: false);

  ProductDetailsState copyWith({
    bool? isExpanded,
  }) {
    return ProductDetailsState(
      isExpanded: isExpanded ?? this.isExpanded,
    );
  }

  @override
  List<Object?> get props => [isExpanded];
}

// abstract class ProductDetailsState extends Equatable {
//   const ProductDetailsState();
// }
//
// class ProductDetailsInitialState extends ProductDetailsState {
//   @override
//   List<Object> get props => [];
// }
//
// class ProductDetailsIsExpandedState extends ProductDetailsState {
//   final bool isExpanded;
//
//   const ProductDetailsIsExpandedState({required this.isExpanded});
//
//   @override
//   List<Object> get props => [isExpanded];
// }
