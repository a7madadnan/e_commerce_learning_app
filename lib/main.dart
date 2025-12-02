import 'package:e_commerce_learning_app/core/dependencies_injection.dart';
import 'package:e_commerce_learning_app/login/login_screen.dart';
import 'package:e_commerce_learning_app/theme/app_theme.dart';
import 'package:e_commerce_learning_app/translator/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
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

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: LoginScreen(),

      locale: TranslationProvider.of(context).flutterLocale,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
    );
  }
}
