import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todo/api_flow/models/product_model.dart';

class ProductRepo {

  getProductData()async{

    var url = Uri.parse('https://api.escuelajs.co/api/v1/products');
    var response = await http.get(url);
    if (response.statusCode == 200){
      final List data = json.decode(response.body);
      // return list.map((json)=> ProductModel.fromJson(json));
      return data.map((e) => ProductModel.fromJson(e)).toList();

      // return data.map((e) => ProductModel(id: id, title: title, slug: slug, price: price, description: description, category: category, images: images).fromJson(e)).toList();

    }else{
      throw Exception("fail");

    }
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    print(await http.read(Uri.https('example.com', 'foobar.txt')));
  }
}