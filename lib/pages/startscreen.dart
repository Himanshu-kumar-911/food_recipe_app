import 'package:flutter/material.dart';
import 'package:food_recipe_app/pages/loginscreen.dart';


class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Use BoxConstraints to adjust layout based on screen size.
        return Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/startscreenbg.jpg'),
              fit: BoxFit.cover, // Adjust the background image
            ),
          ),
          child: Stack(
            children: [
              // Semi-transparent overlay for better text visibility
              Container(
                color: Colors.black.withOpacity(0.5),
              ),
              // Main content
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '60k+ Premium recipes',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.none, // Remove underline
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Let's Cooking",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none, // Remove underline
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Find best recipes for cooking',
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 16,
                        decoration: TextDecoration.none, // Remove underline
                      ),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to the login page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const MyLoginScreen(), // LoginScreen should be your login page
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent, // Button color
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Start cooking',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          decoration: TextDecoration.none, // Remove underline
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
