import 'package:auto_route/auto_route.dart';
import 'package:e_commerce_learning_app/core/route/guard/auth_guard.dart';
import 'package:e_commerce_learning_app/home/view/home_screen.dart';
import 'package:e_commerce_learning_app/core/auth/login/login_screen.dart';
import 'package:e_commerce_learning_app/core/auth/sign_up/sign_up_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'app_router.gr.dart';

final routerProvider = Provider((ref) => AppRouter(ref: ref));

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  final Ref ref;

  AppRouter({required this.ref});

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LoginRoute.page),

    AutoRoute(
      page: HomeRoute.page,
      initial: true,
      guards: [AuthGuard(ref: ref)],
    ),
    AutoRoute(page: SignUpRoute.page),
  ];
}
