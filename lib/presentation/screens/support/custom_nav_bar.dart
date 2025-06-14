import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CustomNavBar extends StatelessWidget {
  final int selectedIndex;

  const CustomNavBar({super.key, required this.selectedIndex});

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.goNamed('home');
        break;
      case 1:
        context.goNamed('property');
        break;
      case 2:
        context.goNamed('login');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: GNav(
        padding: const EdgeInsets.symmetric(horizontal: 45),
        backgroundColor: Colors.white,
        color: const Color.fromARGB(255, 82, 82, 82),
        activeColor: Colors.black,
        selectedIndex: selectedIndex,
        onTabChange: (index) => _onItemTapped(context, index),
        tabs: const [
          GButton(icon: Icons.home, text: 'Home'),
          GButton(icon: Icons.location_on, text: 'Property'),
          GButton(icon: Icons.person, text: 'Login'),
        ],
      ),
    );
  }
}
