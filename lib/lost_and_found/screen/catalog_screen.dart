import 'package:flutter/material.dart';
import 'package:seekers/lost_and_found/catalog/catalog_detail_screen.dart';
import 'package:seekers/lost_and_found/catalog/catalog_filter.dart';
import 'package:seekers/lost_and_found/catalog/catalog_item.dart';
import 'package:seekers/lost_and_found/catalog/catalog_item_card.dart';
import 'package:seekers/lost_and_found/screen/claim_form_screen.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  Map<String, String>? _currentFilters;

  List<CatalogItem> get _catalogItems => [
        const CatalogItem(
          id: '1',
          title: 'Tas Hermes Birkin',
          category: 'Bag',
          location: 'Tegalluar St',
          registrationNumber: 'T 1234',
          date: '27/5 , 1:38 PM',
          imageUrl: 'images/tas_hermes.png',
          isClaimed: false,
        ),
        const CatalogItem(
          id: '2',
          title: 'Iphone 16',
          category: 'Electronic',
          location: 'Halim St',
          registrationNumber: 'T 1234',
          date: '27/5 , 1:38 PM',
          imageUrl: 'images/iphone_16.png',
          isClaimed: false,
        ),
        const CatalogItem(
          id: '3',
          title: 'Dokumen',
          category: 'Document',
          location: 'Tegalluar St',
          registrationNumber: 'T 1234',
          date: '27/5 , 1:38 PM',
          imageUrl: 'images/dokumen.png',
          isClaimed: true,
        ),
        const CatalogItem(
          id: '4',
          title: 'Jam Tangan ROLEX',
          category: 'Accessories',
          location: 'Halim St',
          registrationNumber: 'T 1234',
          date: '27/5 , 1:38 PM',
          imageUrl: 'images/jam_rolex.png',
          isClaimed: true,
        ),
        const CatalogItem(
          id: '5',
          title: 'Tumbler Corkcicle',
          category: 'Tumbler',
          location: 'Tegalluar St',
          registrationNumber: 'T 1234',
          date: '27/5 , 1:38 PM',
          imageUrl: 'images/tumbler.png',
          isClaimed: false,
        ),
        const CatalogItem(
          id: '6',
          title: 'Bakpia Tugu Jogja',
          category: 'FNB',
          location: 'Tegalluar St',
          registrationNumber: 'T 1234',
          date: '27/5 , 1:38 PM',
          imageUrl: 'images/bakpia.png',
          isClaimed: false,
        ),
        const CatalogItem(
          id: '7',
          title: 'Arai Helmet',
          category: 'Automotive',
          location: 'Tegalluar St',
          registrationNumber: 'T 1234',
          date: '27/5 , 1:38 PM',
          imageUrl: 'images/arai_helmet.png',
          isClaimed: false,
        ),
        const CatalogItem(
          id: '8',
          title: 'YSL Cushion',
          category: 'Cosmetic',
          location: 'Halim St',
          registrationNumber: 'T 1234',
          date: '27/5 , 1:38 PM',
          imageUrl: 'images/ysl_cushion.png',
          isClaimed: false,
        ),
        const CatalogItem(
          id: '9',
          title: 'Boneka LABUBU',
          category: 'Kids Stuff',
          location: 'Tegalluar St',
          registrationNumber: 'T 1234',
          date: '27/5 , 1:38 PM',
          imageUrl: 'images/labubu.png',
          isClaimed: true,
        ),
        const CatalogItem(
          id: '10',
          title: 'Tas Kanken',
          category: 'Bag',
          location: 'Tegalluar St',
          registrationNumber: 'T 1234',
          date: '16/10 , 1:27 PM',
          imageUrl: 'images/tas_kanken.png',
          isClaimed: false,
        ),
        const CatalogItem(
          id: '11',
          title: 'Sandal Yeezy',
          category: 'Clothes',
          location: 'Halim St',
          registrationNumber: 'T 1234',
          date: '27/5 , 1:38 PM',
          imageUrl: 'images/yeezy.png',
          isClaimed: false,
        ),
        const CatalogItem(
          id: '12',
          title: 'Airpods MAX',
          category: 'Electronic',
          location: 'Halim St',
          registrationNumber: 'T 1234',
          date: '27/5 , 1:38 PM',
          imageUrl: 'images/airpods_max.png',
          isClaimed: false,
        ),
      ];

  List<CatalogItem> get _filteredItems {
    if (_currentFilters == null) return _catalogItems;
    return _catalogItems.where((item) {
      if (_currentFilters!['category'] != 'ALL') {
        if (!item.category
            .toLowerCase()
            .contains(_currentFilters!['category']!.toLowerCase())) {
          return false;
        }
      }
      if (_currentFilters!['status'] != 'ALL') {
        if (_currentFilters!['status'] == 'Claimed' && !item.isClaimed) {
          return false;
        }
        if (_currentFilters!['status'] == 'Claim' && item.isClaimed) {
          return false;
        }
      }
      if (_currentFilters!['location'] != 'ALL') {
        if (!item.location
            .toLowerCase()
            .contains(_currentFilters!['location']!.toLowerCase())) {
          return false;
        }
      }
      return true;
    }).toList();
  }

  List<List<CatalogItem>> get _itemRows {
    final items = _filteredItems;
    List<List<CatalogItem>> rows = [];
    for (int i = 0; i < items.length; i += 3) {
      int end = (i + 3 < items.length) ? i + 3 : items.length;
      rows.add(items.sublist(i, end));
    }
    return rows;
  }

  void _showFilterScreen(BuildContext context) async {
    final result = await showModalBottomSheet<Map<String, String>>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const FilterScreen(),
    );
    if (result != null) {
      setState(() {
        _currentFilters = result;
      });
    }
  }

  void _handleItemTap(CatalogItem item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CatalogDetailScreen(item: item),
      ),
    );
  }

  void _handleClaimPressed(CatalogItem item) {
    if (!item.isClaimed) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ClaimFormScreen(item: item),
        ),
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            if (_currentFilters != null) _buildFilterIndicator(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: _itemRows.asMap().entries.map((entry) {
                    int rowIndex = entry.key;
                    List<CatalogItem> rowItems = entry.value;
                    return Column(
                      children: [
                        if (rowIndex > 0) const SizedBox(height: 20),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: rowItems.asMap().entries.map((itemEntry) {
                              int itemIndex = itemEntry.key;
                              CatalogItem item = itemEntry.value;
                              return Row(
                                children: [
                                  if (itemIndex > 0) const SizedBox(width: 12),
                                  CatalogItemCard(
                                    item: item,
                                    onTap: () => _handleItemTap(item),
                                    onClaimPressed: () => _handleClaimPressed(item),
                                  ),
                                ],
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios, size: 20, color: Color(0xFF7F0408)),
          ),
          const Text(
            'Catalog',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w500,
              letterSpacing: -0.5,
            ),
          ),
          GestureDetector(
            onTap: () => _showFilterScreen(context),
            child: Stack(
              children: [
                const Icon(Icons.tune, size: 20, color: Color(0xFF7F0408)),
                if (_currentFilters != null)
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Color(0xFF7F0408),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterIndicator() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF7F0408).withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF7F0408).withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.filter_list, size: 14, color: Color(0xFF7F0408)),
          const SizedBox(width: 4),
          Text(
            'Filters Applied (${_filteredItems.length} items)',
            style: const TextStyle(fontSize: 12, color: Color(0xFF7F0408), fontWeight: FontWeight.w500),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () => setState(() => _currentFilters = null),
            child: const Icon(Icons.close, size: 14, color: Color(0xFF7F0408)),
          ),
        ],
      ),
    );
  }
}
