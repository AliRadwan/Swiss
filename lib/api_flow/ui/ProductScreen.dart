import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/api_flow/controller/product_cubit.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>ProductCubit()..getProductData(),
    child: Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<ProductCubit,ProductState>(builder: (context,state){
       switch(state){
         case ProductLoading():
         return Center(child: const CircularProgressIndicator());
         case ProductLodaded():
           return ListView.builder(
             padding: const EdgeInsets.all(12),
             itemCount: state.productList.length,
             itemBuilder: (context, index) {
               final product = state.productList[index];
               return Card(
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(12),
                 ),
                 margin: const EdgeInsets.only(bottom: 12),
                 child: ListTile(
                   leading: ClipRRect(
                     borderRadius: BorderRadius.circular(8),
                     child: Image.network(
                       product.images.first,
                       width: 60,
                       height: 60,
                       fit: BoxFit.cover,
                     ),
                   ),
                   title: Text(product.title),
                   subtitle: Text(product.category.name),
                   trailing: Text(
                     "\$${product.price}",
                     style: const TextStyle(
                       fontWeight: FontWeight.bold,
                       color: Colors.green,
                       fontSize: 16,
                     ),
                   ),
                 ),
               );
             },
           );
           throw UnimplementedError();
         case ProductError():
         return Container(color: Colors.red,
         height: 100,width: 100,);
       }
      }),
    ),
    );
  }
}
