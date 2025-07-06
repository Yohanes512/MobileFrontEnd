import 'package:flutter/material.dart';
import 'package:project_1/recipe_data.dart';

class DynamicRecipePage extends StatelessWidget {
  final Recipe recipe;

  const DynamicRecipePage({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(recipe.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(recipe.imagePath),
            const SizedBox(height: 12),
            Text(
              recipe.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              "Ingredients:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            ...recipe.ingredients.map((i) => Text("• $i")),
            const SizedBox(height: 16),
            const Text("Steps:", style: TextStyle(fontWeight: FontWeight.bold)),
            ...recipe.steps.map((s) => Text("• $s")),
          ],
        ),
      ),
    );
  }
}
