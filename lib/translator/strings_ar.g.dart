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
	late final TranslationsSignupAr signup = TranslationsSignupAr._(_root);
}

// Path: login
class TranslationsLoginAr {
	TranslationsLoginAr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ar: 'تسجيل الدخول'
	String get title => 'تسجيل الدخول';

	/// ar: ' ! مرحبا بعودتك '
	String get welcomeBack => ' ! مرحبا بعودتك ';

	/// ar: 'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص'
	String get subtitle => 'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص';

	/// ar: 'اسم المستخدم'
	String get username => 'اسم المستخدم';

	/// ar: 'ادخل اسمك'
	String get usernameHint => 'ادخل اسمك';

	/// ar: 'كلمة السر'
	String get password => 'كلمة السر';

	/// ar: 'ادخل كلمة المرور لحسابك'
	String get passwordHint => 'ادخل كلمة المرور لحسابك';

	late final TranslationsLoginErrorsAr errors = TranslationsLoginErrorsAr._(_root);

	/// ar: 'هل لديك حساب ؟'
	String get noAccountText => 'هل لديك حساب ؟';

	/// ar: 'انشأ حساب جديد'
	String get createAccountText => 'انشأ حساب جديد';
}

// Path: signup
class TranslationsSignupAr {
	TranslationsSignupAr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ar: 'إنشاء حساب جديد'
	String get title => 'إنشاء حساب جديد';

	/// ar: 'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص'
	String get subtitle => 'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص';

	/// ar: 'اسم المستخدم'
	String get username => 'اسم المستخدم';

	/// ar: 'على سبيل المثال احمد محمد'
	String get usernameHint => 'على سبيل المثال احمد محمد';

	/// ar: 'الاسم'
	String get name => 'الاسم';

	/// ar: 'ادخل اسمك الكامل'
	String get nameHint => 'ادخل اسمك الكامل';

	/// ar: 'البريد الإلكتروني'
	String get email => 'البريد الإلكتروني';

	/// ar: 'example@mail.com'
	String get emailHint => 'example@mail.com';

	/// ar: 'رقم الهاتف'
	String get phone => 'رقم الهاتف';

	/// ar: '+964 7700000000'
	String get phoneHint => '+964 7700000000';

	/// ar: 'كلمة المرور'
	String get password => 'كلمة المرور';

	/// ar: 'ادخل كلمة المرور لحسابك'
	String get passwordHint => 'ادخل كلمة المرور لحسابك';

	/// ar: 'تأكيد كلمة المرور'
	String get confirmPassword => 'تأكيد كلمة المرور';

	/// ar: 'اعد كتابة كلمة المرور'
	String get confirmPasswordHint => 'اعد كتابة كلمة المرور';

	late final TranslationsSignupErrorsAr errors = TranslationsSignupErrorsAr._(_root);

	/// ar: 'هل لديك حساب بالفعل؟'
	String get haveAccountText => 'هل لديك حساب بالفعل؟';

	/// ar: 'سجل دخولك'
	String get loginText => 'سجل دخولك';
}

// Path: login.errors
class TranslationsLoginErrorsAr {
	TranslationsLoginErrorsAr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ar: 'ادخل كلمه المرور'
	String get passwordRequired => 'ادخل كلمه المرور';

	/// ar: 'اقل عدد مسموح 8'
	String get passwordMin => 'اقل عدد مسموح 8';
}

// Path: signup.errors
class TranslationsSignupErrorsAr {
	TranslationsSignupErrorsAr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ar: 'ادخل اسم المستخدم'
	String get usernameRequired => 'ادخل اسم المستخدم';

	/// ar: 'ادخل كلمة المرور'
	String get passwordRequired => 'ادخل كلمة المرور';

	/// ar: 'اقل عدد مسموح 8'
	String get passwordMin => 'اقل عدد مسموح 8';

	/// ar: 'كلمة المرور غير متطابقة'
	String get passwordMismatch => 'كلمة المرور غير متطابقة';

	/// ar: 'ادخل البريد الإلكتروني'
	String get emailRequired => 'ادخل البريد الإلكتروني';

	/// ar: 'ادخل رقم الهاتف'
	String get phoneRequired => 'ادخل رقم الهاتف';
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
			'login.welcomeBack' => ' ! مرحبا بعودتك ',
			'login.subtitle' => 'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص',
			'login.username' => 'اسم المستخدم',
			'login.usernameHint' => 'ادخل اسمك',
			'login.password' => 'كلمة السر',
			'login.passwordHint' => 'ادخل كلمة المرور لحسابك',
			'login.errors.passwordRequired' => 'ادخل كلمه المرور',
			'login.errors.passwordMin' => 'اقل عدد مسموح 8',
			'login.noAccountText' => 'هل لديك حساب ؟',
			'login.createAccountText' => 'انشأ حساب جديد',
			'signup.title' => 'إنشاء حساب جديد',
			'signup.subtitle' => 'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص',
			'signup.username' => 'اسم المستخدم',
			'signup.usernameHint' => 'على سبيل المثال احمد محمد',
			'signup.name' => 'الاسم',
			'signup.nameHint' => 'ادخل اسمك الكامل',
			'signup.email' => 'البريد الإلكتروني',
			'signup.emailHint' => 'example@mail.com',
			'signup.phone' => 'رقم الهاتف',
			'signup.phoneHint' => '+964 7700000000',
			'signup.password' => 'كلمة المرور',
			'signup.passwordHint' => 'ادخل كلمة المرور لحسابك',
			'signup.confirmPassword' => 'تأكيد كلمة المرور',
			'signup.confirmPasswordHint' => 'اعد كتابة كلمة المرور',
			'signup.errors.usernameRequired' => 'ادخل اسم المستخدم',
			'signup.errors.passwordRequired' => 'ادخل كلمة المرور',
			'signup.errors.passwordMin' => 'اقل عدد مسموح 8',
			'signup.errors.passwordMismatch' => 'كلمة المرور غير متطابقة',
			'signup.errors.emailRequired' => 'ادخل البريد الإلكتروني',
			'signup.errors.phoneRequired' => 'ادخل رقم الهاتف',
			'signup.haveAccountText' => 'هل لديك حساب بالفعل؟',
			'signup.loginText' => 'سجل دخولك',
			_ => null,
		};
	}
}
