import 'package:dine_dealer/core/di/inject.dart';
import 'package:dine_dealer/core/l10n/generated/l10n.dart';
import 'package:dine_dealer/core/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

void main() async {
  await FlutterSecureStorage().write(
    key: 'token',
    value:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEwLCJwaG9uZSI6Iis5OTU1NTg1NDQ2NzIiLCJ0b2tlbl92ZXJzaW9uIjoxMCwiaWF0IjoxNzQ1Njg5MTkzLCJleHAiOjE3NDgyODExOTN9.uAeDCkcJLkEdUsm1r_sPDMbdVjOm_QskqAj15TqA4io',
  );

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
      localizationsDelegates: [L10n.delegate],
    );
  }
}
