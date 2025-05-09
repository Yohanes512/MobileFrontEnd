import 'package:flutter/material.dart';


class Sushi extends StatelessWidget {
  const Sushi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'food1.jpg',
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 12),

            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "SUSHI",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: const [
                    Text("Patrick", style: TextStyle(fontSize: 14)),
                    SizedBox(width: 6),
                    CircleAvatar(
                      radius: 14,
                      backgroundImage: AssetImage('profile.jpg'),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 16),

            
            const Text(
              "Ingredients:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            const Text("• 2 cup of japanese rice"),
            const Text("• 2 1/2 cup of water"),
            const Text("• 3 sdm rice vinegar"),
            const SizedBox(height: 20),

            // Steps
            const Text(
              "Steps:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            const Text("• Wash Japanese rice 3–4 times until the water runs clear"),
            const Text("• Cook rice with 2 1/2 cups of water in a rice cooker or pan until cooked"),
            const Text("• Mix rice vinegar, sugar and salt, stir until dissolved"),
            const SizedBox(height: 12),
            const Divider(),

        
            const Text(
              "Comment",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: "Write a comment...",
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
