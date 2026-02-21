import 'package:e_commerce_learning_app/core/model/product_filter_model.dart';
import 'package:e_commerce_learning_app/core/repo/product_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productsController = FutureProvider.family((
  ref,
  ProductFilterModel filter,
) async {
  return await ref.read(productRepoProvider).getProducts(filter);
});
