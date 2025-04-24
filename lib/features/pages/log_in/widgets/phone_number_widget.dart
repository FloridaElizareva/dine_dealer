import 'package:dine_dealer/core/constants/country_codes.dart';
import 'package:dine_dealer/core/theme/colors.dart';
import 'package:dine_dealer/features/domain/controllers/log_in_controller.dart';
import 'package:dine_dealer/features/pages/enter_code_page/enter_code_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class PhoneNumberWidget extends StatefulWidget {
  PhoneNumberWidget({super.key});

  @override
  State<PhoneNumberWidget> createState() => _PhoneNumberWidgetState();
}

class _PhoneNumberWidgetState extends State<PhoneNumberWidget> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LogInController>(
      builder: (controller) {
        return Column(
          children: [
            Row(
              children: [
                Container(
                  height: 56,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1ECE1),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<Country>(
                      menuWidth: 200,
                      value: controller.selectedCountry,
                      items: countriesToItems(controller.countryCodes.countries),
                      onChanged: (e) {
                        controller.selectCountry(e!);
                      },
                      selectedItemBuilder: (_) {
                        return controller.countryCodes.countries.map((e) => e.flag).toList();
                      },
                      icon: Icon(Icons.arrow_drop_down),
                      dropdownColor: const Color(0xFFF1ECE1),
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  height: 56,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1ECE1),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(28),
                      bottomLeft: Radius.circular(28),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      controller.selectedCountry.code,
                      style: TextStyle(
                        fontSize: 16,
                        color: controller.phone.isNotEmpty ? Colors.black : Colors.grey,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 56,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1ECE1),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(28),
                        bottomRight: Radius.circular(28),
                      ),
                    ),
                    alignment: Alignment.centerLeft,
                    child: TextField(
                      onChanged: controller.enterNumber,
                      decoration: InputDecoration(
                        hintText: controller.selectedCountry.example,
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(
                          controller.selectedCountry.example.replaceAll(' ', '').length,
                        ),
                      ],
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            AnimatedOpacity(
              opacity: controller.logInFailure != null ? 1.0 : 0.0,
              duration: Duration(milliseconds: 300),
              child: Text(
                controller.logInFailure != null ? controller.logInFailure!.message : "",
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: 400,
              child: ElevatedButton(
                onPressed: () => _onLogIn(controller),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 16.0,
                  ),
                ),
                child: _buildLoginChild(controller.isLoading),
              ),
            ),
          ],
        );
      },
    );
  }

  void _onLogIn(LogInController controller) async {
    await controller.logIn();

    if (controller.logInFailure == null) {
      Get.to(
        EnterCodePage(),
        transition: Transition.fadeIn,
        duration: Duration(milliseconds: 300),
      );
    }
  }

  Widget _buildLoginChild(bool isLoading) {
    if (isLoading) {
      return SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          color: DDColors.bg,
          strokeWidth: 2.5,
        ),
      );
    }

    return Text(
      'Log In',
      style: TextStyle(
        fontSize: 16,
      ),
    );
  }

  List<DropdownMenuItem<Country>> countriesToItems(List<Country> countries) {
    return countries
        .map(
          (e) => DropdownMenuItem(
            value: e,
            child: Row(
              children: [
                e.flag,
                const SizedBox(width: 20),
                Text(e.country),
              ],
            ),
          ),
        )
        .toList();
  }
}
