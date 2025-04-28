import 'package:dine_dealer/core/assets/fonts.gen.dart';
import 'package:dine_dealer/core/l10n/generated/l10n.dart';
import 'package:dine_dealer/features/pages/onboarding/onboarding2_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:dine_dealer/core/theme/colors.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int stepIndex = 0;

  void onButtonPressed() {
    if (stepIndex < 2) {
      stepIndex = stepIndex + 1;
      setState(() {});
    } else {
      Get.off(Onboarding2());
    }
  }

  double getWidth(int stepIndex) {
    switch (stepIndex) {
      case 0:
        return 67;
      case 1:
        return 100;
      case 2:
        return 200;
      default:
        return 50;
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      'assets/images/onboarding1.png',
      'assets/images/onboarding2.png',
      'assets/images/onboarding3.png',
    ];

    final List<String> titles = [
      L10n.current.onboardingTitle1,
      L10n.current.onboardingTitle2,
      L10n.current.onboardingTitle3,
    ];

    final List<String> subtitles = [
      L10n.current.onboardingSubtitle1,
      L10n.current.onboardingSubtitle2,
      L10n.current.onboardingSubtitle3,
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFCFAF3),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
            vertical: 24,
          ),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Center(
                child: Text(
                  L10n.current.dineDealer,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    fontFamily: FontFamily.robotoSerif,
                  ),
                ),
              ),
              const SizedBox(height: 79),
              Image.asset(
                images[stepIndex],
                height: 238,
                width: 207,
              ),
              const SizedBox(height: 63),
              Text(
                titles[stepIndex],
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  fontFamily: FontFamily.robotoSerif,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                subtitles[stepIndex],
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  fontWeight: FontWeight.w400,
                  fontFamily: FontFamily.manrope,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 18),
              SizedBox(
                width: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: getWidth(stepIndex),
                      height: 5,
                      decoration: BoxDecoration(
                        color: DDColors.main,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(28),
                          bottomLeft: Radius.circular(28),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 5,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 222, 215, 215),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(28),
                            bottomRight: Radius.circular(28),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: 85,
                height: 43,
                child: ElevatedButton(
                  onPressed: onButtonPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 6.0,
                    ),
                  ),
                  child: Text(
                    L10n.current.onboardingTextButton,
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
