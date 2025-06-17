import 'package:flutter/material.dart';
import 'package:seekers/lost_and_found/notification/detail_notif.dart';
import 'package:seekers/lost_and_found/notification/notification_item.dart';

class NotificationList extends StatelessWidget {
  const NotificationList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        const SizedBox(height: 16),
        const Text(
          'Today',
          style: TextStyle(
            color: Color(0xFFA3A3A3),
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: 'Inter',
          ),
        ),
        const SizedBox(height: 8),
        NotificationItem(
          title: 'CLAIM FORM',
          message:
              'Your item claim has been approved. Please collect your item',
          time: '13 minutes ago',
          icon: Icons.notifications,
          hasLearnMore: true,
          onLearnMoreTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DetailNotifPage(),
              ),
            );
          },
        ),
        const NotificationItem(
          title: 'CLAIM FORM',
          message:
              'Your form for Tas Kanken Item has been successfully submitted',
          time: '20 minutes ago',
          icon: Icons.notifications,
        ),
        const SizedBox(height: 16),
        const Text(
          'Last 7 days',
          style: TextStyle(
            color: Color(0xFFA3A3A3),
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: 'Inter',
          ),
        ),
        const SizedBox(height: 8),
        const NotificationItem(
          title: 'CLAIM FORM',
          message:
              'Your claim for the Arai Helmet has been rejected. Please check your details',
          time: '2 days ago',
          icon: Icons.error,
          isRejected: true,
          isPastWeek: true,
        ),
        const NotificationItem(
          title: 'CLAIM FORM',
          message:
              'Your claim for the Arai Helmet has been rejected. Please check your details',
          time: '2 days ago',
          icon: Icons.error,
          isRejected: true,
          isPastWeek: true,
        ),
        const NotificationItem(
          title: 'CLAIM FORM',
          message: 'Your form for Hermes Item has been successfully submitted',
          time: '20 minutes ago',
          icon: Icons.notifications,
          isPastWeek: true,
        ),
      ],
    );
  }
}
