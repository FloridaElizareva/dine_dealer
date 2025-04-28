import 'package:dine_dealer/core/assets/fonts.gen.dart';
import 'package:dine_dealer/core/ui_kit/widgets/custom_bottom_nav_bar.dart';
import 'package:dine_dealer/features/pages/favourites/widgets/favourite_card.dart';
import 'package:flutter/material.dart';
 

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F6EE),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          'Favourites',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            fontFamily: FontFamily.robotoSerif,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          FavouriteCard(
            image: 'assets/images/pasta.jpg',
            title: 'Trattoria da Luigi',
            rating: 4.5,
            address: 'Via Lagrange 47',
            reviews: 768,
          ),
          SizedBox(height: 20),
          FavouriteCard(
            image: 'assets/images/pasta.jpg',
            title: 'La Pergola',
            rating: 4.6,
            address: 'Piazza San Carlo 121',
            reviews: 1507,
          ),
          FavouriteCard(
            image: 'assets/images/pasta.jpg',
            title: 'La Pergola',
            rating: 4.6,
            address: 'Piazza San Carlo 121',
            reviews: 1507,
          ),
          FavouriteCard(
            image: 'assets/images/pasta.jpg',
            title: 'La Pergola',
            rating: 4.6,
            address: 'Piazza San Carlo 121',
            reviews: 1507,
          ),
        ],
      ),
    );
  }
}
