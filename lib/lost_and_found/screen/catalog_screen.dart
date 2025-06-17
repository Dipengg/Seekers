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
          imageUrl:
              'https://cdn.builder.io/api/v1/image/assets/1825288418f94d298cd19cfb80ab8a08/f6263bb7909c8a242ec5d09963c726c449ad017e?placeholderIfAbsent=true',
          isClaimed: false,
        ),
        const CatalogItem(
          id: '2',
          title: 'Iphone 16',
          category: 'Electronic',
          location: 'Halim St',
          registrationNumber: 'T 1234',
          date: '27/5 , 1:38 PM',
          imageUrl:
              'https://cdn.builder.io/api/v1/image/assets/1825288418f94d298cd19cfb80ab8a08/6be882dfc09e8d65528477b4c079852ec85cfb3a?placeholderIfAbsent=true',
          isClaimed: false,
        ),
        const CatalogItem(
          id: '3',
          title: 'Dokumen',
          category: 'Document',
          location: 'Tegalluar St',
          registrationNumber: 'T 1234',
          date: '27/5 , 1:38 PM',
          imageUrl:
              'https://cdn.builder.io/api/v1/image/assets/1825288418f94d298cd19cfb80ab8a08/fdbee9d6b6ff4c469afd94b907fb30993e38f774?placeholderIfAbsent=true',
          isClaimed: true,
        ),
        const CatalogItem(
          id: '4',
          title: 'Jam Tangan ROLEX',
          category: 'Watch',
          location: 'Halim St',
          registrationNumber: 'T 1234',
          date: '27/5 , 1:38 PM',
          imageUrl:
              'https://cdn.builder.io/api/v1/image/assets/1825288418f94d298cd19cfb80ab8a08/3f25d202ed13ba34d7f8768c55e2645309d5ce94?placeholderIfAbsent=true',
          isClaimed: true,
        ),
        const CatalogItem(
          id: '5',
          title: 'Tumbler Corkcicle',
          category: 'Tumbler',
          location: 'Tegalluar St',
          registrationNumber: 'T 1234',
          date: '27/5 , 1:38 PM',
          imageUrl:
              'https://cdn.builder.io/api/v1/image/assets/1825288418f94d298cd19cfb80ab8a08/f6b8da76491d73b1dc077a634fafeb9d02ccdaf2?placeholderIfAbsent=true',
          isClaimed: false,
        ),
        const CatalogItem(
          id: '6',
          title: 'Bakpia Tugu Jogja',
          category: 'Food',
          location: 'Tegalluar St',
          registrationNumber: 'T 1234',
          date: '27/5 , 1:38 PM',
          imageUrl:
              'https://cdn.builder.io/api/v1/image/assets/1825288418f94d298cd19cfb80ab8a08/79113f3e70bd09c5cabbb01abb94a7e1feb0ac1d?placeholderIfAbsent=true',
          isClaimed: false,
        ),
        const CatalogItem(
          id: '7',
          title: 'Arai Helmet',
          category: 'Automotive',
          location: 'Tegalluar St',
          registrationNumber: 'T 1234',
          date: '27/5 , 1:38 PM',
          imageUrl:
              'https://cdn.builder.io/api/v1/image/assets/1825288418f94d298cd19cfb80ab8a08/5f7a7b06350f3c4c8f04a81f7fea6d5f43661e84?placeholderIfAbsent=true',
          isClaimed: false,
        ),
        const CatalogItem(
          id: '8',
          title: 'YSL Cushion',
          category: 'Cosmetic',
          location: 'Halim St',
          registrationNumber: 'T 1234',
          date: '27/5 , 1:38 PM',
          imageUrl:
              'https://cdn.builder.io/api/v1/image/assets/1825288418f94d298cd19cfb80ab8a08/9eb4a381b7f5927bb55c3078a463fe56e617b1f2?placeholderIfAbsent=true',
          isClaimed: false,
        ),
        const CatalogItem(
          id: '9',
          title: 'Boneka LABUBU',
          category: 'Kidstuff',
          location: 'Tegalluar St',
          registrationNumber: 'T 1234',
          date: '27/5 , 1:38 PM',
          imageUrl:
              'https://cdn.builder.io/api/v1/image/assets/1825288418f94d298cd19cfb80ab8a08/dd935958e95010b2ea03fc75e971bd2853770f4b?placeholderIfAbsent=true',
          isClaimed: true,
        ),
        const CatalogItem(
          id: '10',
          title: 'Tas Kanken',
          category: 'Bag',
          location: 'Tegalluar St',
          registrationNumber: 'T 1234',
          date: '16/10 , 1:27 PM',
          imageUrl:
              'https://cdn.builder.io/api/v1/image/assets/1825288418f94d298cd19cfb80ab8a08/db3ee6efcddf3ae4fa0d76b5b20a7496ab2f2b37?placeholderIfAbsent=true',
          isClaimed: false,
        ),
        const CatalogItem(
          id: '11',
          title: 'Sandal Yeezy',
          category: 'Clothes',
          location: 'Halim St',
          registrationNumber: 'T 1234',
          date: '27/5 , 1:38 PM',
          imageUrl:
              'https://cdn.builder.io/api/v1/image/assets/1825288418f94d298cd19cfb80ab8a08/53b69bc43bb8b98ef5066facb3a4feaf1ee25267?placeholderIfAbsent=true',
          isClaimed: false,
        ),
        const CatalogItem(
          id: '12',
          title: 'Airpods MAX',
          category: 'Electronic',
          location: 'Halim St',
          registrationNumber: 'T 1234',
          date: '27/5 , 1:38 PM',
          imageUrl:
              'https://cdn.builder.io/api/v1/image/assets/1825288418f94d298cd19cfb80ab8a08/2a3fc028de4a4f96eac7f7b483d225a3996247bf?placeholderIfAbsent=true',
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
          builder: (context) => ClaimFormScreen(
            item: item,
          ),
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
                                    onTap: () => _handleItemTap(
                                        item), // Navigasi ke detail
                                    onClaimPressed: () =>
                                        _handleClaimPressed(item),
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
            child: const Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Color(0xFF7F0408),
            ),
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
                const Icon(
                  Icons.tune,
                  size: 20,
                  color: Color(0xFF7F0408),
                ),
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
        border: Border.all(
          color: const Color(0xFF7F0408).withOpacity(0.3),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.filter_list,
            size: 14,
            color: Color(0xFF7F0408),
          ),
          const SizedBox(width: 4),
          Text(
            'Filters Applied (${_filteredItems.length} items)',
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF7F0408),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () {
              setState(() {
                _currentFilters = null;
              });
            },
            child: const Icon(
              Icons.close,
              size: 14,
              color: Color(0xFF7F0408),
            ),
          ),
        ],
      ),
    );
  }
}
