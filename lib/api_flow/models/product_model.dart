import 'package:equatable/equatable.dart';

class ProductModel extends Equatable{
  final int id;
  final String title;
  final String slug;
  final int price;
  final String description;
  final Category category;
  final List<String> images;
  ProductModel({required this.id, required this.title, required this.slug, required this.price, required this.description, required this.category, required this.images});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      slug: json['slug'],
      price: json['price'],
      description: json['description'],
      category: Category.fromJson(json['category']),
      images: List<String>.from(json['images']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'slug': slug,
      'price': price,
      'description': description,
      'category': category.toJson(),
      'images': images,
    };}

  @override
  // TODO: implement props
  List<Object?> get props => [id,title,slug,price,description,images,category];


}

class Category{
  final int id;
  final String name;
  final String slug;
  final String image;

  Category({required this.id, required this.name, required this.slug, required this.image});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'image': image,
    };
  }
}
