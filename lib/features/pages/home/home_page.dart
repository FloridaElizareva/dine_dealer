import 'package:dine_dealer/core/theme/colors.dart';
import 'package:dine_dealer/features/pages/booking/booking_page.dart';
import 'package:dine_dealer/features/pages/profile/profile_page.dart';
import 'package:dine_dealer/features/pages/search/search_page.dart';
import 'package:flutter/material.dart';
import 'package:dine_dealer/core/ui_kit/widgets/custom_bottom_nav_bar.dart';
import 'package:dine_dealer/features/pages/favourites/favourites_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 2; 

  final List<Widget> _pages = const [
    BookingPage(),
    SearchPage(),
    FavouritesPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DDColors.bg,
      body: _pages[_selectedIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
