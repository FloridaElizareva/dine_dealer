import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFFF9F6EE),
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(LucideIcons.calendarDays),
          label: 'Bookings',
        ),
        BottomNavigationBarItem(
          icon: Icon(LucideIcons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(LucideIcons.heart),
          label: 'Favourites',
        ),
        BottomNavigationBarItem(
          icon: Icon(LucideIcons.user),
          label: 'Profile',
        ),
      ],
    );
  }
}
