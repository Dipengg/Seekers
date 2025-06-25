import 'package:flutter/material.dart';
import 'package:seekers/lost_and_found/catalog/catalog_item.dart';

Widget buildSearchBar({
  required TextEditingController controller,
  required Function(String) onChanged,
  required Function(String) onSubmitted,
  required VoidCallback onClear,
  required VoidCallback onClearAll,
  required bool showClearAll,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 21),
    child: Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                  spreadRadius: 0,
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
                  color: Color(0xFF7F0408),
                  size: 22,
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        if (showClearAll) ...[
          const SizedBox(width: 12),
          GestureDetector(
            onTap: onClearAll,
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Icon(
                Icons.delete_outline,
                color: Color(0xFFD32F2F),
                size: 22,
              ),
            ),
          ),
        ],
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
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
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
          .where((s) => s.toLowerCase().contains(controllerText.toLowerCase()))
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

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 21),
        child: Text(
          'Recent Searches',
          style: TextStyle(
            color: Color(0xFF7F0408),
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: 'Open Sans',
          ),
        ),
      ),
      const SizedBox(height: 16),
      Expanded(
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 21),
          itemCount: filtered.length,
          itemBuilder: (context, index) {
            final search = filtered[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: InkWell(
                onTap: () => onTap(search),
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          search,
                          style: const TextStyle(
                            color: Color(0xFF333333),
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Open Sans',
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF999999),
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    ],
  );
}
