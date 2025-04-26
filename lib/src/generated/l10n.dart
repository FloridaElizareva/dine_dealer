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

class CoreL10n {
  CoreL10n();

  static CoreL10n? _current;

  static CoreL10n get current {
    assert(
      _current != null,
      'No instance of CoreL10n was loaded. Try to initialize the CoreL10n delegate before accessing CoreL10n.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<CoreL10n> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = CoreL10n();
      CoreL10n._current = instance;

      return instance;
    });
  }

  static CoreL10n of(BuildContext context) {
    final instance = CoreL10n.maybeOf(context);
    assert(
      instance != null,
      'No instance of CoreL10n present in the widget tree. Did you add CoreL10n.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static CoreL10n? maybeOf(BuildContext context) {
    return Localizations.of<CoreL10n>(context, CoreL10n);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<CoreL10n> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<CoreL10n> load(Locale locale) => CoreL10n.load(locale);
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
