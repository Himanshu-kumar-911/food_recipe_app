import 'package:flutter/material.dart';
import 'package:food_recipe_app/pages/createscreen.dart';
import 'package:food_recipe_app/pages/editprofilescreen.dart';
import 'package:food_recipe_app/pages/homescreen.dart';
import 'package:food_recipe_app/pages/notificationscreen.dart';
import 'package:food_recipe_app/pages/savescreen.dart';

class Profilescreen extends StatefulWidget {
  final String? name;
  final String? bio;
  const Profilescreen({super.key, this.name, this.bio});

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
  int _selectedIndex = 4; // Set initial index to Profile tab

  void _onNavigationItemSelected(int index) {
    setState(() {
      _selectedIndex = index; // Update selected index
    });

    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  const Homescreen()), // Replace with the actual Home screen
        );
        break;
      case 1:
        // Navigate to Bookmark page
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  const Savescreen()), // Replace with Bookmark screen
        );
        break;
      case 2:
        // Navigate to Add Video screen
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  const Createscreen()), // Replace with Add Video screen
        );
        break;
      case 3:
        // Navigate to Notifications page
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  const Notificationscreen()), // Replace with Notification screen
        );
        break;
      case 4:
        // Stay on Profile page
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: HomeScreen(), // Load HomeScreen as the profile page content
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex, // Reflect the selected index
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '',
          ),
        ],
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        onTap: _onNavigationItemSelected, // New callback function
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.05),
            _buildHeader(),
            const SizedBox(height: 20),
            _buildProfileInfo(context), // Pass the context to the method
            const SizedBox(height: 20),
            _buildTabBar(),
            const SizedBox(height: 20),
            _buildRecipeList(size),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "My profile",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        Icon(Icons.more_vert),
      ],
    );
  }

  Widget _buildProfileInfo(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 40,
          backgroundImage:
              AssetImage('assets/profile.jpg'), // Replace with actual image
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Himanshu Kumar",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                "Hello world! I'm Himanshu Kumar, I'm from India 🇮🇹 I love cooking so much!",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildProfileStat("Recipe", "3"),
                  _buildProfileStat("Videos", "13"),
                  _buildProfileStat("Followers", "14K"),
                  _buildProfileStat("Following", "120"),
                ],
              ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {
            // Navigate to Edit Profile screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const EditProfile()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          child: const Text("Edit profile"),
        ),
      ],
    );
  }

  Widget _buildProfileStat(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildTabBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            // Handle switching to Video tab
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              "Video",
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            // Handle switching to Recipe tab
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              "Recipe",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRecipeList(Size size) {
    return Column(
      children: [
        _buildRecipeCard(
          "How to make Italian noodles at home",
          "assets/noodles.jpg",
          "12 Ingredients | 40 min",
          5.0,
          size,
        ),
        _buildRecipeCard(
          "Simple chicken meal prep dishes",
          "assets/chicken.jpg",
          "12 Ingredients | 40 min",
          4.7,
          size,
        ),
        _buildRecipeCard(
          "Japanese fried rice",
          "assets/friedrice.jpg",
          "12 Ingredients | 40 min",
          4.7,
          size,
        ),
      ],
    );
  }

  Widget _buildRecipeCard(
      String title, String image, String subtitle, double rating, Size size) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.asset(
              image,
              width: size.width,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.orange, size: 16),
                    const SizedBox(width: 5),
                    Text(
                      rating.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
