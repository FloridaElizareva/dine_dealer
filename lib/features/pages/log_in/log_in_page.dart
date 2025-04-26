import 'package:dine_dealer/core/assets/assets.gen.dart';
import 'package:dine_dealer/core/assets/fonts.gen.dart';
import 'package:dine_dealer/core/l10n/generated/l10n.dart';
import 'package:dine_dealer/core/theme/colors.dart';
import 'package:dine_dealer/features/pages/log_in/widgets/phone_number_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DDColors.bg,
      appBar: AppBar(
        backgroundColor: DDColors.bg,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    L10n.current.dineDealer,
                    style: TextStyle(
                      fontSize: 26,
                      color: DDColors.main,
                      fontWeight: FontWeight.w700,
                      fontFamily: FontFamily.robotoSerif,
                    ),
                  ),
                  Assets.images.logoButton.svg(
                    width: 42,
                    height: 42,
                  ),
                ],
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: Text(
                  'Your table,\nyour time,\nour call.',
                  style: TextStyle(
                    fontSize: 52,
                    height: 1.2,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontFamily: FontFamily.robotoSerif,
                  ),
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Log In or Create an Account to Begin',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              PhoneNumberWidget(),
              SizedBox(height: 24),
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(color: Colors.black87),
                    children: [
                      const TextSpan(text: 'By continuing, you agree to the '),
                      TextSpan(
                        text: 'Terms & Conditions',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      const TextSpan(text: ' and\nacknowledge the '),
                      TextSpan(
                        text: 'Privacy Policy.',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
