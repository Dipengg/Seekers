import 'package:flutter/material.dart';
import 'package:seekers/lost_and_found/screen/catalog_screen.dart';
import 'package:seekers/lost_and_found/screen/claim_form_screen.dart';
import 'package:seekers/lost_and_found/catalog/catalog_item.dart';

class CatalogWidget extends StatelessWidget {
  const CatalogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Catalog',
                style: TextStyle(
                  color: Color(0xFF7F0408),
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.5,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CatalogScreen(),
                    ),
                  );
                },
                child: const Text(
                  'See All',
                  style: TextStyle(
                    color: Color(0xFF7F0408),
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),
        const Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                _CatalogItem(
                  image: 'images/sepatu_boots.jpg',
                  title: 'Sepatu Boots',
                  date: '27 June, 1:34 PM',
                  category: 'Footwear',
                  location: 'Tegalluar Summarecon Station',
                  catalogItem: CatalogItem(
                    id: '1',
                    title: 'Sepatu Boots',
                    category: 'Footwear',
                    location: 'Tegalluar Summarecon Station',
                    registrationNumber: 'T 1234',
                    date: '27 June, 1:34 PM',
                    imageUrl: 'images/sepatu_boots.jpg',
                    isClaimed: false,
                  ),
                ),
                SizedBox(height: 16),
                _CatalogItem(
                  image: 'images/iphone.png',
                  title: 'Iphone 16',
                  date: '27 June, 1:34 PM',
                  category: 'Electronic',
                  location: 'Padalarang Station',
                  catalogItem: CatalogItem(
                    id: '2',
                    title: 'Iphone 16',
                    category: 'Electronic',
                    location: 'Padalarang Station',
                    registrationNumber: 'T 1234',
                    date: '27 June, 1:34 PM',
                    imageUrl: 'images/iphone.png',
                    isClaimed: false,
                  ),
                ),
                SizedBox(height: 16),
                _CatalogItem(
                  image: 'images/toy_story.jpg',
                  title: 'Toy Story',
                  date: '27 June, 1:34 PM',
                  category: 'Kids Stuff',
                  location: 'Karawang Station',
                  catalogItem: CatalogItem(
                    id: '3',
                    title: 'Toy Story',
                    category: 'Kidstuff',
                    location: 'Karawang Station',
                    registrationNumber: 'T 1234',
                    date: '27 June, 1:34 PM',
                    imageUrl: 'images/toy_story.jpg',
                    isClaimed: false,
                  ),
                ),
                SizedBox(height: 16),
                _CatalogItem(
                  image: 'images/jaket.jpg',
                  title: 'Jaket',
                  date: '27 June, 1:34 PM',
                  category: 'Clothes',
                  location: 'Halim Station',
                  catalogItem: CatalogItem(
                    id: '4',
                    title: 'Jaket',
                    category: 'Clothes',
                    location: 'Halim Station',
                    registrationNumber: 'T 1234',
                    date: '27 June, 1:34 PM',
                    imageUrl: 'images/jaket.jpg',
                    isClaimed: false,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _CatalogItem extends StatelessWidget {
  final String image;
  final String title;
  final String date;
  final String category;
  final String location;
  final CatalogItem catalogItem;

  const _CatalogItem({
    required this.image,
    required this.title,
    required this.date,
    required this.category,
    required this.location,
    required this.catalogItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: const Color(0xFFD9D9D9)),
      ),
      child: Row(
        children: [
          Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                decoration: BoxDecoration(
                  color: const Color(0xFF7F0408),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Found',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(height: 9),
              Image.asset(image, width: 102),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Date', style: TextStyle(fontSize: 12)),
                        const SizedBox(height: 8),
                        Text(
                          date,
                          style: const TextStyle(
                            fontSize: 10,
                            color: Color(0xFFA3A3A3),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Categories',
                            style: TextStyle(fontSize: 12)),
                        const SizedBox(height: 4),
                        Text(
                          category,
                          style: const TextStyle(
                            fontSize: 10,
                            color: Color(0xFFA3A3A3),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text('Location', style: TextStyle(fontSize: 12)),
                const SizedBox(height: 5),
                Text(
                  location,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Color(0xFFA3A3A3),
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ClaimFormScreen(
                            item: catalogItem,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF7F0408),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      textStyle: const TextStyle(fontSize: 10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 5),
                    ),
                    child: const Text('Claim'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
