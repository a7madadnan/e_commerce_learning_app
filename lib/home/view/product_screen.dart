// import 'package:auto_route/auto_route.dart';
// import 'package:e_commerce_learning_app/home/view/home_screenlearn.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// @RoutePage()
// class ProductScreen extends StatelessWidget {
//   const ProductScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         children: [
//           Center(child: Text('Test Screen')),
//           FavoriteIcon(),
//         ],
//       ),
//     );
//   }
// }

// class FavoriteIcon extends ConsumerWidget {
//   const FavoriteIcon({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final isFavorite = ref.watch(isFavoriteProvider);
//     return InkWell(
//       onTap: () {
//         ref.read(isFavoriteProvider.notifier).state = !isFavorite;
//       },
//       child: Icon(
//         isFavorite ? Icons.favorite : Icons.favorite_border,
//         color: isFavorite ? Colors.red : Colors.black,
//       ),
//     );
//   }
// }
