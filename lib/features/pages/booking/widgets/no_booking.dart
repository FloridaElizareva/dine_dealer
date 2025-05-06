import 'package:dine_dealer/core/assets/fonts.gen.dart';
import 'package:dine_dealer/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class NoBooking extends StatelessWidget {
  const NoBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 130),
        Center(
          child: Image.asset(
            'assets/images/noBooking.png',
            //height: 238,
            //width: 207,
          ),
        ),
        const SizedBox(height: 24),
        Center(
          child: Text(
            'No upcoming bookings.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: DDColors.ddBlack,
              fontWeight: FontWeight.w400,
              fontFamily: FontFamily.manrope,
            ),
          ),
        ),
        Center(
          child: Text(
            'Ready to reserve your next table?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: DDColors.ddBlack,
              fontWeight: FontWeight.w400,
              fontFamily: FontFamily.manrope,
            ),
          ),
        ),
        const SizedBox(height: 40),
        Center(
          child: SizedBox(
            width: double.infinity,
            height: 65,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.search),
              label: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                
                children: [
                  Icon(
                    LucideIcons.search,
                    size: 24,
                    color: DDColors.bg,
                  ),
                  SizedBox(width: 8),
                  Center(
                    child: Text(
                      'Find Restaurants',
                      style: TextStyle(
                        fontSize: 20,
                        color: DDColors.bg,
                        fontWeight: FontWeight.w400,
                        fontFamily: FontFamily.manrope,
                      ),
                    ),
                  ),
                ],
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: DDColors.ddBlack,
                padding: const EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(36),
                ),
                //textStyle: const TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
