import 'package:flutter/material.dart';
import 'package:seekers/lost_and_found/screen/home_screen.dart';
import 'package:seekers/lost_and_found/bottom_navigation.dart';
import 'package:seekers/lost_and_found/screen/profile_screen.dart';
import 'package:seekers/lost_and_found/catalog/catalog_item.dart';
import 'package:seekers/lost_and_found/catalog/catalog_detail_screen.dart';
import 'package:seekers/lost_and_found/screen/claim_form_screen.dart';
import 'package:seekers/lost_and_found/widgets/search_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<CatalogItem> _searchResults = [];
  bool _isSearching = false;
  bool _showResults = false;
  bool _hasSearched = false;
  final List<String> _recentSearches = [
    'Tas Kanken',
    'Boneka Labubu',
    'Arai Helmet',
    'Tumbler Corkcicle'
  ];

  List<CatalogItem> get _catalogItems => [
        const CatalogItem(
            id: '1',
            title: 'Tas Hermes Birkin',
            category: 'Bag',
            location: 'Tegalluar St',
            registrationNumber: 'T 1234',
            date: '27/5 , 1:38 PM',
            imageUrl: 'images/tas_hermes.png',
            isClaimed: false),
        const CatalogItem(
            id: '2',
            title: 'Iphone 16',
            category: 'Electronic',
            location: 'Halim St',
            registrationNumber: 'T 1234',
            date: '27/5 , 1:38 PM',
            imageUrl: 'images/iphone_16.png',
            isClaimed: false),
        const CatalogItem(
            id: '3',
            title: 'Dokumen',
            category: 'Document',
            location: 'Tegalluar St',
            registrationNumber: 'T 1234',
            date: '27/5 , 1:38 PM',
            imageUrl: 'images/dokumen.png',
            isClaimed: true),
        const CatalogItem(
            id: '4',
            title: 'Jam Tangan ROLEX',
            category: 'Accessories',
            location: 'Halim St',
            registrationNumber: 'T 1234',
            date: '27/5 , 1:38 PM',
            imageUrl: 'images/jam_rolex.png',
            isClaimed: true),
        const CatalogItem(
            id: '5',
            title: 'Tumbler Corkcicle',
            category: 'Tumbler',
            location: 'Tegalluar St',
            registrationNumber: 'T 1234',
            date: '27/5 , 1:38 PM',
            imageUrl: 'images/tumbler.png',
            isClaimed: false),
        const CatalogItem(
            id: '6',
            title: 'Bakpia Tugu Jogja',
            category: 'FNB',
            location: 'Tegalluar St',
            registrationNumber: 'T 1234',
            date: '27/5 , 1:38 PM',
            imageUrl: 'images/bakpia.png',
            isClaimed: false),
        const CatalogItem(
            id: '7',
            title: 'Arai Helmet',
            category: 'Automotive',
            location: 'Tegalluar St',
            registrationNumber: 'T 1234',
            date: '27/5 , 1:38 PM',
            imageUrl: 'images/arai_helmet.png',
            isClaimed: false),
        const CatalogItem(
            id: '8',
            title: 'YSL Cushion',
            category: 'Cosmetic',
            location: 'Halim St',
            registrationNumber: 'T 1234',
            date: '27/5 , 1:38 PM',
            imageUrl: 'images/ysl_cushion.png',
            isClaimed: false),
        const CatalogItem(
            id: '9',
            title: 'Boneka LABUBU',
            category: 'Kids Stuff',
            location: 'Tegalluar St',
            registrationNumber: 'T 1234',
            date: '27/5 , 1:38 PM',
            imageUrl: 'images/labubu.png',
            isClaimed: true),
        const CatalogItem(
            id: '10',
            title: 'Tas Kanken',
            category: 'Bag',
            location: 'Tegalluar St',
            registrationNumber: 'T 1234',
            date: '16/10 , 1:27 PM',
            imageUrl: 'images/tas_kanken.png',
            isClaimed: false),
        const CatalogItem(
            id: '11',
            title: 'Sandal Yeezy',
            category: 'Clothes',
            location: 'Halim St',
            registrationNumber: 'T 1234',
            date: '27/5 , 1:38 PM',
            imageUrl: 'images/yeezy.png',
            isClaimed: false),
        const CatalogItem(
            id: '12',
            title: 'Airpods MAX',
            category: 'Electronic',
            location: 'Halim St',
            registrationNumber: 'T 1234',
            date: '27/5 , 1:38 PM',
            imageUrl: 'images/airpods_max.png',
            isClaimed: false),
      ];

  void _onTabSelected(BuildContext context, int index) {
    if (index == 1) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    } else if (index == 2) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const ProfileScreen()));
    }
  }

  void _performSearch(String query) {
    setState(() {
      _isSearching = true;
      _hasSearched = true;
    });

    Future.delayed(const Duration(milliseconds: 300), () {
      final trimmedQuery = query.trim().toLowerCase();

      if (trimmedQuery.isEmpty) {
        setState(() {
          _searchResults = [];
          _isSearching = false;
          _showResults = false;
          _hasSearched = false;
        });
        return;
      }

      final results = _catalogItems.where((item) {
        return item.title.toLowerCase().contains(trimmedQuery) ||
            item.category.toLowerCase().contains(trimmedQuery) ||
            item.location.toLowerCase().contains(trimmedQuery) ||
            item.registrationNumber.toLowerCase().contains(trimmedQuery);
      }).toList();

      setState(() {
        _searchResults = results;
        _isSearching = false;
        _showResults = true;
      });

      if (!_recentSearches.contains(query) && query.isNotEmpty) {
        setState(() {
          _recentSearches.insert(0, query);
          if (_recentSearches.length > 10) {
            _recentSearches.removeLast();
          }
        });
      }
    });
  }

  void _clearSearch() {
    _searchController.clear();
    setState(() {
      _searchResults = [];
      _showResults = false;
      _isSearching = false;
      _hasSearched = false;
    });
  }

  void _clearAllRecentSearches() {
    setState(() {
      _recentSearches.clear();
    });
  }

  void _onRecentSearchTap(String query) {
    _searchController.text = query;
    _performSearch(query);
  }

  void _removeSearchItem(String item) {
    setState(() {
      _recentSearches.remove(item);
    });
  }

  void _handleItemTap(CatalogItem item) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CatalogDetailScreen(item: item)),
    );
  }

  void _handleClaimPressed(CatalogItem item) {
    if (!item.isClaimed) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ClaimFormScreen(item: item)),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${item.title} sudah diklaim'),
          backgroundColor: Colors.orange,
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            buildSearchBar(
              controller: _searchController,
              onChanged: _performSearch,
              onSubmitted: _performSearch,
              onClear: _clearSearch,
              onClearAll: _clearAllRecentSearches,
              showClearAll: !_hasSearched && _recentSearches.isNotEmpty,
            ),
            const SizedBox(height: 21),
            Expanded(
              child: _hasSearched
                  ? buildSearchResults(
                      isSearching: _isSearching,
                      results: _searchResults,
                      onTap: _handleItemTap,
                      onClaimPressed: _handleClaimPressed,
                    )
                  : buildRecentSearches(
                      recentSearches: _recentSearches,
                      controllerText: _searchController.text,
                      onTap: _onRecentSearchTap,
                      onRemove: _removeSearchItem,
                    ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationWidget(
        currentIndex: 0,
        onTap: (index) => _onTabSelected(context, index),
      ),
    );
  }
}