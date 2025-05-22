import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  void _showSwipeUpSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.8,
          child: DraggableScrollableSheet(
            expand: true,
            initialChildSize: 1.0,
            minChildSize: 0.5,
            maxChildSize: 1.0,
            builder: (_, controller) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                ),
                child: ListView(
                  controller: controller,
                  padding: const EdgeInsets.all(16),
                  children: const [
                    SizedBox(height: 12),
                    Center(
                      child: Text(
                        'Selamat Datang di Aplikasi Kami!',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Ini adalah contoh konten dari bottom sheet yang bisa kamu swipe ke atas. '
                      'Kamu bisa tambahkan form login, tombol, atau lainnya di sini.',
                    ),
                    SizedBox(height: 40),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              'landing_page.jpg',
              fit: BoxFit.cover,
            ),
          ),

          Center(
            child: Text(
              'Welcome',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'DancingScript',
                shadows: [
                  Shadow(
                    offset: Offset(2, 2),
                    blurRadius: 6,
                    color: Colors.black45,
                  ),
                ],
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () => _showSwipeUpSheet(context),
              child: Container(
                height: 80,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.keyboard_arrow_up,
                    size: 30,
                    color: Colors.grey[700],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}