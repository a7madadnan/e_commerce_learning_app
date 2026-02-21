import 'package:e_commerce_learning_app/home/bottom_nav/main_bottom_nav.dart';
import 'package:e_commerce_learning_app/home/widget/banner_widget.dart';
import 'package:e_commerce_learning_app/home/widget/categories_widget.dart';
import 'package:e_commerce_learning_app/home/widget/header_widget.dart';
import 'package:e_commerce_learning_app/home/widget/search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:auto_route/auto_route.dart';

import 'package:e_commerce_learning_app/home/view/catogary_model.dart';

// import ';
@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int selectedCategoryIndex = 0;

  late final List<CategoryTab> _categories;

  @override
  void initState() {
    super.initState();
    _initializeCategories();
  }

  void _initializeCategories() {
    _categories = [
      CategoryTab(id: 1, name: 'الكل'),
      CategoryTab(id: 2, name: 'كيبورد & سماعات'),
      CategoryTab(id: 3, name: 'موسيقى & تجميل'),
      CategoryTab(id: 4, name: 'أجهزة ذكية'),
      CategoryTab(id: 5, name: 'معدات تصوير'),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // الحصول على التصنيف المحدد
    if (index < _categories.length) {
      final selectedCategory = _categories[index];
      print(
        'تم اختيار الفئة: ${selectedCategory.name} (ID: ${selectedCategory.id})',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const HeaderWidget(),
            const SearchBarWidget(),
            const BannerWidget(),
            SizedBox(height: 10.0),
            // CategoriesWidget(
            //   categories: _categories,
            //   selectedIndex: _selectedIndex,
            //   onCategoryTap: _onItemTapped,
            // ),
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
