import 'package:dine_dealer/core/assets/fonts.gen.dart';
import 'package:dine_dealer/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lucide_icons/lucide_icons.dart';

class FavouriteCard extends StatelessWidget {
  //final String imageUrl;
  final image;
  final String title;
  final double? rating;
  final String address;
  final int? reviews;

  const FavouriteCard({
    Key? key,
    //required this.imageUrl,
    required this.image,
    required this.title,
    this.rating,
    required this.address,
    this.reviews,
  }) : super(key: key);

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
                    SvgPicture.asset(
                      'assets/images/like.svg',
                      width: 20,
                      height: 20,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.star, size: 18, color: Colors.amber),
                    const SizedBox(width: 4),
                    Text(
                      rating != null ? rating.toString() : '–',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: FontFamily.manrope,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        address,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${reviews ?? 0} reviews',
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
                            //padding: const EdgeInsets.symmetric(vertical: 14),
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
                SizedBox(
                  height: 15,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
