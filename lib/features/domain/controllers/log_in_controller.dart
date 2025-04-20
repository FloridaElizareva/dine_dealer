import 'package:dine_dealer/core/constants/country_codes.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LogInController extends GetxController {
  final countryCodes = CountryCodes();

  String selectedCountry = 'Georgia';

  void selectCountry(String country){
    selectedCountry = country;
    update();
  }
}
