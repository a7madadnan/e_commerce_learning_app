import 'package:e_commerce_learning_app/core/auth/controller/auth_controller.dart';
import 'package:e_commerce_learning_app/core/dependencies_injection.dart';
import 'package:e_commerce_learning_app/core/route/app_router.dart';
import 'package:e_commerce_learning_app/theme/app_theme.dart';
import 'package:e_commerce_learning_app/translator/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:talker_flutter/talker_flutter.dart';

import 'package:shared_preferences/shared_preferences.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  // logger.info("App Started 🔥");
  runApp(
    

    TranslationProvider(
      child: ProviderScope(
        overrides: [
          sharedPreferenceProvider.overrideWith((ref) => sharedPreferences),
        ],
        child: const MainApp(),
      ),
    ),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final router = ref.read(routerProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      routerDelegate: router.delegate(
        reevaluateListenable: ref.watch(loggedInProvider),
      ),
      routeInformationParser: router.defaultRouteParser(),

      locale: TranslationProvider.of(context).flutterLocale,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
    );
  }
}
