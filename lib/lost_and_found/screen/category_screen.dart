import 'package:flutter/material.dart';
import 'dart:async';
import 'package:seekers/lost_and_found/catalog/catalog_item.dart';
import 'package:seekers/lost_and_found/catalog/catalog_item_card.dart';
import 'package:seekers/lost_and_found/catalog/catalog_detail_screen.dart';
import 'package:seekers/lost_and_found/screen/claim_form_screen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  final List<Map<String, dynamic>> categories = const [
    {'icon': Icons.work_outline, 'label': 'Bag', 'key': 'Bag'},
    {'icon': Icons.watch_outlined, 'label': 'Accessories', 'key': 'Accessories'},
    {'icon': Icons.checkroom_outlined, 'label': 'Clothes', 'key': 'Clothes'},
    {'icon': Icons.smartphone_outlined, 'label': 'Electronic', 'key': 'Electronic'},
    {'icon': Icons.description_outlined, 'label': 'Document', 'key': 'Document'},
    {'icon': Icons.local_cafe_outlined, 'label': 'Tumbler', 'key': 'Tumbler'},
    {'icon': Icons.restaurant_outlined, 'label': 'FNB', 'key': 'FNB'},
    {'icon': Icons.directions_car_outlined, 'label': 'Automotive', 'key': 'Automotive'},
    {'icon': Icons.directions_walk, 'label': 'Footwear', 'key': 'Footwear'},
    {'icon': Icons.child_care, 'label': 'Kids Stuff', 'key': 'Kids Stuff'},
    {'icon': Icons.palette_outlined, 'label': 'Cosmetic', 'key': 'Cosmetic'},
    {'icon': Icons.more_horiz, 'label': 'Others Item', 'key': 'Others'},
  ];

  final List<String> carouselImages = const [
    'images/kcic1.png',
    'images/kcic2.png',
    'images/kcic3.png',
  ];

  // Data catalog items - sama seperti di CatalogScreen
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

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentPage < carouselImages.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    });
  }

  void _onCategoryTap(String categoryKey, String categoryLabel) {
    // Navigate to category items screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryItemsScreen(
          categoryKey: categoryKey,
          categoryLabel: categoryLabel,
          catalogItems: _catalogItems,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'images/bg_category.png',
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: const Icon(Icons.arrow_back_ios,
                            color: Colors.white),
                      ),
                      const Expanded(child: SizedBox()),
                      const Text(
                        'Category',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.5,
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      const SizedBox(width: 24),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(36),
                        topRight: Radius.circular(36),
                      ),
                    ),
                    child: Column(
                      children: [
                        // Carousel
                        SizedBox(
                          height: 180,
                          child: Stack(
                            children: [
                              PageView.builder(
                                controller: _pageController,
                                onPageChanged: (index) {
                                  setState(() {
                                    _currentPage = index;
                                  });
                                  _timer?.cancel();
                                  _startAutoSlide();
                                },
                                itemCount: carouselImages.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 8,
                                          offset: const Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Image.asset(
                                        carouselImages[index],
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        height: double.infinity,
                                      ),
                                    ),
                                  );
                                },
                              ),
                              // Page indicators
                              Positioned(
                                bottom: 12,
                                left: 0,
                                right: 0,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(
                                    carouselImages.length,
                                    (index) => Container(
                                      width: 8,
                                      height: 8,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 4),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: _currentPage == index
                                            ? Colors.black
                                            : Colors.black.withOpacity(0.3),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 24),

                        Expanded(
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              double availableHeight = constraints.maxHeight;
                              double spacing = 12;
                              double cardHeight =
                                  (availableHeight - (spacing * 3)) /
                                      4; // 4 rows

                              return Column(
                                children: [
                                  SizedBox(
                                    height: cardHeight,
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: _CategoryCard(
                                          icon: categories[0]['icon'],
                                          label: categories[0]['label'],
                                          onTap: () => _onCategoryTap(
                                            categories[0]['key'],
                                            categories[0]['label'],
                                          ),
                                        )),
                                        const SizedBox(width: 12),
                                        Expanded(
                                            child: _CategoryCard(
                                          icon: categories[1]['icon'],
                                          label: categories[1]['label'],
                                          onTap: () => _onCategoryTap(
                                            categories[1]['key'],
                                            categories[1]['label'],
                                          ),
                                        )),
                                        const SizedBox(width: 12),
                                        Expanded(
                                            child: _CategoryCard(
                                          icon: categories[2]['icon'],
                                          label: categories[2]['label'],
                                          onTap: () => _onCategoryTap(
                                            categories[2]['key'],
                                            categories[2]['label'],
                                          ),
                                        )),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  SizedBox(
                                    height: cardHeight,
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: _CategoryCard(
                                          icon: categories[3]['icon'],
                                          label: categories[3]['label'],
                                          onTap: () => _onCategoryTap(
                                            categories[3]['key'],
                                            categories[3]['label'],
                                          ),
                                        )),
                                        const SizedBox(width: 12),
                                        Expanded(
                                            child: _CategoryCard(
                                          icon: categories[4]['icon'],
                                          label: categories[4]['label'],
                                          onTap: () => _onCategoryTap(
                                            categories[4]['key'],
                                            categories[4]['label'],
                                          ),
                                        )),
                                        const SizedBox(width: 12),
                                        Expanded(
                                            child: _CategoryCard(
                                          icon: categories[5]['icon'],
                                          label: categories[5]['label'],
                                          onTap: () => _onCategoryTap(
                                            categories[5]['key'],
                                            categories[5]['label'],
                                          ),
                                        )),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  SizedBox(
                                    height: cardHeight,
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: _CategoryCard(
                                          icon: categories[6]['icon'],
                                          label: categories[6]['label'],
                                          onTap: () => _onCategoryTap(
                                            categories[6]['key'],
                                            categories[6]['label'],
                                          ),
                                        )),
                                        const SizedBox(width: 12),
                                        Expanded(
                                            child: _CategoryCard(
                                          icon: categories[7]['icon'],
                                          label: categories[7]['label'],
                                          onTap: () => _onCategoryTap(
                                            categories[7]['key'],
                                            categories[7]['label'],
                                          ),
                                        )),
                                        const SizedBox(width: 12),
                                        Expanded(
                                            child: _CategoryCard(
                                          icon: categories[8]['icon'],
                                          label: categories[8]['label'],
                                          onTap: () => _onCategoryTap(
                                            categories[8]['key'],
                                            categories[8]['label'],
                                          ),
                                        )),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  SizedBox(
                                    height: cardHeight,
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: _CategoryCard(
                                          icon: categories[9]['icon'],
                                          label: categories[9]['label'],
                                          onTap: () => _onCategoryTap(
                                            categories[9]['key'],
                                            categories[9]['label'],
                                          ),
                                        )),
                                        const SizedBox(width: 12),
                                        Expanded(
                                            child: _CategoryCard(
                                          icon: categories[10]['icon'],
                                          label: categories[10]['label'],
                                          onTap: () => _onCategoryTap(
                                            categories[10]['key'],
                                            categories[10]['label'],
                                          ),
                                        )),
                                        const SizedBox(width: 12),
                                        Expanded(
                                            child: _CategoryCard(
                                          icon: categories[11]['icon'],
                                          label: categories[11]['label'],
                                          onTap: () => _onCategoryTap(
                                            categories[11]['key'],
                                            categories[11]['label'],
                                          ),
                                        )),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _CategoryCard({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF7F0408),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      icon,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Flexible(
                  flex: 1,
                  child: Text(
                    label,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                      letterSpacing: 0.2,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Screen untuk menampilkan item berdasarkan kategori menggunakan CatalogItemCard
class CategoryItemsScreen extends StatefulWidget {
  final String categoryKey;
  final String categoryLabel;
  final List<CatalogItem> catalogItems;

  const CategoryItemsScreen({
    super.key,
    required this.categoryKey,
    required this.categoryLabel,
    required this.catalogItems,
  });

  @override
  State<CategoryItemsScreen> createState() => _CategoryItemsScreenState();
}

class _CategoryItemsScreenState extends State<CategoryItemsScreen> {
  List<CatalogItem> get _filteredItems {
    return widget.catalogItems
        .where((item) => item.category == widget.categoryKey)
        .toList();
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
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back_ios, size: 20, color: Color(0xFF7F0408)),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      widget.categoryLabel,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ),
                  Text(
                    '${_filteredItems.length} items',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            
            // Content
            Expanded(
              child: _filteredItems.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.inbox_outlined,
                            size: 80,
                            color: Colors.grey[400],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Tidak ada item untuk kategori ${widget.categoryLabel}',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )
                  : SingleChildScrollView(
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
}