import 'package:flutter/material.dart';

class Displaydetail extends StatelessWidget {
  final String recipeTitle;
  final String recipeImage;
  final String recipeDescription;
  final List<String> ingredients;
  final List<String> steps;

  Displaydetail({
    required this.recipeTitle,
    required this.recipeImage,
    required this.recipeDescription,
    required this.ingredients,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipeTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Recipe Image
            Image.network(
              recipeImage,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),

            // Recipe Title
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                recipeTitle,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),

            // Recipe Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                recipeDescription,
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
            ),

            // Ingredients Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Ingredients",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: ingredients.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.check_circle, color: Colors.green),
                    title: Text(ingredients[index]),
                  );
                },
              ),
            ),

            // Steps Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Steps",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: steps.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text((index + 1).toString()),
                    ),
                    title: Text(steps[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
