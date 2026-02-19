import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:auto_route/auto_route.dart';

// import ';
@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(child: _buildHeader()),
            Container(child: _searchbar()),
            SizedBox(height: 10.0),
            _buildbannerimage(),
          ],
        ),
      ),
      bottomNavigationBar: MainBottomNav(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

Widget _buildHeader() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          "assets/images/logo.png",
          width: 113,
          height: 24,
          fit: BoxFit.contain,
        ),
        Row(
          children: [
            // اليمين: ا
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                "assets/icons/BagSmile.svg",
                width: 24,
                height: 24,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                "assets/icons/nav.svg",
                width: 24,
                height: 24,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

// search bar

Widget _searchbar() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    child: Container(
      // height: 50,
      decoration: BoxDecoration(
        color: Color(0xFFF7F7F8),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'ابحث هنا عن المنتجات ',
          hintStyle: TextStyle(fontSize: 12, color: Color(0xFFAFB4C0)),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(
              "assets/icons/Magnifer.svg",
              width: 24,
              height: 24,
            ),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(
              "assets/icons/Camera.svg",
              width: 24,
              height: 24,
            ),
          ),
        ),
      ),
    ),
  );
}

Widget _buildbannerimage() {
  return Image.asset(
    "assets/images/banner.png",
    height: 150,

    // width: double.infinity,
    fit: BoxFit.cover,
  );
}

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
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 12,
      ),
      items: [
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: SvgPicture.asset(
              "assets/icons/HomeSmile.svg",
              width: 24,
              height: 24,
            ),
          ),
          label: "الرئيسية ",
        ),

        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: SvgPicture.asset(
              "assets/icons/Shop.svg",
              width: 24,
              height: 24,
            ),
          ),
          label: "الفئات",
        ),

        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: SvgPicture.asset(
              "assets/icons/Box.svg",
              width: 24,
              height: 24,
            ),
          ),
          label: "الطلبات",
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: SvgPicture.asset(
              "assets/icons/UserRounded.svg",
              width: 24,
              height: 24,
            ),
          ),
          label: "حسابي",
        ),
      ],
    );
  }
}
