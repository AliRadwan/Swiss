import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todo/api_flow/models/product_model.dart';
import 'package:todo/api_flow/repo/product_repo.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductLoading()){
    /// same like calling with create
    getProductData();
  }
  ProductRepo productRepo = ProductRepo();


  getProductData()async{
try{
  final List<ProductModel> productList = await productRepo.getProductData();
  emit(ProductLodaded(productList: productList));
}
catch(e){
  emit(ProductError(error: e.toString()));
}
  }
}
