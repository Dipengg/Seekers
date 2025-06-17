import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 13, top: 21),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: const BoxDecoration(
            color: Color(0xFF7F0408),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(17),
              bottomLeft: Radius.circular(17),
              bottomRight: Radius.circular(17),
            ),
          ),
          child: Text(
            'Hallo Liona, aku Seeko!',
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 13),
          width: 283,
          padding: const EdgeInsets.fromLTRB(10, 16, 10, 20),
          decoration: BoxDecoration(
            color: const Color(0xFF7F0408),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.help_rounded,
                    color: Colors.white,
                    size: 25,
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      'Silakan pilih topik yang ingin Anda tanyakan',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              _buildDivider(),
              _buildTopicItem('Kehilangan barang? Laporkan di sini'),
              _buildDivider(),
              _buildTopicItem('Bagaimana cara klaim barang ditemukan?'),
              _buildDivider(),
              _buildTopicItem('Apa status klaim barang saya?'),
              _buildDivider(),
              _buildTopicItem('Apakah barang saya sudah ditemukan?'),
              _buildDivider(),
              Center(
                child: Text(
                  'Chat Customer Service',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: -0.14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 1,
      color: Colors.white,
    );
  }

  Widget _buildTopicItem(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white,
              letterSpacing: -0.14,
            ),
          ),
        ),
        const Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
          size: 16,
        ),
      ],
    );
  }
}
