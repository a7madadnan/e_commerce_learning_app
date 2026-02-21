import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const MainBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 12,
      ),
      items: [
        _buildNavItem("الرئيسية", "assets/icons/HomeSmile.svg", 0),
        _buildNavItem("الفئات", "assets/icons/Shop.svg", 1),
        _buildNavItem("الطلبات", "assets/icons/Box.svg", 2),
        _buildNavItem("حسابي", "assets/icons/UserRounded.svg", 3),
      ],
    );
  }

  BottomNavigationBarItem _buildNavItem(String label, String iconPath, int index) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: SvgPicture.asset(
          iconPath,
          width: 24,
          height: 24,
          colorFilter: ColorFilter.mode(
            currentIndex == index ? Colors.orange : Colors.grey,
            BlendMode.srcIn,
          ),
        ),
      ),
      label: label,
    );
  }
}