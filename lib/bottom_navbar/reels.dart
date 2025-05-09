import 'package:flutter/material.dart';
import 'package:project_1/recipe.dart';
import 'dart:ui';

class Reels extends StatefulWidget {
  const Reels({super.key});

  @override
  State<Reels> createState() => _ReelsState();
}

class _ReelsState extends State<Reels> {
  final items = List.generate(
    20,
    (i) => {
      'image': 'food1.jpg', // Ensure this path is correct in your project
      'caption': 'Item ${i + 1}',
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(130),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Greeting and Profile Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello Yakuza',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Will you find your recipe on the reels?',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text('Swipe right or left'),
                        ],
                      ),
                      CircleAvatar(backgroundImage: AssetImage('profile.jpg')),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: ScrollConfiguration(
        behavior: CustomScrollBehavior(),
        child: PageView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Center(
              child: Card(
                margin: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 100,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.deepPurple[50],
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: _ImageCard(item['image']!, item['caption']!),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

/// Custom ScrollBehavior to enable mouse dragging for PageView on desktop
class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.stylus,
    PointerDeviceKind.unknown,
  };
}

class _ImageCard extends StatelessWidget {
  final String imagePath;
  final String caption;

  const _ImageCard(this.imagePath, this.caption);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Sushi()),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              height: 140,
              width: 250,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            caption,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
