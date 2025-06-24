import 'package:flutter/material.dart';
import 'package:seekers/lost_and_found/catalog/catalog_item.dart';

Widget buildSearchBar({
  required TextEditingController controller,
  required Function(String) onChanged,
  required Function(String) onSubmitted,
  required VoidCallback onClear,
}) {
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
              controller: controller,
              onChanged: onChanged,
              onFieldSubmitted: onSubmitted,
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
        GestureDetector(
          onTap: onClear,
          child: Container(
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
              Icons.clear,
              color: Color(0xFF7F0408),
              size: 24,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget buildSearchResults({
  required bool isSearching,
  required List<CatalogItem> results,
  required Function(CatalogItem) onTap,
  required Function(CatalogItem) onClaimPressed,
}) {
  if (isSearching) {
    return const Center(
      child: CircularProgressIndicator(color: Color(0xFF7F0408)),
    );
  }

  if (results.isEmpty) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_off, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text('No items found',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500)),
          SizedBox(height: 8),
          Text('Try searching with different keywords',
              style: TextStyle(fontSize: 14, color: Colors.grey)),
        ],
      ),
    );
  }

  return ListView.builder(
    padding: const EdgeInsets.symmetric(horizontal: 21),
    itemCount: results.length,
    itemBuilder: (context, index) {
      final item = results[index];
      return _buildItemCard(item, onTap, onClaimPressed);
    },
  );
}

Widget _buildItemCard(
  CatalogItem item,
  Function(CatalogItem) onTap,
  Function(CatalogItem) onClaimPressed,
) {
  return GestureDetector(
    onTap: () => onTap(item),
    child: Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[200],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  item.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.image, color: Colors.grey);
                  },
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          item.title,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: item.isClaimed
                              ? Colors.orange[100]
                              : Colors.green[100],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          item.isClaimed ? 'Claimed' : 'Available',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: item.isClaimed
                                ? Colors.orange[700]
                                : Colors.green[700],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.category,
                    style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.location_on,
                          size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          item.location,
                          style:
                              const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ),
                      Text(
                        item.date,
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        'Reg: ${item.registrationNumber}',
                        style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF7F0408),
                            fontWeight: FontWeight.w500),
                      ),
                      const Spacer(),
                      if (!item.isClaimed)
                        GestureDetector(
                          onTap: () => onClaimPressed(item),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color(0xFF7F0408),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Text(
                              'Claim',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget buildRecentSearches({
  required List<String> recentSearches,
  required String controllerText,
  required Function(String) onTap,
  required Function(String) onRemove,
}) {
  final filtered = controllerText.isEmpty
      ? recentSearches
      : recentSearches
          .where((s) => s.toLowerCase() == controllerText.toLowerCase())
          .toList();

  if (filtered.isEmpty) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.history, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text('No recent searches',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500)),
          SizedBox(height: 8),
          Text('Your search history will appear here',
              style: TextStyle(fontSize: 14, color: Colors.grey)),
        ],
      ),
    );
  }

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
        Expanded(
          child: ListView.builder(
            itemCount: filtered.length,
            itemBuilder: (context, index) {
              final search = filtered[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: GestureDetector(
                  onTap: () => onTap(search),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.access_time,
                              color: Colors.grey, size: 24),
                          const SizedBox(width: 10),
                          Text(
                            search,
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
                        onTap: () => onRemove(search),
                        child: const Icon(Icons.close,
                            color: Colors.grey, size: 24),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}
