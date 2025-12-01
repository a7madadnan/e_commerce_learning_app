///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsAr = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ar,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ar>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations

	/// ar: 'دراكون'
	String get appName => 'دراكون';

	late final TranslationsLoginAr login = TranslationsLoginAr._(_root);
}

// Path: login
class TranslationsLoginAr {
	TranslationsLoginAr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ar: 'تسجيل الدخول'
	String get title => 'تسجيل الدخول';

	/// ar: 'اسم المستخدم'
	String get username => 'اسم المستخدم';

	/// ar: 'كلمة السر'
	String get password => 'كلمة السر';
}

/// The flat map containing all translations for locale <ar>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'appName' => 'دراكون',
			'login.title' => 'تسجيل الدخول',
			'login.username' => 'اسم المستخدم',
			'login.password' => 'كلمة السر',
			_ => null,
		};
	}
}
