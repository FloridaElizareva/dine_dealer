import 'package:dine_dealer/core/constants/country_codes.dart';
import 'package:dine_dealer/features/domain/controllers/log_in_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneNumberWidget extends StatelessWidget {
  const PhoneNumberWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LogInController>(
        init: LogInController(),
        builder: (controller) {
          return Column(
            children: [
              Row(
                children: [
                  DropdownButton(
                    menuWidth: 200,
                    value: controller.selectedCountry,
                    items: countriesToItems(controller.countryCodes.countries),
                    onChanged: (e) => controller.selectCountry(e!),
                    selectedItemBuilder: (_) {
                      return controller.countryCodes.countries.map((e) => e.flag).toList();
                    },
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      height: 56,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1ECE1),
                        borderRadius: BorderRadius.circular(28),
                      ),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '+ 46 40 123 4567',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Container(
                width: double.infinity,
                height: 56,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Center(
                  child: Text(
                    'Log in',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }

  List<DropdownMenuItem<String>> countriesToItems(List<Country> countries) {
    return countries
        .map(
          (e) => DropdownMenuItem(
            value: e.country,
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
