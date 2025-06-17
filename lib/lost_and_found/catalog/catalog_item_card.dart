import 'package:flutter/material.dart';
import 'package:seekers/lost_and_found/catalog/catalog_item.dart';

class CatalogItemCard extends StatelessWidget {
  final CatalogItem item;
  final VoidCallback? onTap;
  final VoidCallback? onClaimPressed;

  const CatalogItemCard({
    super.key,
    required this.item,
    this.onTap,
    this.onClaimPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFE5E5E5), width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStatusBadge(),
            const SizedBox(height: 4),
            _buildItemImage(),
            const SizedBox(height: 4),
            _buildItemDetails(),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: const Color(0xFF7F0408),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Text(
        'Found',
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 7,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildItemImage() {
    return Container(
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[100],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          item.imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey[200],
              child: const Icon(
                Icons.image_not_supported,
                color: Colors.grey,
                size: 25,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildItemDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.title,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 9,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 2),
        Row(
          children: [
            Expanded(
              child: Text(
                item.category,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 7,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                item.location,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 7,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                ),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item.registrationNumber,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 7,
                color: Colors.grey,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              item.date,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 7,
                color: Colors.grey,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        _buildClaimButton(),
      ],
    );
  }

  Widget _buildClaimButton() {
    return SizedBox(
      height: 18,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: item.isClaimed ? null : onClaimPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              item.isClaimed ? Colors.grey[400] : const Color(0xFF7F0408),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.zero,
          elevation: 0,
        ),
        child: Text(
          item.isClaimed ? 'Claimed' : 'Claim',
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 7,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
