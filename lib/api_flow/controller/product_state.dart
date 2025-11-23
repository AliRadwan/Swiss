part of 'product_cubit.dart';

@immutable
sealed class ProductState extends Equatable{
  const ProductState();
}


final class ProductLoading extends ProductState{
  const ProductLoading();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class ProductLodaded extends ProductState{
  final List<ProductModel> productList;

  const ProductLodaded({required this.productList});
  @override
  // TODO: implement props
  List<Object?> get props => [productList];
}

final class ProductError  extends ProductState{
  final String error;

  const ProductError({required this.error});
  @override
  // TODO: implement props
  List<Object?> get props => [error];
}



