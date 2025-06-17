import 'package:flutter/material.dart';
import 'package:seekers/lost_and_found/screen/home_screen.dart';
import 'package:seekers/lost_and_found/bottom_navigation.dart';
import 'package:seekers/lost_and_found/screen/profile_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  void _onTabSelected(BuildContext context, int index) {
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
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
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            _buildSearchBar(),
            const SizedBox(height: 21),
            const RecentSearches(),
            const Spacer(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationWidget(
        currentIndex: 0,
        onTap: (index) => _onTabSelected(context, index),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 21),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Search your item here...',
                  hintStyle: TextStyle(
                    color: Color(0xFFBFBFBF),
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    letterSpacing: 0.33,
                  ),
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 15),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: const Icon(
              Icons.delete,
              color: Color(0xFF7F0408),
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}

class RecentSearches extends StatefulWidget {
  const RecentSearches({super.key});

  @override
  _RecentSearchesState createState() => _RecentSearchesState();
}

class _RecentSearchesState extends State<RecentSearches> {
  // Daftar sementara untuk recent searches
  final List<String> _recentSearches = [
    'Tas Kanken',
    'Boneka Labubu',
    'HP',
    'Tas Eiger',
  ];

  void _removeSearchItem(String item) {
    setState(() {
      _recentSearches.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 21),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Recent Searches',
            style: TextStyle(
              color: Color(0xFF7F0408),
              fontSize: 16,
              fontWeight: FontWeight.w700,
              fontFamily: 'Open Sans',
              letterSpacing: 0.3,
            ),
          ),
          const SizedBox(height: 26),
          ..._recentSearches.map((text) => _buildSearchItem(text)),
        ],
      ),
    );
  }

  Widget _buildSearchItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(
                Icons.access_time,
                color: Colors.grey,
                size: 24,
              ),
              const SizedBox(width: 10),
              Text(
                text,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Open Sans',
                  letterSpacing: 0.3,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () => _removeSearchItem(text),
            child: const Icon(
              Icons.close,
              color: Colors.grey,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
