import 'package:flutter/material.dart';
import 'package:seekers/lost_and_found/chat/chat_header.dart';
import 'package:seekers/lost_and_found/chat/chat_input.dart';
import 'package:seekers/lost_and_found/chat/chat_message.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/background_chat.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Column(
              children: [
                ChatHeader(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ChatMessage(),
                        SizedBox(height: 16),
                        Center(
                          child: SizedBox(
                            width: 98,
                            height: 104,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ChatInput(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
