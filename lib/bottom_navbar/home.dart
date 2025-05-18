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
      backgroundColor: Colors.grey[100],
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100), // Bisa diatur sesuka hati
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.only(
            top: 8, // ini jarak atas yang sangat kecil
            left: 20,
            right: 20,
            bottom: 10,
          ),
          child: SafeArea(
            bottom: false, // supaya SafeArea hanya untuk atas, bukan bawah
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Hello Yakuza',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'What would you like to cook today?',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage('profile.jpg'),
                      radius: 20,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                DropdownMenu<MenuItem>(
                  controller: menuController,
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
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 48),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Kategori dan konten lainnya tetap sama...
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Categories',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text('See all', style: TextStyle(color: Colors.blue)),
                  ],
                ),
                const SizedBox(height: 12),
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
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFFFD700), Color(0xFFFFA500)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orange.withOpacity(0.3),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Go Premium',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Unlock exclusive features and elevate your experience!',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.deepOrange,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PremiumPage(),
                            ),
                          );
                        },
                        child: const Text('Unlock Now'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  "Recipe Populer",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 12),
                _buildRecipeGrid(),
                const SizedBox(height: 30),
                const Text(
                  "Last seen",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 12),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: const [
                      _ImageCard('food1.jpg', 'Sushi'),
                      SizedBox(width: 12),
                      _ImageCard('food1.jpg', 'Sushi'),
                      SizedBox(width: 12),
                      _ImageCard('food1.jpg', 'Sushi'),
                      SizedBox(width: 12),
                      _ImageCard('food1.jpg', 'Sushi'),
                      SizedBox(width: 12),
                      _ImageCard('food1.jpg', 'Sushi'),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  "Newest Recipe",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: const [
                      _ImageCard('food1.jpg', 'Sushi'),
                      SizedBox(width: 12),
                      _ImageCard('food1.jpg', 'Sushi'),
                      SizedBox(width: 12),
                      _ImageCard('food1.jpg', 'Sushi'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRecipeGrid() {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: List.generate(
        6,
        (index) => const _ImageCard('food1.jpg', 'Sushi'),
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
        CircleAvatar(
          radius: 26,
          backgroundColor: Colors.orange.shade100,
          child: Icon(icon, size: 28, color: Colors.deepOrange),
        ),
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
