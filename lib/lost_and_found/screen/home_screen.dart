import 'package:flutter/material.dart';
import 'package:seekers/lost_and_found/bottom_navigation.dart';
import 'package:seekers/lost_and_found/screen/profile_screen.dart';
import 'package:seekers/lost_and_found/screen/search_screen.dart';
import 'package:seekers/lost_and_found/widgets/catalog_widget.dart';
import 'package:seekers/lost_and_found/widgets/categories_widget.dart';
import 'package:seekers/lost_and_found/widgets/header_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _onTabSelected(BuildContext context, int index) {
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SearchScreen()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProfileScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: const SafeArea(
        child: Column(
          children: [
            HeaderWidget(),
            SizedBox(height: 17),
            CategoriesWidget(),
            SizedBox(height: 32),
            Expanded(
              child: CatalogWidget(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationWidget(
        currentIndex: 1,
        onTap: (index) => _onTabSelected(context, index),
      ),
    );
  }
}
