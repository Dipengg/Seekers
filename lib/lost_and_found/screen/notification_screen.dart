import 'package:flutter/material.dart';
import 'package:seekers/lost_and_found/notification/notification_header.dart';
import 'package:seekers/lost_and_found/notification/notification_list.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: const SafeArea(
          child: Column(
            children: [
              NotificationHeader(),
              Expanded(
                child: NotificationList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
