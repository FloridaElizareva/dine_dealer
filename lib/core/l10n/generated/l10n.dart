// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class L10n {
  L10n();

  static L10n? _current;

  static L10n get current {
    assert(
      _current != null,
      'No instance of L10n was loaded. Try to initialize the L10n delegate before accessing L10n.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<L10n> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = L10n();
      L10n._current = instance;

      return instance;
    });
  }

  static L10n of(BuildContext context) {
    final instance = L10n.maybeOf(context);
    assert(
      instance != null,
      'No instance of L10n present in the widget tree. Did you add L10n.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static L10n? maybeOf(BuildContext context) {
    return Localizations.of<L10n>(context, L10n);
  }

  /// `DineDealer`
  String get dineDealer {
    return Intl.message('DineDealer', name: 'dineDealer', desc: '', args: []);
  }

  /// `Your table,\nyour time,\nour call`
  String get titleLogIn {
    return Intl.message(
      'Your table,\nyour time,\nour call',
      name: 'titleLogIn',
      desc: '',
      args: [],
    );
  }

  /// `Log In or Create an Account to Begin`
  String get logInText3 {
    return Intl.message(
      'Log In or Create an Account to Begin',
      name: 'logInText3',
      desc: '',
      args: [],
    );
  }

  /// `By continuing, you agree to the `
  String get logInText4 {
    return Intl.message(
      'By continuing, you agree to the ',
      name: 'logInText4',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Conditions`
  String get logInText5 {
    return Intl.message(
      'Terms & Conditions',
      name: 'logInText5',
      desc: '',
      args: [],
    );
  }

  /// ` and\nacknowledge the `
  String get logInText6 {
    return Intl.message(
      ' and\nacknowledge the ',
      name: 'logInText6',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy.`
  String get logInText7 {
    return Intl.message(
      'Privacy Policy.',
      name: 'logInText7',
      desc: '',
      args: [],
    );
  }

  /// `Enter the code`
  String get enterCodeText1 {
    return Intl.message(
      'Enter the code',
      name: 'enterCodeText1',
      desc: '',
      args: [],
    );
  }

  /// `Enter the 4-digit code sent to you at`
  String get enterCodeText2 {
    return Intl.message(
      'Enter the 4-digit code sent to you at',
      name: 'enterCodeText2',
      desc: '',
      args: [],
    );
  }

  /// `Resend code in `
  String get enterCodeText3 {
    return Intl.message(
      'Resend code in ',
      name: 'enterCodeText3',
      desc: '',
      args: [],
    );
  }

  /// `Resend code`
  String get enterCodeText4 {
    return Intl.message(
      'Resend code',
      name: 'enterCodeText4',
      desc: '',
      args: [],
    );
  }

  /// `Get a plan`
  String get onboardingTitle1 {
    return Intl.message(
      'Get a plan',
      name: 'onboardingTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Make reservations`
  String get onboardingTitle2 {
    return Intl.message(
      'Make reservations',
      name: 'onboardingTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Enjoy your meal!`
  String get onboardingTitle3 {
    return Intl.message(
      'Enjoy your meal!',
      name: 'onboardingTitle3',
      desc: '',
      args: [],
    );
  }

  /// `Choose the number of calls you need`
  String get onboardingSubtitle1 {
    return Intl.message(
      'Choose the number of calls you need',
      name: 'onboardingSubtitle1',
      desc: '',
      args: [],
    );
  }

  /// `Use calls to book tables easily`
  String get onboardingSubtitle2 {
    return Intl.message(
      'Use calls to book tables easily',
      name: 'onboardingSubtitle2',
      desc: '',
      args: [],
    );
  }

  /// `Stress-free dining, every time!`
  String get onboardingSubtitle3 {
    return Intl.message(
      'Stress-free dining, every time!',
      name: 'onboardingSubtitle3',
      desc: '',
      args: [],
    );
  }

  /// `Next →`
  String get onboardingTextButton {
    return Intl.message(
      'Next →',
      name: 'onboardingTextButton',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<L10n> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[Locale.fromSubtags(languageCode: 'en')];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<L10n> load(Locale locale) => L10n.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
