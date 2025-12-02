///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsEn with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsEn({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsEn _root = this; // ignore: unused_field

	@override 
	TranslationsEn $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsEn(meta: meta ?? this.$meta);

	// Translations
	@override String get appName => 'Drakon';
	@override late final _TranslationsLoginEn login = _TranslationsLoginEn._(_root);
}

// Path: login
class _TranslationsLoginEn implements TranslationsLoginAr {
	_TranslationsLoginEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Login';
	@override String get welcomeBack => 'Welcome back!';
	@override String get subtitle => 'This text is an example of a placeholder text that can be replaced in the same space. It has been generated as a sample.';
	@override String get username => 'Username';
	@override String get usernameHint => 'Enter your name';
	@override String get password => 'Password';
	@override String get passwordHint => 'Enter your account password';
	@override late final _TranslationsLoginErrorsEn errors = _TranslationsLoginErrorsEn._(_root);
	@override String get noAccountText => 'Don\'t have an account?';
	@override String get createAccountText => 'Create a new account';
}

// Path: login.errors
class _TranslationsLoginErrorsEn implements TranslationsLoginErrorsAr {
	_TranslationsLoginErrorsEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get passwordRequired => 'Please enter your password';
	@override String get passwordMin => 'Minimum allowed is 8 characters';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsEn {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'appName' => 'Drakon',
			'login.title' => 'Login',
			'login.welcomeBack' => 'Welcome back!',
			'login.subtitle' => 'This text is an example of a placeholder text that can be replaced in the same space. It has been generated as a sample.',
			'login.username' => 'Username',
			'login.usernameHint' => 'Enter your name',
			'login.password' => 'Password',
			'login.passwordHint' => 'Enter your account password',
			'login.errors.passwordRequired' => 'Please enter your password',
			'login.errors.passwordMin' => 'Minimum allowed is 8 characters',
			'login.noAccountText' => 'Don\'t have an account?',
			'login.createAccountText' => 'Create a new account',
			_ => null,
		};
	}
}
