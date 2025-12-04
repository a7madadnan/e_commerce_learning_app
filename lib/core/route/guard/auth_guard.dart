import 'package:auto_route/auto_route.dart';
import 'package:e_commerce_learning_app/core/auth/controller/auth_controller.dart';
import 'package:e_commerce_learning_app/core/route/app_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthGuard extends AutoRouteGuard {
  final Ref ref;

  AuthGuard({required this.ref});

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final user = ref.watch(authControllerProvider);

    final bool isLoggedIn = user != null;

    if (isLoggedIn) {
      resolver.next();
    } else {
      router.replaceAll([LoginRoute()]);
    }
  }
}
