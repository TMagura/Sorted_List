import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:state_management/sortedList/sorted.dart';

class Product {
  Product({required this.name, required this.price});

  final String name;
  final double price;
}

final _products = [
  Product(name: 'IPhone', price: 999),
  Product(name: 'Cookie', price: 2),
  Product(name: 'Ps5', price: 500),
    Product(name: 'Bread', price: 1),
  Product(name: 'bBrger', price: 3),
  Product(name: 'Pizza', price: 10),
    Product(name: 'Stove', price: 299),
  Product(name:'Bed', price: 270),
  Product(name: 'Tv', price: 400),
    Product(name: 'BMW', price: 20999),
  Product(name: 'Benz', price: 19000),
  Product(name: 'Laptop', price: 500),
];

// final productsProvider = Provider<List<Product>>((ref) {
//   return _products;
// });

final productsProvider = Provider<List<Product>>((ref) {
  final sortType = ref.watch(productSortTypeProvider);
  switch (sortType) {
    case ProductSortType.name:
      return _products.sorted((a, b) => a.name.compareTo(b.name));
    case ProductSortType.price:
      return _products.sorted((a, b) => a.price.compareTo(b.price));
  }
});