import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle headingStyle = const TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
    TextStyle contentStyle = const TextStyle(fontSize: 14, height: 1.5);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About Our App',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Text('What is Simple Recipe?', style: headingStyle),
            const SizedBox(height: 8),
            Text(
              'Magic Recipe is an innovative application designed to provide the best experience in [app purpose, e.g., exploring recipes, ordering food, managing diet, etc.]. '
              'It features an intuitive user interface and a rich set of features to help users easily access the services they need.',
              style: contentStyle,
            ),
            const SizedBox(height: 24),

            Text('Why Use Simple Recipe?', style: headingStyle),
            const SizedBox(height: 8),
            bulletPoint('User-Friendly: A simple and intuitive interface for all age groups.'),
            bulletPoint('Fast & Lightweight: Optimized performance without burdening your device.'),
            bulletPoint('Free (or Subscription Model with Exclusive Benefits).'),
            bulletPoint('Regular Updates & Support: Our team is dedicated to continuously improving the app based on user needs.'),
            const SizedBox(height: 24),

            Text('Contact Us', style: headingStyle),
            const SizedBox(height: 8),
            contactRow(CupertinoIcons.mail, 'Email: yorekx@gmail.com'),
            contactRow(CupertinoIcons.phone, 'Phone: 0878123456789'),
            contactRow(CupertinoIcons.globe, 'Website: SimpleRecipe.com'),
            contactRow(CupertinoIcons.at, 'Instagram: Simple_Recipe'),
            const SizedBox(height: 24),

            const Text(
              'Thank you for using Simple Recipe! We hope this app brings you convenience and value.',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  Widget bulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(fontSize: 16)),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 14))),
        ],
      ),
    );
  }

  Widget contactRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          Icon(icon, size: 18),
          const SizedBox(width: 8),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 14))),
        ],
      ),
    );
  }
}