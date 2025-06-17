import 'package:flutter/material.dart';

class NotificationItem extends StatelessWidget {
  final String title;
  final String message;
  final String time;
  final IconData icon;
  final bool hasLearnMore;
  final bool isRejected;
  final bool isPastWeek;
  final VoidCallback? onLearnMoreTap; // Tambahkan callback untuk learn more

  const NotificationItem({
    super.key,
    required this.title,
    required this.message,
    required this.time,
    required this.icon,
    this.hasLearnMore = false,
    this.isRejected = false,
    this.isPastWeek = false,
    this.onLearnMoreTap, // Tambahkan parameter callback
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isRejected ? const Color(0xFFFFEDED) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 40,
                color: const Color(0xFF7F0408),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Color(0xFF7F0408),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 4),
                    RichText(
                      text: TextSpan(
                        children: _buildMessageSpans(message),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 1.4,
                          color: Color(0xFF4A4A4A),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 52, top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  time,
                  style: const TextStyle(
                    color: Color(0xFFBBBBBB),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.5,
                  ),
                ),
                if (hasLearnMore)
                  GestureDetector(
                    onTap: onLearnMoreTap ?? () {
                      // Default navigation jika onLearnMoreTap tidak disediakan
                      Navigator.pushNamed(context, '/detail-notification');
                    },
                    child: const Row(
                      children: [
                        Text(
                          'Learn more',
                          style: TextStyle(
                            color: Color(0xFFBBBBBB),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(Icons.arrow_forward_ios,
                            size: 12, color: Color(0xFFBBBBBB)),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<TextSpan> _buildMessageSpans(String message) {
    final spans = <TextSpan>[];

    final parts = message.split(' ');
    for (final part in parts) {
      spans.add(TextSpan(
        text: '$part ',
        style: TextStyle(
          color: part.contains('rejected') || part.contains('Tas Kanken')
              ? const Color(0xFF7F0408)
              : const Color(0xFF4A4A4A),
        ),
      ));
    }

    return spans;
  }
}