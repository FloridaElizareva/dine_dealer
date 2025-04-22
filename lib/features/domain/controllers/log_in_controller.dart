import 'package:dine_dealer/core/constants/country_codes.dart';
import 'package:dine_dealer/core/failures/failure.dart';
import 'package:dine_dealer/features/data/repositories/log_in_repository.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LogInController extends GetxController {
  final countryCodes = CountryCodes();

  late Country selectedCountry = countryCodes.countries.first;

  String phone = '';

  Failure? failure;

  bool isLoading = false;

  void selectCountry(Country country) {
    selectedCountry = country;
    update();
  }

  void enterNumber(String newNumber) {
    phone = newNumber;
    failure = null;
    update();

  }

  void logIn() async {
    isLoading = true;
    update();
    
    final fullPhone = selectedCountry.code + phone;
    final lor = await LogInRepository().logIn(fullPhone);

    if (lor.isLeft) {
      failure = lor.left;
    }

    isLoading = false;

    update();
  }


}
