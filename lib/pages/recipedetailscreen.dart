import 'package:flutter/material.dart';

class Recipedetail extends StatefulWidget {
  const Recipedetail({super.key});

  @override
  State<Recipedetail> createState() => _RecipedetailState();
}

class _RecipedetailState extends State<Recipedetail> {
  List<Map<String, String>> ingredients = [
    {"name": "Bread", "quantity": "200g", "icon": "assets/bread.jpg"},
    {"name": "Eggs", "quantity": "200g", "icon": "assets/egg.jpg"},
    {"name": "Milk", "quantity": "200g", "icon": "assets/milk.jpg"},
    {"name": "Butter", "quantity": "200g", "icon": "assets/butter.jpg"},
    {"name": "Vanilla", "quantity": "200g", "icon": "assets/vanilla.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('How to make french toast'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Back action
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // More options action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: screenSize.width * 0.05,
          vertical: screenSize.height * 0.02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Featured Image and Recipe Info
            LayoutBuilder(
              builder: (context, constraints) {
                return Stack(
                  children: [
                    Container(
                      height: screenSize.height * 0.25,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: const DecorationImage(
                          image: AssetImage(
                              'assets/frenchtoast.jpg'), // Add your image
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: IconButton(
                        icon: const Icon(Icons.play_circle_filled,
                            color: Colors.white, size: 50),
                        onPressed: () {
                          // Play video action
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: screenSize.height * 0.02),

            // Rating and Chef Info
            Row(
              children: [
                const Icon(Icons.star, color: Colors.orange),
                const SizedBox(width: 4),
                const Text('4.5', style: TextStyle(fontSize: 16)),
                const SizedBox(width: 4),
                const Text('(300 Reviews)',
                    style: TextStyle(color: Colors.grey)),

                const Spacer(),

                // Follow Section
                CircleAvatar(
                  backgroundImage:
                      const AssetImage('assets/chef.jpg'), // Add chef image
                  radius: screenSize.width * 0.06,
                ),
                const SizedBox(width: 8),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Roberta Anny',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Bali, Indonesia',
                        style: TextStyle(color: Colors.grey)),
                  ],
                ),
                SizedBox(width: screenSize.width * 0.04),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: const Text('Follow'),
                  onPressed: () {
                    // Follow action
                  },
                ),
              ],
            ),

            SizedBox(height: screenSize.height * 0.02),

            // Ingredients List
            const Text(
              'Ingredients',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: screenSize.height * 0.01),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: ingredients.length,
              itemBuilder: (context, index) {
                return _buildIngredientItem(ingredients[index], screenSize);
              },
            ),
          ],
        ),
      ),
    );
  }

  // Widget for each ingredient row
  Widget _buildIngredientItem(Map<String, String> ingredient, Size screenSize) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      margin: EdgeInsets.symmetric(vertical: screenSize.height * 0.01),
      child: ListTile(
        leading: Image.asset(
          ingredient['icon']!, // Icon for each ingredient
          height: screenSize.height * 0.06,
          width: screenSize.width * 0.1,
        ),
        title: Text(ingredient['name']!),
        trailing: Text(ingredient['quantity']!),
      ),
    );
  }
}
