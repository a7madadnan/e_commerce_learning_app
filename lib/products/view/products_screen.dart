import 'package:auto_route/auto_route.dart';
import 'package:e_commerce_learning_app/core/model/product_filter_model.dart';
import 'package:e_commerce_learning_app/core/model/product_model.dart';
import 'package:e_commerce_learning_app/products/controller/products_controller.dart';
import 'package:e_commerce_learning_app/products/widget/product_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class ProductsScreen extends ConsumerStatefulWidget {
  const ProductsScreen({super.key});

  @override
  ConsumerState<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends ConsumerState<ProductsScreen> {
  final filter = ProductFilterModel(category: 'Components');

  @override
  Widget build(BuildContext context) {
    final productsAsync = ref.watch(productsController(filter));
    return Scaffold(
      appBar: AppBar(title: Text('Products')),
      body: productsAsync.when(
        data: (products) => ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return ProductListTile(product: product);
          },
        ),
        error: (Object error, StackTrace stackTrace) {
          return Column(
            children: [
              Text(error.toString()),
              ElevatedButton(
                onPressed: () {
                  ref.invalidate(productsController);
                },
                child: Text('retry'),
              ),
            ],
          );
        },
        loading: () {
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
//بدون كونترولر
// @RoutePage()
// class ProductsScreen extends ConsumerStatefulWidget {
//   const ProductsScreen({super.key});

//   @override
//   ConsumerState<ProductsScreen> createState() => _ProductsScreenState();
// }

// class _ProductsScreenState extends ConsumerState<ProductsScreen> {
//   List<ProductModel> products = [];

//   @override
//   void initState() {
//     ref.read(productRepoProvider).getProducts().then((products) {
//       setState(() {
//         this.products = products;
//       });
//     });

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Products')),
//       body: ListView.builder(
//         itemCount: products.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(products[index].name),
//             subtitle: Text(products[index].price),
//             leading: Image.network(products[index].thumbnail),
//           );
//         },
//       ),
//     );
//   }
// }
