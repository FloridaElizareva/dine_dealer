import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
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
              const SizedBox(height: 40),
              Image.asset('assets/images/onboarding1.png'),
              const SizedBox(height: 40),
              Text(
                'ЗАГОЛОВОК',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Georgia',
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Подзаголовок',
                style: const TextStyle(fontSize: 16, color: Colors.black87),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
