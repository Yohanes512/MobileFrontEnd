import 'package:flutter/material.dart';
import 'personal_data.dart';
import 'notification.dart';
import 'language.dart';
import 'about.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  final List<String> menuItems = const [
    'Personal Data',
    'Notification',
    'Language',
    'About',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: menuItems.map((item) {
            return GestureDetector(
              onTap: () {
                if (item == 'Personal Data') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PersonalData(),
                    ),
                  );
                } else if (item == 'Notification') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NotificationPage(),
                    ),
                  );
                } else if (item == 'Language') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Language(),
                    ),
                  );
                } else if (item == 'About') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const About(),
                    ),
                  );
                }
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 16,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                width: double.infinity,
                child: Text(
                  item,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            );
          }).toList(),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
