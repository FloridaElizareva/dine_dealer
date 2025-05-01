import 'package:dine_dealer/core/theme/colors.dart';
import 'package:flutter/material.dart';

class BookingCard extends StatelessWidget {
  final String image;
  final String restaurant;
  //final String? cuisine;
  //final String? flagEmoji;
  //final double? rating;
  final String name;
  final String? people;
  final String date;
  final String address;

  const BookingCard({
    super.key,
    required this.image,
    required this.restaurant,
    //required this.cuisine,
    //required this.flagEmoji,
    //required this.rating,
    required this.name,
    required this.people,
    required this.date,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: DDColors.bg,
      margin: const EdgeInsets.only(bottom: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(image, fit: BoxFit.cover, height: 160, width: double.infinity),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEAE5D9),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text('flagEmoji cuisine', style: const TextStyle(fontSize: 12)),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      restaurant,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star, size: 16, color: Colors.amber),
                        const SizedBox(width: 4),
                        //Text(rating.toString()),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.person_outline, size: 16),
                    const SizedBox(width: 4),
                    Text('$name · $people people'),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.calendar_today, size: 16),
                    const SizedBox(width: 4),
                    Text(date),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined, size: 16),
                    const SizedBox(width: 4),
                    Text(address),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
