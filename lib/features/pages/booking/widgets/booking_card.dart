import 'package:dine_dealer/core/assets/fonts.gen.dart';
import 'package:dine_dealer/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lucide_icons/lucide_icons.dart';

class BookingCard extends StatelessWidget {
  const BookingCard({
    super.key,
    required this.image,
    required this.restaurant,
    required this.name,
    required this.people,
    required this.date,
    required this.address,
    this.rating,
    this.flagEmoji,
    this.cuisine,
  });

  final String image;
  final String restaurant;
  final String name;
  final int people;
  final String? date;
  final String address;
  final double? rating;
  final String? flagEmoji;
  final String? cuisine;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: DDColors.bg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.grey.withOpacity(0.3),
          width: 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                image,
                height: 160,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (flagEmoji != null || cuisine != null)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEAE5D9),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '${flagEmoji ?? ''} ${cuisine ?? ''}'.trim(),
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        fontFamily: FontFamily.manrope,
                      ),
                    ),
                  ),
                
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        restaurant,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          fontFamily: FontFamily.robotoSerif,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.star, size: 18, color: Colors.amber),
                    const SizedBox(width: 4),
                    Text(
                      rating != null ? rating!.toStringAsFixed(1) : '–',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: FontFamily.manrope,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12,),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/person.svg',
                      width: 26,
                      height: 26,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '$name · $people people',
                      style: const TextStyle(
                        fontSize: 17,
                        fontFamily: FontFamily.manrope,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/calendar.svg',
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      date ?? '',
                      style: const TextStyle(
                        fontSize: 17,
                        fontFamily: FontFamily.manrope,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/position.svg',
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        address,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 17,
                          color: Colors.grey,
                          fontFamily: FontFamily.manrope,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
