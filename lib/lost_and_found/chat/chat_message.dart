import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatMessage extends StatefulWidget {
  const ChatMessage({super.key});

  @override
  State<ChatMessage> createState() => _ChatMessageState();
}

class _ChatMessageState extends State<ChatMessage> {
  bool showCustomerServiceMessage = false;
  bool showServiceTeamMessage = false;
  bool showAdminResponse = false;
  bool showLostItemMessage = false;
  bool showLostItemForm = false;
  bool showClaimHowToMessage = false;
  bool showClaimHowToResponse = false;
  bool showClaimStatusMessage = false;
  bool showClaimStatusResponse = false;
  bool showItemFoundMessage = false;
  bool showItemFoundResponse = false;

  void _onCustomerServiceTap() {
    setState(() {
      showCustomerServiceMessage = true;
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {
          showServiceTeamMessage = true;
        });
      }
    });

    Future.delayed(const Duration(milliseconds: 1300), () {
      if (mounted) {
        setState(() {
          showAdminResponse = true;
        });
      }
    });
  }

  void _onLostItemTap() {
    setState(() {
      showLostItemMessage = true;
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {
          showLostItemForm = true;
        });
      }
    });
  }

  void _onClaimHowToTap() {
    setState(() {
      showClaimHowToMessage = true;
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {
          showClaimHowToResponse = true;
        });
      }
    });
  }

  void _onClaimStatusTap() {
    setState(() {
      showClaimStatusMessage = true;
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {
          showClaimStatusResponse = true;
        });
      }
    });
  }

  void _onItemFoundTap() {
    setState(() {
      showItemFoundMessage = true;
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {
          showItemFoundResponse = true;
        });
      }
    });
  }

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
              GestureDetector(
                onTap: _onLostItemTap,
                child: _buildTopicItem('Kehilangan barang? Laporkan di sini'),
              ),
              _buildDivider(),
              GestureDetector(
                onTap: _onClaimHowToTap,
                child: _buildTopicItem('Bagaimana cara klaim barang ditemukan?'),
              ),
              _buildDivider(),
              GestureDetector(
                onTap: _onClaimStatusTap,
                child: _buildTopicItem('Apa status klaim barang saya?'),
              ),
              _buildDivider(),
              GestureDetector(
                onTap: _onItemFoundTap,
                child: _buildTopicItem('Apakah barang saya sudah ditemukan?'),
              ),
              _buildDivider(),
              GestureDetector(
                onTap: _onCustomerServiceTap,
                child: Center(
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
              ),
            ],
          ),
        ),
        if (showLostItemMessage) ...[
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 60, right: 13),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: const BoxDecoration(
                  color: Color(0xFF7F0408),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(17),
                    bottomLeft: Radius.circular(17),
                    bottomRight: Radius.circular(17),
                  ),
                ),
                child: Text(
                  'Kehilangan barang? Laporkan di sini',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
        if (showLostItemForm) ...[
          const SizedBox(height: 16),
          Container(
            margin: const EdgeInsets.only(left: 13, right: 60),
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: Color(0xFF7F0408),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(17),
                bottomLeft: Radius.circular(17),
                bottomRight: Radius.circular(17),
              ),
            ),
            child: Text(
              'Form Kehilangan Barang\n'
              'Nama barang :\n'
              'Ciri ciri barang :\n'
              'Kronologi kehilangan :',
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                height: 1.6,
              ),
            ),
          ),
        ],
        if (showClaimHowToMessage) ...[
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 50, right: 13),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: const BoxDecoration(
                  color: Color(0xFF7F0408),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(17),
                    bottomLeft: Radius.circular(17),
                    bottomRight: Radius.circular(17),
                  ),
                ),
                child: Text(
                  'Bagaimana cara klaim barang ditemukan?',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
        if (showClaimHowToResponse) ...[
          const SizedBox(height: 16),
          Container(
            margin: const EdgeInsets.only(left: 13, right: 50),
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: Color(0xFF7F0408),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(17),
                bottomLeft: Radius.circular(17),
                bottomRight: Radius.circular(17),
              ),
            ),
            child: Text(
              'Untuk klaim barang ditemukan:\n'
              '1. Buka aplikasi Seekers\n'
              '2. Masuk ke menu "Katalog Barang"\n'
              '3. Pilih barang yang sesuai\n'
              '4. Isi form klaim barang untuk verifikasi kepemilikan\n'
              '5. Upload bukti kepemilikan\n'
              '6. Tunggu konfirmasi dari tim kami',
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                height: 1.6,
              ),
            ),
          ),
        ],
        if (showClaimStatusMessage) ...[
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 70, right: 13),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: const BoxDecoration(
                  color: Color(0xFF7F0408),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(17),
                    bottomLeft: Radius.circular(17),
                    bottomRight: Radius.circular(17),
                  ),
                ),
                child: Text(
                  'Apa status klaim barang saya?',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
        if (showClaimStatusResponse) ...[
          const SizedBox(height: 16),
          Container(
            margin: const EdgeInsets.only(left: 13, right: 70),
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: Color(0xFF7F0408),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(17),
                bottomLeft: Radius.circular(17),
                bottomRight: Radius.circular(17),
              ),
            ),
            child: Text(
              'Status klaim Anda saat ini:\n'
              'Klaim ID: #CL240707001\n'
              'Status: Sedang diverifikasi\n'
              'Tanggal pengajuan: 21 Mei 2025\n'
              'Estimasi selesai: 1-2 hari kerja\n\n'
              'Kami akan memberikan notifikasi jika ada update status.',
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                height: 1.6,
              ),
            ),
          ),
        ],
        if (showItemFoundMessage) ...[
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 60, right: 13),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: const BoxDecoration(
                  color: Color(0xFF7F0408),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(17),
                    bottomLeft: Radius.circular(17),
                    bottomRight: Radius.circular(17),
                  ),
                ),
                child: Text(
                  'Apakah barang saya sudah ditemukan?',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
        if (showItemFoundResponse) ...[
          const SizedBox(height: 16),
          Container(
            margin: const EdgeInsets.only(left: 13, right: 60),
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: Color(0xFF7F0408),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(17),
                bottomLeft: Radius.circular(17),
                bottomRight: Radius.circular(17),
              ),
            ),
            child: Text(
              'Berdasarkan laporan kehilangan Anda:\n'
              'Laporan ID: #LP240707001\n'
              'Barang: Tas ransel hitam\n'
              'Status: Belum ditemukan\n'
              'Tanggal laporan: 27 Juni 2025\n\n'
              'Tim kami masih terus mencari. Kami akan segera menghubungi Anda jika ada kabar.',
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                height: 1.6,
              ),
            ),
          ),
        ],
        if (showCustomerServiceMessage) ...[
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 80, right: 13),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: const BoxDecoration(
                  color: Color(0xFF7F0408),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(17),
                    bottomLeft: Radius.circular(17),
                    bottomRight: Radius.circular(17),
                  ),
                ),
                child: Text(
                  'Chat Customer Service',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
        if (showServiceTeamMessage) ...[
          const SizedBox(height: 12),
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'Customer Service Team akan membantu Anda',
                style: GoogleFonts.poppins(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey[600],
                ),
              ),
            ),
          ),
        ],
        if (showAdminResponse) ...[
          const SizedBox(height: 12),
          Container(
            margin: const EdgeInsets.only(left: 13, right: 80),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: const BoxDecoration(
              color: Color(0xFF7F0408),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(17),
                bottomLeft: Radius.circular(17),
                bottomRight: Radius.circular(17),
              ),
            ),
            child: Text(
              'Hallo Liona, Perkenalkan aku admin dari #S120 dan Seekers Whoosh.\nApa ada yang bisa dibantu?',
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ],
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