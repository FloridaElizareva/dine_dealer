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
                  L10n.current.titleLogIn,
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
                child: Text(
                  L10n.current.logInText3,
                  style: const TextStyle(
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
                      TextSpan(text: L10n.current.logInText4,),
                      TextSpan(
                        text: L10n.current.logInText5,
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      TextSpan(text: L10n.current.logInText6),
                      TextSpan(
                        text: L10n.current.logInText7,
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
