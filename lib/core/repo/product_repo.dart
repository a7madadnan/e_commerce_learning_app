import 'package:dio/dio.dart';
import 'package:e_commerce_learning_app/core/model/product_filter_model.dart';
import 'package:e_commerce_learning_app/core/model/product_model.dart';
import 'package:e_commerce_learning_app/core/network/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productRepoProvider = Provider<ProductRepo>((ref) {
  return ProductRepo(dio: ref.read(dioProvider));
});

class ProductRepo {
  final Dio dio;

  ProductRepo({required this.dio});

  Future<List<ProductModel>> getProducts(ProductFilterModel filter) async {
    try {
      final response = await dio.get(
        '/products',
        queryParameters: filter.toQueryParameters(),
      );

      return (response.data['products'] as List)
          .map((e) => ProductModel.fromJson(e))
          .toList();
    } catch (e) {
      logger.log(e);
      throw e.toString();
    }
  }
}
