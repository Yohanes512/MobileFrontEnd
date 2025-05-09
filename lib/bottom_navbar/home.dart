import 'package:flutter/material.dart';
import 'package:project_1/recipe.dart';
import 'package:project_1/premium/premium.dart';

class MenuItem {
  final int id;
  final String label;
  final IconData icon;

  MenuItem(this.id, this.label, this.icon);
}

List<MenuItem> menuItems = [
  MenuItem(1, 'Sushi', Icons.ramen_dining),
  MenuItem(2, 'Pizza', Icons.local_pizza),
  MenuItem(3, 'Burger', Icons.fastfood),
];

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _Homepage();
}

class _Homepage extends State<Homepage> {
  MenuItem? selectedMenu;
  final TextEditingController menuController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(170),
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
                            'What would you like to cook today?',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      CircleAvatar(backgroundImage: AssetImage('profile.jpg')),
                    ],
                  ),

                  const SizedBox(height: 16),

                  DropdownMenu<MenuItem>(
                    controller: menuController,
                    width: MediaQuery.of(context).size.width - 40,
                    hintText: "Select Menu",
                    requestFocusOnTap: true,
                    enableFilter: true,
                    menuStyle: MenuStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                        Colors.lightBlue.shade50,
                      ),
                    ),
                    label: const Text('Select Menu'),
                    onSelected: (MenuItem? menu) {
                      setState(() {
                        selectedMenu = menu;
                        if (menu?.label == 'Sushi') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Sushi(),
                            ),
                          );
                        }
                      });
                    },
                    dropdownMenuEntries:
                        menuItems.map<DropdownMenuEntry<MenuItem>>((
                          MenuItem menu,
                        ) {
                          return DropdownMenuEntry<MenuItem>(
                            value: menu,
                            label: menu.label,
                            leadingIcon: Icon(menu.icon),
                          );
                        }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Categories
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Categories',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('See all', style: TextStyle(color: Colors.blue)),
                  ],
                ),

                const SizedBox(height: 12),

                // Category Icons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    _CategoryItem(
                      icon: Icons.free_breakfast,
                      label: 'Breakfast',
                    ),
                    _CategoryItem(icon: Icons.lunch_dining, label: 'Lunch'),
                    _CategoryItem(icon: Icons.dinner_dining, label: 'Dinner'),
                    _CategoryItem(icon: Icons.icecream, label: 'Dessert'),
                  ],
                ),

                const SizedBox(height: 24),

                // Go Premium
                const Text(
                  'Go Premium',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Unlock exclusive features and elevate your experience!',
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PremiumPage()),
                    );
                  },
                  child: const Text('Unlock Now'),
                ),

                const SizedBox(height: 10),

                //Recipe
                const Text("Recipe Populer"),
                SizedBox(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          _ImageCard('food1.jpg', 'Sushi'),
                          _ImageCard('food1.jpg', 'Sushi'),
                        ],
                      ),
                      Row(
                        children: [
                          _ImageCard('food1.jpg', 'Sushi'),
                          _ImageCard('food1.jpg', 'Sushi'),
                        ],
                      ),
                      Row(
                        children: [
                          _ImageCard('food1.jpg', 'Sushi'),
                          _ImageCard('food1.jpg', 'Sushi'),
                        ],
                      ),
                      Row(
                        children: [
                          _ImageCard('food1.jpg', 'Sushi'),
                          _ImageCard('food1.jpg', 'Sushi'),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 50),

                const Text("Last seen"),
                _ImageCard('food1.jpg', 'Sushi'),

                const SizedBox(height: 50),
                const Text("Newest Recipe"),
                Row(
                  children: [
                    _ImageCard('food1.jpg', 'Sushi'),
                    _ImageCard('food1.jpg', 'Sushi'),
                    _ImageCard('food1.jpg', 'Sushi'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _CategoryItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(radius: 24, child: Icon(icon, size: 28)),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
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
              width: 100,
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
