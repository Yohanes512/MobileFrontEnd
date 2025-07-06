import 'package:flutter/material.dart';
import 'package:project_1/recipe_data.dart';

class RecipeFormPage extends StatefulWidget {
  const RecipeFormPage({super.key});

  @override
  State<RecipeFormPage> createState() => _RecipeFormPageState();
}

class _RecipeFormPageState extends State<RecipeFormPage> {
  final TextEditingController menuNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  List<TextEditingController> ingredients = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  List<TextEditingController> steps = [
    TextEditingController(),
    TextEditingController(),
  ];

  void addIngredient() {
    setState(() {
      ingredients.add(TextEditingController());
    });
  }

  void addStep() {
    setState(() {
      steps.add(TextEditingController());
    });
  }

  Widget uploadButton() {
    return Container(
      margin: const EdgeInsets.only(top: 8, bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Icon(Icons.camera_alt, size: 40),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(75),
        child: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          flexibleSpace: Row(
            children: [
              SizedBox(width: 225),
              ElevatedButton(
                onPressed: () {
                  userRecipes.add(
                    Recipe(
                      title: menuNameController.text,
                      description: descriptionController.text,
                      ingredients: ingredients.map((e) => e.text).toList(),
                      steps: steps.map((e) => e.text).toList(),
                      imagePath:
                          'food1.jpg', // atau biarkan pengguna upload gambar
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade400,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text("Save"),
              ),
              SizedBox(width: 25),
              ElevatedButton(
                onPressed: () {
                  // handle form submission
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade400,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text("Publish"),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),

            // Menu name
            TextField(
              controller: menuNameController,
              decoration: InputDecoration(
                hintText: "Menu Name",
                fillColor: Colors.grey.shade200,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Description
            const Text(
              "Description",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: descriptionController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText:
                    "Write your description for your menu and your honest feeling on it!",
                fillColor: Colors.grey.shade200,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Ingredients
            const Text(
              "Ingredient",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...ingredients.asMap().entries.map(
              (entry) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: TextField(
                  controller: entry.value,
                  decoration: InputDecoration(
                    hintText: "Ingredient ${entry.key + 1}",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: addIngredient,
                child: const Text("Add new ingredient"),
              ),
            ),

            // Steps
            const SizedBox(height: 20),
            const Text("Steps", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ...steps.asMap().entries.map(
              (entry) => Column(
                children: [
                  TextField(
                    controller: entry.value,
                    decoration: InputDecoration(
                      hintText: "Step ${entry.key + 1}",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  uploadButton(),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: addStep,
                child: const Text("Add new steps"),
              ),
            ),

            // Upload Video
            const SizedBox(height: 20),
            const Text(
              "Upload Video",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            uploadButton(),

            // Upload Image
            const SizedBox(height: 16),
            const Text(
              "Upload Image ( Menu Thumbnail )",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            uploadButton(),

            // Finish Button
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
