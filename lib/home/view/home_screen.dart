import 'package:auto_route/auto_route.dart';
import 'package:e_commerce_learning_app/core/auth/controller/auth_controller.dart';
import 'package:e_commerce_learning_app/core/auth/login/login_screen.dart';
import 'package:e_commerce_learning_app/core/route/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

@RoutePage()
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Column(
        spacing: 30,
        children: [
          // Center(child: Text('Welcome to the Home Screen')),

          // FilledButton(
          //   onPressed: () {
          //     ref.read(authControllerProvider.notifier).logout();
          //   },
          //   child: Text('logout'),
          // ),

          // ProductCard(),
          ProductCardPr(),

          FilledButton(
            onPressed: () {
              context.router.push(ProductRoute());
            },
            child: Text('go to product'),
          ),
          FilledButton.tonal(
            onPressed: () {
              ref.read(authControllerProvider.notifier).logout();
            },
            child: Text('logout'),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatefulWidget {
  const ProductCard({super.key});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('isFavorite =  $isFavorite'),
        FilledButton(
          onPressed: () {
            setState(() {
              isFavorite = !isFavorite;
            });
          },
          child: Text('toggle statefull'),
        ),
      ],
    );
  }
}

class ProductCardPr extends ConsumerWidget {
  const ProductCardPr({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavorite = ref.watch(isFavoriteProvider);
    final user = ref.watch(authControllerProvider);
    return Column(
      children: [
        Text('isFavorite =  $isFavorite'),
        Text('user =  ${user?.email}'),

        FilledButton(
          onPressed: () {
            ref.read(isFavoriteProvider.notifier).state = !isFavorite;
          },
          child: Text('toggle provider'),
        ),
      ],
    );
  }
}

final isFavoriteProvider = StateProvider<bool>((ref) => false);
