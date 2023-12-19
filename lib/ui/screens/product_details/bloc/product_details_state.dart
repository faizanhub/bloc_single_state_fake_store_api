part of 'product_details_bloc.dart';

abstract class ProductDetailsState extends Equatable {
  const ProductDetailsState();
}

class ProductDetailsInitialState extends ProductDetailsState {
  @override
  List<Object> get props => [];
}

class ProductDetailsIsExpandedState extends ProductDetailsState {
  final bool isExpanded;

  const ProductDetailsIsExpandedState({required this.isExpanded});

  @override
  List<Object> get props => [isExpanded];
}
