import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ProductSortType {
  name,
  price,
}


final productSortTypeProvider = StateProvider<ProductSortType>(
  // We return the default sort type, here name.
  (ref) => ProductSortType.name,
);