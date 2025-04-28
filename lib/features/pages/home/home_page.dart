import 'package:dine_dealer/core/ui_kit/widgets/custom_bottom_nav_bar.dart';
import 'package:dine_dealer/features/pages/favourites/favourites_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: CustomBottomNavBar(),
      body: FavouritesPage(),

    );
  }
}