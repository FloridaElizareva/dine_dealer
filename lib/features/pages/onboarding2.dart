import 'package:dine_dealer/core/assets/fonts.gen.dart';
import 'package:dine_dealer/features/pages/onboarding/widgets/plan_card.dart';
import 'package:flutter/material.dart';
import 'package:dine_dealer/core/theme/colors.dart';

class Onboarding2 extends StatelessWidget {
  const Onboarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DDColors.bg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  "DineDealer",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    fontFamily: FontFamily.robotoSerif,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                "Choose a plan & book!",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 26,
                  fontFamily: FontFamily.robotoSerif,
                ),
              ),
              const SizedBox(height: 16),
              PlanCard(
                title: "Starter",
                calls: "10 calls",
                price: "Start Small – \$9.99",
                color: DDColors.planCard,
              ),
              PlanCard(
                title: "Standard",
                calls: "25 calls",
                price: "Most Popular – \$19.99",
                color: DDColors.main,
                isHighlighted: true,
              ),
              PlanCard(
                title: "Advanced",
                calls: "50 calls",
                price: "Go Big – \$29.99",
                color: DDColors.planCard,
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    side: BorderSide(color: Colors.black, width: 1),
                  ),
                  child: const Text(
                    "Skip for now",
                    style: TextStyle(color: Colors.black, fontSize: 16),
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
