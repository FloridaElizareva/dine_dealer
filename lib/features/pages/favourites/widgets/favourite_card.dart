import 'package:dine_dealer/core/assets/fonts.gen.dart';
import 'package:dine_dealer/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class FavouriteCard extends StatelessWidget {
  //final String imageUrl;
  final image;
  final String title;
  final double rating;
  final String address;
  final int reviews;

  const FavouriteCard({
    Key? key,
    //required this.imageUrl,
    required this.image,
    required this.title,
    required this.rating,
    required this.address,
    required this.reviews,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        height: 315,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
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
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  image,
                  //imageUrl,
                  height: 143,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            fontFamily: FontFamily.robotoSerif,
                          ),
                        ),
                      ),
                      const Icon(
                        LucideIcons.heart,
                        size: 24,
                        color: Colors.orange,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.star, size: 18, color: Colors.amber),
                      const SizedBox(width: 4),
                      Text(
                        rating.toString(),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: FontFamily.manrope,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        address,
                        style: const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '$reviews reviews',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontFamily: FontFamily.manrope,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF1F1F1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          LucideIcons.map,
                          size: 22,
                          color: DDColors.grey_yellow,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: SizedBox(
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(35),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                            ),
                            child: Text(
                              'Book Now',
                              style: TextStyle(
                                fontSize: 14,
                                color: DDColors.bg,
                                fontWeight: FontWeight.w500,
                                fontFamily: FontFamily.manrope,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
