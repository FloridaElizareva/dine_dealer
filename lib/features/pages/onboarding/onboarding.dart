import 'package:dine_dealer/core/assets/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int stepIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      'assets/images/onboarding1.png',
      'assets/images/onboarding2.png',
      'assets/images/onboarding3.png',
    ];

    final List<String> titles = [
      'Get a plan',
      'Make reservations',
      'Enjoy your meal!',
    ];

    final List<String> subtitles = [
      'Choose the number of calls you need',
      'Use calls to book tables easily',
      'Stress-free dining, every time!',
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
                child: const Text(
                  'DineDealer',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'Georgia',
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
                subtitles[stepIndex],
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  fontFamily: FontFamily.robotoSerif,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                titles[stepIndex],
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  fontWeight: FontWeight.w400,
                  fontFamily: FontFamily.manrope,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 18),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: stepIndex == 0? 50: 100,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(28),
                          bottomLeft: Radius.circular(28),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: 100,
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
                  onPressed: () {
                    setState(() {
                      stepIndex = (stepIndex + 1) % 3;
                    });
                  },
                  child: Text(
                    'Next →',
                    style: TextStyle(fontSize: 15),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 6.0,
                    ),
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
