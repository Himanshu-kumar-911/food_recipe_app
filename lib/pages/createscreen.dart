import 'package:flutter/material.dart';
import 'package:food_recipe_app/pages/profilescreen.dart';

class Createscreen extends StatefulWidget {
  const Createscreen({super.key});

  @override
  State<Createscreen> createState() => _CreatescreenState();
}

class _CreatescreenState extends State<Createscreen> {
  int serves = 1;
  int cookTime = 45;
  List<Map<String, dynamic>> ingredients = [
    {"name": "Chicken", "quantity": "250gr"},
    {"name": "Rice", "quantity": "150gr"},
  ];

  TextEditingController recipeTitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create recipe"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Back action
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // More options action
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image section
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: const DecorationImage(
                  image: AssetImage(
                      'assets/bento_box_image.png'), // Add image in assets
                  fit: BoxFit.cover,
                ),
              ),
              child: IconButton(
                icon: const Icon(Icons.edit, color: Colors.white),
                onPressed: () {
                  // Image edit action
                },
              ),
            ),

            const SizedBox(height: 16.0),

            // Recipe Title TextField
            TextField(
              controller: recipeTitleController,
              decoration: const InputDecoration(
                labelText: 'Recipe Title',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16.0),

            // Serves and Cook Time
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildServesSection(),
                _buildCookTimeSection(),
              ],
            ),

            const SizedBox(height: 16.0),

            // Ingredients Section
            const Text('Ingredients', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8.0),
            Column(
              children: ingredients
                  .map(
                    (ingredient) => _buildIngredientRow(ingredient),
                  )
                  .toList(),
            ),
            const SizedBox(height: 8.0),

            // Add Ingredient button
            ElevatedButton.icon(
              icon: const Icon(Icons.add),
              label: const Text("Add new Ingredient"),
              onPressed: () {
                // Add new ingredient action
                setState(() {
                  ingredients.add({"name": "", "quantity": ""});
                });
              },
            ),

            const SizedBox(height: 16.0),

            // Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  backgroundColor: Colors.red,
                ),
                child: const Text('Save my recipes', style: TextStyle(fontSize: 18)),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Profilescreen()),
                  ); // Save action
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget to build "Serves" section
  Widget _buildServesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Serves', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4.0),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.remove_circle_outline),
              onPressed: serves > 1
                  ? () {
                      setState(() {
                        serves--;
                      });
                    }
                  : null,
            ),
            Text(serves.toString(), style: const TextStyle(fontSize: 16)),
            IconButton(
              icon: const Icon(Icons.add_circle_outline),
              onPressed: () {
                setState(() {
                  serves++;
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  // Widget to build "Cook Time" section
  Widget _buildCookTimeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Cook time', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4.0),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.remove_circle_outline),
              onPressed: cookTime > 0
                  ? () {
                      setState(() {
                        cookTime -= 5;
                      });
                    }
                  : null,
            ),
            Text('$cookTime min', style: const TextStyle(fontSize: 16)),
            IconButton(
              icon: const Icon(Icons.add_circle_outline),
              onPressed: () {
                setState(() {
                  cookTime += 5;
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  // Widget to build an ingredient row
  Widget _buildIngredientRow(Map<String, dynamic> ingredient) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Item name',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  ingredient['name'] = value;
                });
              },
              controller: TextEditingController(text: ingredient['name']),
            ),
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Quantity',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  ingredient['quantity'] = value;
                });
              },
              controller: TextEditingController(text: ingredient['quantity']),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              setState(() {
                ingredients.remove(ingredient);
              });
            },
          ),
        ],
      ),
    );
  }
}
