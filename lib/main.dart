import 'package:dine_dealer/core/di/inject.dart';
import 'package:dine_dealer/core/failures/failure.dart';
import 'package:dine_dealer/core/l10n/generated/l10n.dart';
import 'package:dine_dealer/core/navigation/navigation.dart';
import 'package:dine_dealer/features/data/repositories/log_in_repository.dart';
import 'package:dine_dealer/features/pages/log_in/log_in_page.dart';
import 'package:dine_dealer/features/pages/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'features/pages/enter_code_page/enter_code_page.dart';

void main() {
  inject();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: Navigation.initial,
      getPages: Navigation.pages,
      localizationsDelegates: [
        L10n.delegate
      ],
    );
  }
}
