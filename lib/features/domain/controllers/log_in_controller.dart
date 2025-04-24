import 'dart:async';

import 'package:dine_dealer/core/constants/country_codes.dart';
import 'package:dine_dealer/core/failures/failure.dart';
import 'package:dine_dealer/features/data/repositories/log_in_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LogInController extends GetxController {
  LogInController({
    required this.fss,
    required this.logInRepository,
  });

  final FlutterSecureStorage fss;
  final LogInRepository logInRepository;

  final countryCodes = CountryCodes();

  late Country selectedCountry = countryCodes.countries.first;

  String phone = '';

  Failure? logInFailure;

  Failure? enterCodeFailure;

  bool isLoading = false;

  int resendTime = 20;

  Timer? timer;

  void selectCountry(Country country) {
    selectedCountry = country;
    update();
  }

  void enterNumber(String newNumber) {
    phone = newNumber;
    logInFailure = null;
    update();
  }

  Future<void> logIn() async {
    isLoading = true;
    update();

    final fullPhone = selectedCountry.code + phone;
    final lor = await LogInRepository().logIn(fullPhone);

    if (lor.isLeft) {
      logInFailure = lor.left;
    }

    isLoading = false;

    update();
  }

  Future<void> sendOtp(String code) async {
    isLoading = true;

    update();

    final fullPhone = selectedCountry.code + phone;
    final lor = await LogInRepository().sendOtp(fullPhone, code);

    if (lor.isLeft) {
      enterCodeFailure = lor.left;
    } else {
      fss.write(key: 'token', value: lor.right.token);
    }

    isLoading = false;

    update();
  }

  void startTimer() {
    resendTime = 20;

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (resendTime == 0) {
        timer.cancel();
      }
      resendTime--;
      update();
    });
  }

  void resetTimer() {
    resendTime = 20;
    timer?.cancel();
  }
}
