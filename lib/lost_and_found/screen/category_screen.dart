import 'package:flutter/material.dart';
import 'dart:async';

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
    {'icon': Icons.work_outline, 'label': 'Bag'},
    {'icon': Icons.watch_outlined, 'label': 'Accessories'},
    {'icon': Icons.checkroom_outlined, 'label': 'Clothes'},
    {'icon': Icons.smartphone_outlined, 'label': 'Electronic'},
    {'icon': Icons.description_outlined, 'label': 'Document'},
    {'icon': Icons.local_cafe_outlined, 'label': 'Tumbler'},
    {'icon': Icons.restaurant_outlined, 'label': 'FNB'},
    {'icon': Icons.directions_car_outlined, 'label': 'Automotive'},
    {'icon': Icons.directions_walk, 'label': 'Footwear'},
    {'icon': Icons.child_care, 'label': 'Kids Stuff'},
    {'icon': Icons.palette_outlined, 'label': 'Cosmetic'},
    {'icon': Icons.more_horiz, 'label': 'Others Item'},
  ];

  final List<String> carouselImages = const [
    'images/kcic1.png',
    'images/kcic2.png',
    'images/kcic3.png',
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
                                        )),
                                        const SizedBox(width: 12),
                                        Expanded(
                                            child: _CategoryCard(
                                          icon: categories[1]['icon'],
                                          label: categories[1]['label'],
                                        )),
                                        const SizedBox(width: 12),
                                        Expanded(
                                            child: _CategoryCard(
                                          icon: categories[2]['icon'],
                                          label: categories[2]['label'],
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
                                        )),
                                        const SizedBox(width: 12),
                                        Expanded(
                                            child: _CategoryCard(
                                          icon: categories[4]['icon'],
                                          label: categories[4]['label'],
                                        )),
                                        const SizedBox(width: 12),
                                        Expanded(
                                            child: _CategoryCard(
                                          icon: categories[5]['icon'],
                                          label: categories[5]['label'],
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
                                        )),
                                        const SizedBox(width: 12),
                                        Expanded(
                                            child: _CategoryCard(
                                          icon: categories[7]['icon'],
                                          label: categories[7]['label'],
                                        )),
                                        const SizedBox(width: 12),
                                        Expanded(
                                            child: _CategoryCard(
                                          icon: categories[8]['icon'],
                                          label: categories[8]['label'],
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
                                        )),
                                        const SizedBox(width: 12),
                                        Expanded(
                                            child: _CategoryCard(
                                          icon: categories[10]['icon'],
                                          label: categories[10]['label'],
                                        )),
                                        const SizedBox(width: 12),
                                        Expanded(
                                            child: _CategoryCard(
                                          icon: categories[11]['icon'],
                                          label: categories[11]['label'],
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

  const _CategoryCard({
    required this.icon,
    required this.label,
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
          onTap: () {
            print('Selected: $label');
          },
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
