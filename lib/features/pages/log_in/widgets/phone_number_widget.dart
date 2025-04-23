import 'package:dine_dealer/core/constants/country_codes.dart';
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
  late TextEditingController textController;

  @override
  void initState() {
    final controller = Get.put(LogInController());
    textController = TextEditingController(text: controller.selectedCountry.code);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LogInController>(
      builder: (controller) {
        return Column(
          children: [
            Row(
              children: [
                DropdownButton(
                  menuWidth: 200,
                  value: controller.selectedCountry,
                  items: countriesToItems(controller.countryCodes.countries),
                  onChanged: (e) {
                    controller.selectCountry(e!);
                    textController.value = TextEditingValue(text: e.code);
                  },
                  selectedItemBuilder: (_) {
                    return controller.countryCodes.countries.map((e) => e.flag).toList();
                  },
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
            Text(
              controller.logInFailure != null ? controller.logInFailure!.message : "",
              style: TextStyle(
                color: Colors.red,
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
      Get.to(EnterCodePage());
    }
  }

  Widget _buildLoginChild(bool isLoading) {
    if (isLoading) {
      return CircularProgressIndicator();
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
