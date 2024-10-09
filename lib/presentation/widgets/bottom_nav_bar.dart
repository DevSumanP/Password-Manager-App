import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:password_manager/core/constants/app_colors.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppColors.backgroundColor,
      type: BottomNavigationBarType.fixed,
      elevation: 8,
      currentIndex: currentIndex,
      unselectedItemColor: const Color.fromARGB(255, 78, 78, 78),
      selectedItemColor: const Color.fromARGB(255, 1, 165, 23),
      onTap: onTap,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: Icon(IconlyLight.home),
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: Icon(IconlyLight.lock),
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: Icon(IconlyLight.notification),
            ),
            label: ''),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: Icon(
              IconlyLight.profile,
            ),
          ),
          label: '',
        ),
      ],
    );
  }
}
